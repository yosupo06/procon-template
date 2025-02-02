#!/usr/bin/env python3
# Requires-Module: rich

from enum import Enum
import subprocess
import argparse
from pathlib import Path
from rich.console import Console
from rich.text import Text
from rich.table import Table
import time
from dataclasses import dataclass
import difflib


class Status(Enum):
    PASS = 0
    FAIL = 1
    SKIP = 2


def get_color(result: Status) -> str:
    return {
        Status.PASS: "green",
        Status.FAIL: "red",
        Status.SKIP: "yellow"
    }.get(result, "white")


@dataclass
class Result:
    name: str
    status: Status
    time: float
    diff: str = ""


def run(target: Path, test: Path) -> Result:
    name = test.name

    with test.open('r') as f:
        start = time.perf_counter()
        process = subprocess.Popen(
            [target], stdin=f, stdout=subprocess.PIPE, text=True)
        actual = ""
        for line in process.stdout:
            print(line, end="")
            actual += line
        process.wait()
        end = time.perf_counter()

    consumed = end - start
    actual = actual.rstrip()

    answer_file = test.with_suffix('.out')
    if not answer_file.exists():
        return Result(name, Status.SKIP, consumed)
    with answer_file.open('r') as f:
        expect = f.read().rstrip()
        actual_lines = [line.rstrip() for line in actual.splitlines()]
        expect_lines = [line.rstrip() for line in expect.splitlines()]
        actual_norm = "\n".join(actual_lines)
        expect_norm = "\n".join(expect_lines)
        if actual_norm != expect_norm:
            diff = "\n".join(difflib.unified_diff(
                expect_lines, actual_lines,
                fromfile='expected', tofile='actual', lineterm=''))
            return Result(name, Status.FAIL, consumed, diff)
        else:
            return Result(name, Status.PASS, consumed)


def main():
    parser = argparse.ArgumentParser(description='Run tests.')
    parser.add_argument('target', help='The executable to test.')
    args = parser.parse_args()
    target = Path(args.target)

    tests_dir = target.parent / 'tests'

    console = Console()
    results: list[Result] = []

    for test in sorted(tests_dir.glob('*.in')):
        console.print(f"[TEST] {test.name}", style="bold blue")

        result = run(target, test)
        results.append(result)

        console.print(f"[{result.status.name}] {test.name} {result.time:.3f} secs",
                      style=f"bold {get_color(result.status)}")
        if result.diff:
            print(result.diff, flush=True)

    table = Table(title="Test Results")
    table.add_column("Name", justify="left", style="blue", no_wrap=True)
    table.add_column("Status", justify="center",)
    table.add_column("Time(s)", justify="right", style="cyan")

    for result in results:
        status_text = Text(result.status.name, style=get_color(result.status))
        table.add_row(result.name, status_text, f"{result.time:.3f}")

    console.print(table)


if __name__ == "__main__":
    main()
