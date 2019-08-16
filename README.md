## Projeto
- Dentro da pasta do projeto execute os seguintes comandos:
  - docker-compose build && docker-compose up -d

## Aplicação

- Raiz
  - http://localhost:8081
- Endpoint para conversão
  - http://localhost:8081/api/converter
- Exemplo
  - http://localhost:8081/api/converter?from=USD&to=BRL&amount=1

## Arquivos criados
- src/app/Http/Controllers/Api/ConverterCoinController.php
- src/app/Http/Request/ApiRequest.php
- src/app/Http/Request/ApiRequest.php
- src/app/Services/CryptoCompare.php
- src/app/ConverterCoin.php
- src/so tests/Feature/ConverterCoinTest.php


## Tecnologias utilizadas
- Laravel v5.8
- Redis v1.1
