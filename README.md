# Kurtosis GitHub Action

This GitHub Action integrates Kurtosis into your CI/CD pipeline, allowing you to leverage Kurtosis tests and environments directly within GitHub Actions workflows.

**Note** - This action currently supports Docker environments. For Kubernetes support, please reach out to [@h4ck3rk3y](https://github.com/h4ck3rk3y).

## Inputs

| Input              | Description                                                                                     | Required | Default        |
|--------------------|-------------------------------------------------------------------------------------------------|----------|----------------|
| `path`             | Path of the Kurtosis package (directory or URL).                                                | Yes      | N/A            |
| `args`             | Arguments to pass to Kurtosis, specified as a file path.                                        | No       | `''`           |
| `cloud_api_key`    | API key for Kurtosis Cloud. If not provided, tests will run locally.                            | No       | `''`           |
| `cloud_instance_id`| Instance ID for the Kurtosis Cloud environment. Required if `cloud_api_key` is provided.        | No       | `''`           |
| `version`          | The version of Kurtosis to use. If not specified, the latest version will be used.              | No       | `latest`       |


## Example Usage

```yaml
jobs:
  kurtosis-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Kurtosis Tests
        uses: kurtosis-tech/kurtosis-github-action@v1
        with:
          path: './path-to-your-kurtosis-package'
          args: './test-args.yaml'
          cloud_api_key: ${{ secrets.KURTOSIS_CLOUD_API_KEY }}
          cloud_instance_id: ${{ secrets.KURTOSIS_CLOUD_INSTANCE_ID }}
```

Or to run Kurtosis purely in CI without Cloud

```yaml
jobs:
  kurtosis-test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Kurtosis Tests
        uses: kurtosis-tech/kurtosis-github-action@v1
        with:
          path: './path-to-your-kurtosis-package'
```

You can visit the following - [cloud](https://github.com/kurtosis-tech/mern-package/pull/16) or [non-cloud](https://github.com/kurtosis-tech/mern-package/pull/15) to see this in action.

## Contributing

This GitHub Action is a work in progress, and contributions are welcome. Here are some of the planned improvements:

- [ ] Address concurrency issues with restarting the Kurtosis engine; current implementation assumes sequential execution.

## Support

For support, feature requests, or to contribute, please open an issue in the GitHub repository or reach out to @h4ck3rk3y.