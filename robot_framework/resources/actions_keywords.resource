*** Settings ***
Library           RequestsLibrary
Library           JSONLibrary
Resource          variables.robot
Resource    base_keywords.resource

*** Variables ***
${ACTIONS_URI}          ${BASE_URL}/actions
${SESSION_NAME}         workflow_tests


*** Keywords ***
## Base Keywords
authorized user in API session
    [Documentation]    Creates an API session
    [Arguments]    ${session_name}=${SESSION_NAME} 
    Create Session    ${session_name}    ${BASE_URL}

status code should be ${expected_code}
    Should Be Equal As Integers    ${RESPONSE.status_code}    ${expected_code}

JSON field '${field}' should be ${value}
    [Arguments]            ${json_field_path}
    ${json_resp}=          Convert String to JSON      ${RESPONSE.content}
    ${real_value0}=        Get Value From Json         ${json_resp}          ${json_field_path}
    ${real_value}=         Set Variable                ${real_value0[0]}
    ${compared_value}=     Convert To String           ${real_value}
    Should Be Equal        ${compared_value}           ${value}


## Actions Keywords

user requests all Workflows
    [Arguments]    ${session_name}=${SESSION_NAME}    ${expected_status_code}=200
    &{github_header}=    Set_Github_Header
    ${response}=    GET On Session    ${session_name}    ${ACTIONS_URI}/workflows    headers=&{github_header}    expected_status=ANY
    Fail_response_message    ${expected_status_code}    ${response}
    Should Be Equal As Integers    ${expected_status_code}    ${response.status_code}
    Set Suite Variable    ${RESPONSE}    ${response}


user requests one specific Workflow
    [Arguments]   ${workflow_id}     ${expected_status_code}=200    ${session_name}=${SESSION_NAME}
    &{github_header}=    Set_Github_Header
    ${response}=    GET On Session    ${session_name}    ${ACTIONS_URI}/workflows/${workflow_id}    headers=&{github_header}    expected_status=ANY
    Fail_response_message    ${expected_status_code}    ${response}
    Should Be Equal As Integers    ${expected_status_code}    ${response.status_code}
    Set Suite Variable    ${RESPONSE}    ${response}


user try to disable a Workflow
    [Arguments]    ${workflow_id}    ${expected_status_code}=204    ${session_name}=${SESSION_NAME}
    &{github_header}=    Set_Github_Header
    ${response}=    PUT On Session    ${session_name}    ${ACTIONS_URI}/workflows/${workflow_id}/disable    headers=&{github_header}    expected_status=ANY
    Fail_response_message    ${expected_status_code}    ${response}
    Should Be Equal As Integers    ${expected_status_code}    ${response.status_code}
    Set Suite Variable    ${RESPONSE}    ${response}


user try to create a dispatch event to a workflow
    [Arguments]    ${workflow_id}    ${body}    ${expected_status_code}=204    ${session_name}=${SESSION_NAME}
    &{github_header}=    Set_Github_Header
    ${response}=    POST On Session    ${session_name}    ${ACTIONS_URI}/workflows/${workflow_id}/dispatches    json=${body}    headers=&{github_header}    expected_status=ANY
    Fail_response_message    ${expected_status_code}    ${response}
    Should Be Equal As Integers    ${expected_status_code}    ${response.status_code}
    Set Suite Variable    ${RESPONSE}    ${response}


user try to delete a Workflow run
    [Arguments]    ${run_id}    ${expected_status_code}=204    ${session_name}=${SESSION_NAME}
    &{github_header}=    Set_Github_Header
    ${response}=    DELETE On Session    ${session_name}    ${ACTIONS_URI}/runs/${run_id}    headers=&{github_header}    expected_status=ANY
    Fail_response_message    ${expected_status_code}    ${response}
    Should Be Equal As Integers    ${expected_status_code}    ${response.status_code}
    Set Suite Variable    ${RESPONSE}    ${response}


Reenable a Workflow
    [Arguments]    ${workflow_id}
    Create Session    ${session_name}    ${BASE_URL}
    &{github_header}=    Set_Github_Header
    &{github_header}=    Create Dictionary    Content-Type=${CONTENT_TYPE}    Accept=${GITHUB_ACCEPT}    X-GitHub-Api-Version=2022-11-28    Authorization=Bearer ${GITHUB_TOKEN}
    ${response}=    PUT On Session    ${session_name}    ${ACTIONS_URI}/workflows/${workflow_id}/enable    headers=&{github_header}    expected_status=204
    Fail_response_message          204    ${response}
    Should Be Equal As Integers    204    ${response.status_code}