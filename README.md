# Running git in an AWS Lambda function

This repository demonstrates how you can run the `git` binary. Inside an AWS Lambda function.

For more details please read this [blog](https://binx.io/blog/2022/03/24/running-a-git-binary-in-aws-lambda/) post.

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
