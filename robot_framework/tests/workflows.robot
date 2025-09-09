*** Settings ***
Documentation     A test suite for workflow endpoints.
...
Resource          ../resources/base_keywords.resource
Resource          ../resources/actions_keywords.resource
Default Tags      actions

Test Teardown     Close API Session

*** Variables ***
${EXISTING_WORKFLOW_ID}    123
${NON_EXISTING_ID}    99999999


*** Test Cases ***
List all Workflows from Repo
    Given authorized user in API session
    When user requests all Workflows
    Then status code should be ${200}
    And JSON field 'total_count' should be 2    $.total_count


Get non-existing Workflow
    Given authorized user in API session
    When user requests one specific Workflow    workflow_id=${NON_EXISTING_ID}    expected_status_code=404
    Then status code should be ${404}
    And JSON field 'message' should be Not Found    $.message


Disable an existing Workflow
    Given authorized user in API session
    When user try to disable a Workflow    ${EXISTING_WORKFLOW_ID}    204
    Then status code should be ${204}


Disable a non-existing Workflow
    Given authorized user in API session
    When user try to disable a Workflow    ${NON_EXISTING_ID}    404
    Then status code should be ${404}
    And JSON field 'message' should be Not Found    $.message


Create a dispatch event to an existing Workflow
    ${workflow_inputs}=    Create Dictionary    name=TestInput
    ${body}=    Create Dictionary    ref=main    inputs=${workflow_inputs}
    Given authorized user in API session
    When user try to create a dispatch event to a workflow    ${EXISTING_WORKFLOW_ID}    ${body}    204
    Then status code should be ${204}


Create a dispatch event to a non-existing Workflow
    ${workflow_inputs}=    Create Dictionary    name=TestInput
    ${body}=    Create Dictionary    ref=main    inputs=${workflow_inputs}
    Given authorized user in API session
    When user try to create a dispatch event to a workflow    ${NON_EXISTING_ID}    ${body}    404
    Then status code should be ${404}
    And JSON field 'message' should be Not Found    $.message


Delete a non-existing Workflow run
    Given authorized user in API session
    When user try to delete a Workflow run    ${NON_EXISTING_ID}    404
    Then status code should be ${404}
