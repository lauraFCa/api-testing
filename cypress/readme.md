# Cypress API Testing

## Testes de API do Github - Escopo Issues

Este projeto demonstra como automatizar testes de API utilizando o Cypress, com execução contínua via GitHub Actions.  
Especificamente utlizando a API do Github, no escopo de Issues.

## Estrutura do Projeto

```
cypress/
├── readme.md
├── e2e/
│   └── api-tests/
│       └── issues.cy.js
├── fixtures/
│   └── issues.json
├── support/
│   ├── commands.js
│   └── e2e.js
```

- **e2e/api-tests/**: Casos de teste automatizados para a API do Github (Issues).
- **fixtures/**: Dados de apoio para os testes (ex: payloads de issues).
- **support/**: Comandos customizados e configurações globais do Cypress.

## Como Executar os Testes

1. Instale as dependências:
	```powershell
	npm install
	```

2. Defina o token do Github como variável de ambiente (recomendado):
	```powershell
	$env:GITHUB_TOKEN="seu_token"
	```
	Ou edite o valor em `cypress.config.js` (campo `env.GITHUB_TOKEN`).

3. Execute os testes:
	```powershell
	npx cypress run
	```
	Ou, para abrir a interface interativa:
	```powershell
	npx cypress open
	```

## Integração Contínua

Os testes são executados automaticamente via GitHub Actions a cada push na branch `main`.  
O workflow está definido em `cypress_api_tests.yml` e gera relatórios acessíveis como artefato.

- [Workflow](https://github.com/lauraFCa/api-testing/actions/workflows/cypress_api_tests.yml)

## Principais Bibliotecas

- [Cypress](https://www.cypress.io/)

---
Este projeto é mantido para fins de demonstração de automação de testes de API.
