# wine-order-service Concourse pipeline

This pipeline was generated using [Jetstream](https://github.com/hellofresh/jetstream) and is powered by the [SCM Back-end Chapter](https://hellofresh.atlassian.net/wiki/display/SBC/SCM+Back-end+Chapter+Home).

To set the pipeline do the following from project root folder:

```BASH
# Login to concourse
fly -t special-wine login --team-name wine --concourse-url https://ci-special.hellofresh.io:8081/
# Set pipeline
FLY_TARGET=special-wine ./ci/set-pipeline.sh
```
