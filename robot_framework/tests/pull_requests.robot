*** Settings ***
Documentation     A test suite for Github Pull Requests endpoints.
...
Resource          ../resources/base_keywords.resource
Resource          ../resources/pull-requests_keywords.resource
Default Tags      pull-requests

Test Teardown     Close API Session

*** Variables ***
${EXISTING_PR_ID}    1
${NON_EXISTING_ID}    99999999


*** Test Cases ***
List all Pull Requests from Repo
    Given pull-requests session request
    When user requests all Pull Requests
    Then status code should be ${200}
    And JSON field 'draft' should be False    $[0].draft


Update a non existing Pull Request
    ${updated_body}=   Create Dictionary    title=Updated PR Title    body=This is an updated description for the PR.    state=open
    Given pull-requests session request
    When user try to update Pull Request with ID ${NON_EXISTING_ID}    ${updated_body}    expected_status_code=404
    Then status code should be ${404}

List all Review Comments from a Pull Request
    Given pull-requests session request
    When user requests all Comments in Pull Request with ID ${EXISTING_PR_ID}
    Then status code should be ${200}
    JSON array field should have 0 items    $