# API Testing

Repositório de automação de testes de API utilizando duas abordagens e ferramentas distintas: **Robot Framework** e **Cypress**.  
O objetivo é demonstrar práticas modernas de automação para APIs REST, especialmente com foco na API do GitHub (Issues, Actions e Pull Requests).

---

## Estrutura do Repositório

```
api-testing/
├── cypress/
│   └── ...
├── robot_framework/
│   └── ...
├── readme.md  (este arquivo)
```

- **cypress/**: Projeto de testes de API usando Cypress.
- **robot_framework/**: Projeto de testes de API usando Robot Framework.

---

## Projetos

### 1. Robot Framework API Testing

Automação de testes de API utilizando Robot Framework, com foco em Actions e Pull Requests do GitHub.

- **Documentação completa:** [`robot_framework/readme.md`](robot_framework/readme.md)
- **Execução via GitHub Actions:** [Workflow](https://github.com/lauraFCa/api-testing/actions/workflows/robot_api_tests.yml)
- **Resultados:** [Página de resultados](https://laurafca.github.io/api-testing/)

Principais tópicos:
- Estrutura modular com recursos e keywords customizadas
- Relatórios em HTML gerados automaticamente
- Execução paralela com pabot

### 2. Cypress API Testing

Automação de testes de API utilizando Cypress, com foco em Issues do GitHub.

- **Documentação completa:** [`cypress/readme.md`](cypress/readme.md)
- **Execução via GitHub Actions:** [Workflow](https://github.com/lauraFCa/api-testing/actions/workflows/cypress_api_tests.yml)

Principais tópicos:
- Testes organizados em specs JavaScript
- Uso de fixtures para dados de teste
- Comandos customizados para requisições à API do GitHub

---

## Como Executar Localmente

Consulte os readmes de cada projeto para instruções detalhadas:
- [Robot Framework](robot_framework/readme.md)
- [Cypress](cypress/readme.md)

---

## Integração Contínua

Os dois projetos possuem pipelines de CI configurados no GitHub Actions, garantindo execuções automáticas a cada push na branch principal e geração de artefatos de relatório.

---

Este repositório é mantido para fins educacionais e demonstração de automação de testes de API.
