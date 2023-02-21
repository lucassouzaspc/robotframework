*** Settings ***
Documentation    Exercício 7 - https://petstore.swagger.io/
...              Realizar o seguinte fluxo de API
...              Realizar login
...              Criar um usuário
...              Atualizar um usuário
...              Deletar um usuário
...              Criar usuário com array
...              Validar usuários criados com array

Library    RequestsLibrary
Library    Collections

Resource    ../../../resources/base.robot
Resource    Keywords.robot

# Suite Setup      Open Session
# Test Teardown    Close Session

*** Variables ***
${urlBase}             https://petstore.swagger.io
${Query Parameters}    ?username=Userpetname&password=passPet
${HTTP Method}         GET
${Headers}             content-type=application/json

${payloadUser}    {"username": "Userpetname",
...               "firstName": "UserpetFirstName",
...               "lastName": "UserpetLastName",
...               "email": "userpet@pet.com",
...               "password": "passPet",
...               "phone": "82987881116",
...               "userStatus": 0}

${payloadUserArray}    {"username": "UserpetnameArray",
...                    "firstName": "UserpetFirstName",
...                    "lastName": "UserpetLastName",
...                    "email": "userpet@pet.com",
...                    "password": "passPet",
...                    "phone": "82987881116",
...                    "userStatus": 0}

*** Test Cases ***
Realizar login
    Realizar login    Userpetname    passPet

Criar usuario
    Criar um usuario    ${payloadUser}


Atualizar usuario
    Atualizar um usuario    Userpetname    ${payloadUser}

Deletar usuario
    Deletar um usuario    Userpetname

Criar usuario com array
    Criar um usuario com array    [${payloadUserArray}]

Validar usuario criado com array
    Validar usuario criado com array    UserpetnameArray
