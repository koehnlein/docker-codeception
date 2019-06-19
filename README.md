# Codeception

Docker image to run your automated acceptance tests in deplyoment pipelines, e.g. GitLab CI.

## Docker Images

* `akoehnlein/codeception`
* `akoehnlein/codeception:nodejs` (including node.js and npm)

## GitLab CI

Update your `.gitlab-ci.yml` file:

```yml
stages:
  - acceptance

test staging after deployment:
  stage: acceptance
  image: akoehnlein/codeception
  services:
    - name: selenium/standalone-chrome
      alias: selenium
  variables:
    SELENIUM_HOST: 'selenium'
  script:
    - codecept run --html
  artifacts:
    paths:
      - tests/_output/
    expire_in: 2 weeks
```

Update your `codeception.yml` file:

```yml
params:
    - env # load params from environment vars
```

Update your `tests/acceptance.suite.yml` file:

```yml
modules:
    enabled:
        - WebDriver:
            host: %SELENIUM_HOST%
```

If you have problems with fatal errors, telling "no such session", it can help to increase shared memory in your runner
configuration. [More information](https://github.com/laravel/dusk/issues/105#issuecomment-336762349)
