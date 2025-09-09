# Robot Framework Tests

Testings Github API - Actions scope

settings.json:  
`"robot.python.executable": "D:/api-testing/venv/Scripts/python.exe"`

Definindo o Github Token como variável de ambiente antes de executar os testes:
`$env:GITHUB_TOKEN="seu_token_aqui"; robot robot_framework/tests`



Full command to run with pabot:
`$env:GITHUB_TOKEN="YOU_TOKEN"; pabot --testlevelsplit --processes 5 --listener RetryFailed:1 --output robot_framework/report/output.xml --log robot_framework/report/log.html --report robot_framework/report/report.html robot_framework/tests`


Libraries:
- robotframework
- robotframework-requests
- robotframework-jsonlibrary
- robotframework-pabot