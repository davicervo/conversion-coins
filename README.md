## Projeto
- Dentro da pasta do projeto execute os seguintes comandos:
  - docker-compose build && docker-compose up -d
  - docker-compose exec app /bin/bash && composer install

## Aplicação

- Raiz
  - http://localhost:8081
- Endpoint para conversão
  - http://localhost:8081/api/converter
- Exemplo
  - http://localhost:8081/api/converter?from=USD&to=BRL&amount=1

## Arquivos criados
- app/Http/Controllers/Api/ConverterCoinController.php
- app/Http/Request/ApiRequest.php
- app/Http/Request/ApiRequest.php
- app/Services/CryptoCompare.php
- app/ConverterCoin.php
- tests/Feature/ConverterCoinTest.php


## Tecnologias utilizadas
- Laravel v5.8
- Redis v1.1
