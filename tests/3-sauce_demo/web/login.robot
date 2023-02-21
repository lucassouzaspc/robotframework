*** Settings ***
Documentation    Exercício 3 - Swag Labs(https://www.saucedemo.com/)
...              Efetuar login com cada um dos tipos de usuário disponíveis
...              Efetuar login com standard_user e mudar a forma de ordenação dos produtos; realizar também a compra de um produto qualquer e validar
...              Adicionar 3 itens a sacola e verificar a soma do valor total


Library    SeleniumLibrary

Resource    ../../../resources/base.robot
Resource    Keywords.robot

Test Setup       Open Session
Test Teardown    Close Session

***Test Cases***

Login usuarios OK
    @{users}=    Create List    standard_user    problem_user    performance_glitch_user
    FOR    ${user}    IN    @{users}
        Dado que acesso o site                      https://www.saucedemo.com/
        Quando realizo o login                      ${user}                       secret_sauce
        Entao verifico verifico sucesso no login
    END

Login usuarios NOK
    @{users}=    Create List    locked_out_user
    FOR    ${user}    IN    @{users}
        Dado que acesso o site                    https://www.saucedemo.com/
        Quando realizo o login                    ${user}                       secret_sauce
        Entao verifico verifico falha no login
    END
