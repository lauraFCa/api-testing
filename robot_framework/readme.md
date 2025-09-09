# Robot Framework API Testing


[Tests Results page](https://laurafca.github.io/api-testing/) |  [![Run Github API Tests](https://github.com/lauraFCa/api-testing/actions/workflows/api_tests.yml/badge.svg)](https://github.com/lauraFCa/api-testing/actions/workflows/api_tests.yml)
--|--


## Testings Github API - Actions and Pull Requests scope

This project demonstrates how to automate API tests using the Robot Framework, with continuous execution via GitHub Actions.  
The goal is to serve as a portfolio of test automation practices for REST APIs, especially for scenarios involving GitHub (Actions and Pull Requests).

## Project Structure

```
robot_framework/
├── readme.md
├── requirements.txt
├── report/
│   ├── log.html
│   ├── output.xml
│   └── report.html
├── resources/
│   ├── actions_keywords.resource
│   ├── base_keywords.resource
│   ├── pull-requests_keywords.resource
│   └── variables.robot
└── tests/
    ├── pull_requests.robot
    └── workflows.robot
```

- **requirements.txt**: Python dependencies
- **report/**: Reports generated after running tests.
- **resources/**: Resource files and custom keywords.
- **tests/**: Test cases organized by scope (Pull Requests and Workflows).


## How to Run Tests

1. Install dependencies
   ```powershell
   python -m venv venv
   .\venv\Scripts\Activate.ps1
   pip install -r robot_framework/requirements.txt
   ```

2. Set GitHub token as an environment variable
   ```powershell
   $env:GITHUB_TOKEN="your_token"
   ```

3. Run the tests:
   ```powershell
   robot robot_framework/tests
   ```
   Or, to use parallel execution with pabot, and retry feature from retryfailed:
   ```powershell
   $env:GITHUB_TOKEN="your_token"; pabot --testlevelsplit --processes 5 --listener RetryFailed:1 robot_framework/tests
   ```

## Continuous Integration

Tests are run automatically via GitHub Actions with each push to the `main` branch.  
The workflow is defined in `robot_api_tests.yml` and generates reports accessible as an artifact and via GitHub Pages.

- [Workflow](https://github.com/lauraFCa/api-testing/actions/workflows/api_tests.yml)
- [Results page](https://laurafca.github.io/api-testing/)


## Main libraries

- [robotframework](https://robotframework.org/)
- [robotframework-requests](https://docs.robotframework.org/docs/different_libraries/requests)
- [robotframework-jsonlibrary](https://robotframework-thailand.github.io/robotframework-jsonlibrary/JSONLibrary.html)
- [robotframework-pabot](https://docs.robotframework.org/docs/parallel)


