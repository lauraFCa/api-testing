*** Settings ***
Library           RequestsLibrary
Resource          variables.robot


*** Keywords ***
Close API Session
    [Documentation]    Close all API sessions
    Delete All Sessions


Set_Github_Header
    [Documentation]    Set the full header for GitHub API requests
    &{headers}=    Create Dictionary    Content-Type=${CONTENT_TYPE}    Accept=${GITHUB_ACCEPT}    X-GitHub-Api-Version=2022-11-28    Authorization=Bearer ${GITHUB_TOKEN}
    RETURN    ${headers}

Fail_response_message
    [Documentation]    Log response content if the status code is not as expected
    [Arguments]    ${expected_code}    ${RESPONSE}
    Run Keyword If    '${RESPONSE.status_code}' != '${expected_code}'    Log    ${RESPONSE.content}    WARN