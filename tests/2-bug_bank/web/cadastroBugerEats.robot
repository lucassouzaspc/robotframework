*** Settings ***
Documentation    BugBank(https://bugbank.netlify.app/)
...              Realizar o registro de um cliente selecionando a opção de criar um conta com saldo
...              e validar que o número da conta criada foi exibido com sucesso
...              Acessar o BugBak com o cliente criado e verificar que o acesso foi feito com sucesso
...              Obter um extrato da movimentação da conta


Library    SeleniumLibrary

Resource    ../../../resources/base.robot
Resource    Keywords.robot

Test Setup       Open Session
Test Teardown    Close Session

***Test Cases***

Registrar uma conta com saldo
    Dado que acesso o site
    ...                                    https://bugbank.netlify.app/
    Quando registro uma conta com saldo
    E realizo o login
    Entao acesso o extrato com salvo
