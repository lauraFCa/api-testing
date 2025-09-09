*** Variables ***
${OWNER}    lauraFCa
${REPO}     api-testing
${BASE_URL}           https://api.github.com/repos/${OWNER}/${REPO}
${CONTENT_TYPE}       application/json
${GITHUB_ACCEPT}      application/vnd.github+json
${GITHUB_TOKEN}       %{GITHUB_TOKEN}