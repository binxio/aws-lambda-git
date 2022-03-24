# Running git in an AWS Lambda function

This repository demonstrates how you can run the `git` binary. Inside an AWS Lambda function.

## Building the dependencies

This will create a file called `libraries.zip`. This file contains the binary and the required dependencies to run git in the AWS Lambda function.

```bash
make build
```

## Invoke the Lambda function locally

When you want to invoke this repository locally, execute:

```bash
make invoke
```

## Cleanup

In order to remove all generated content execute:

```bash
make clean
```
