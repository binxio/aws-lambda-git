from typing import List, Any
import subprocess


def execute(command: List[str]) -> str:

    def capture(output: bytes):
        return output.decode("utf-8").strip("\n")

    response = subprocess.run(
        command,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        env={
            "PATH": "/var/task/bin",
            "PYTHONPATH": "/var/task/:/var/runtime",
            "LD_LIBRARY_PATH": "/var/task/lib",
        }
    )

    if response.returncode != 0:
        raise Exception(capture(response.stderr))

    return capture(response.stdout)


def handler(event: dict, context: Any) -> dict:
    version = execute(["git", "--version"])
    print(f"Git version: {version}")
    return {
        "Version": version
    }