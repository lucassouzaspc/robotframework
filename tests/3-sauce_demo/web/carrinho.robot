*** Settings ***
Documentation    Exercício 3 - Swag Labs(https://www.saucedemo.com/)
...              Efetuar login com cada um dos tipos de usuário disponíveis
...              Efetuar login com standard_user e mudar a forma de ordenação dos produtos;
...              realizar também a compra de um produto qualquer e validar
...              Adicionar 3 itens a sacola e verificar a soma do valor total


Library    SeleniumLibrary

Resource    ../../../resources/base.robot
Resource    Keywords.robot

Test Setup       Open Session
Test Teardown    Close Session

***Test Cases***

Login com usuario standard_user o preco dos produtos do menor para o maior
    Dado que acesso o site                             https://www.saucedemo.com/
    Quando realizo o login                             standard_user                 secret_sauce
    Entao consigo seleciono a ordencao dos produtos    Price (low to high)

Login com usuario standard_user compra de um produto
    Dado que acesso o site                      https://www.saucedemo.com/
    Quando realizo o login                      standard_user                 secret_sauce
    Adiciono o produto ao carrinho              Sauce Labs Bolt T-Shirt
    Verifico o carrinho                         Sauce Labs Bolt T-Shirt       15.99
    Realizo o checkout informando o endereco    PrimeiroNome                  SegundoNome                 123123123
    Finalizo a compra com sucesso               Item total: $15.99            THANK YOU FOR YOUR ORDER

Login com usuario standard_user adicionando três item ao carrinhos
    Dado que acesso o site                      https://www.saucedemo.com/
    Quando realizo o login                      standard_user                        secret_sauce
    Adiciono o produto ao carrinho              Sauce Labs Backpack
    Adiciono o produto ao carrinho              Sauce Labs Fleece Jacket
    Adiciono o produto ao carrinho              Test.allTheThings() T-Shirt (Red)
    Verifico o carrinho                         Sauce Labs Backpack                  29.99
    Verifico o carrinho                         Sauce Labs Fleece Jacket             49.99
    Verifico o carrinho                         Test.allTheThings() T-Shirt (Red)    15.99
    Realizo o checkout informando o endereco    PrimeiroNome                         SegundoNome                 123123123
    Finalizo a compra com sucesso               Item total: $95.97                   THANK YOU FOR YOUR ORDER

