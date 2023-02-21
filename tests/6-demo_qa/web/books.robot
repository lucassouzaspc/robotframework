*** Settings ***
Documentation    Exercício 6-https://demoqa.com/books
...              Crie um teste parametrizado para realizar as seguintes ações
...              Logar na bookstore
...              Adicionar um livro à sua lista
...              Acessar o profile
...              Validar o livro adicionado à sua lista

Library    SeleniumLibrary

Resource    ../../../resources/base.robot
Resource    Keywords.robot

Suite Setup      Open Session
Test Teardown    Close Session

***Test Cases***

Logar e adicionar book na bookStor
    [Setup]    Remove livros existentes        https://demoqa.com/login    profile

    Dado que acesso o site                         https://demoqa.com/books
    E que realizo o login                          books
    E adiciono um livro                            Speaking JavaScript
    Entao verifico o livro adicionado ao perfil    Speaking JavaScript
