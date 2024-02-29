# Kurtosis GitHub Action

This GitHub Action integrates Kurtosis into your CI/CD pipeline, allowing you to run Kurtosis tests and environments directly within GitHub Actions workflows. 

This is particularly useful when doing integration or end-to-end tests for a service: simply write a Kurtosis package that includes an image built from the same repo via [`ImageBuildSpec`](https://docs.kurtosis.com/api-reference/starlark-reference/image-build-spec), and Kurtosis will handle both building the image and instantiating the environment.

**Note** - This action currently supports Docker environments. For Kubernetes support, please reach out to [@h4ck3rk3y](https://github.com/h4ck3rk3y).

## Inputs

| Input              | Description                                                                                     | Required | Default        |
|--------------------|-------------------------------------------------------------------------------------------------|----------|----------------|
| `path`             | Path of the Kurtosis package (directory or URL).                                                | Yes      | N/A            |
| `args-file`             | Arguments to pass to Kurtosis, specified as a file path.                                   | No       | `''`           |
| `cloud_api_key`    | API key for Kurtosis Cloud. If not provided, tests will run locally.                            | No       | `''`           |
| `cloud_instance_id`| Instance ID for the Kurtosis Cloud environment. Required if `cloud_api_key` is provided.        | No       | `''`           |
| `version`          | The version of Kurtosis to use. If not specified, the latest version will be used.              | No       | `latest`       |


## Example Usage

Running the Kurtosis test on your CI executor:

```yaml
jobs:
  kurtosis-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Kurtosis Tests
        uses: kurtosis-tech/kurtosis-github-action@v1
        with:
          path: 'github.com/my-org/my-kurtosis-package'  # Can also be the path to a Kurtosis package in the repo, e.g. './path/to/kurtosis-package'
          args-file: './test-args.yaml'
```

Running Kurtosis on Kurtosis Cloud:

```yaml
jobs:
  kurtosis-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Kurtosis Tests
        uses: kurtosis-tech/kurtosis-github-action@v1
        with:
          path: 'github.com/my-org/my-kurtosis-package'  # Can also be the path to a Kurtosis package in the repo, e.g. './path/to/kurtosis-package'
          args-file: './test-args.yaml'
          cloud_api_key: ${{ secrets.KURTOSIS_CLOUD_API_KEY }}
          cloud_instance_id: ${{ secrets.KURTOSIS_CLOUD_INSTANCE_ID }}
```

You can visit the following - [cloud](https://github.com/kurtosis-tech/mern-package/pull/16) or [non-cloud](https://github.com/kurtosis-tech/mern-package/pull/15) to see this in action.

## Contributing

This GitHub Action is a work in progress, and contributions are welcome. Here are some of the planned improvements:

- [ ] Address concurrency issues with restarting the Kurtosis engine; current implementation assumes sequential execution.

## Support

For support, feature requests, or to contribute, please open an issue in the GitHub repository or reach out to [@h4ck3rk3y](https://github.com/h4ck3rk3y).
