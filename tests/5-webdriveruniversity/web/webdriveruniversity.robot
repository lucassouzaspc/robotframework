*** Settings ***
Documentation    http://webdriveruniversity.com - Ajax-Loader
...              Aguardar o carregamento, clicar no Botão Click me! E clicar em Done na message box que abre Iframe
...              Abrir a página, acessar o for me contact us, preencher e enviar Date picker
...              Selecionar a data de ontem, gerada a data a ser selecionada no cypress

Library    SeleniumLibrary

Resource    ../../../resources/base.robot
Resource    Keywords.robot

Test Setup       Open Session
Test Teardown    Close Session
Suite Setup      Dados Fake

***Test Cases***

Aguardar o carregamento, clicar no Botão Click me! E clicar em Done na message box que abre Iframe
    Dado que acesso o site                   http://webdriveruniversity.com
    Quando clico no no botao Click me
    Entao verifico o modal com a mensagem

Abrir a página, acessar o for me contact us, preencher e enviar
    Dado que acesso o site                       http://webdriveruniversity.com
    Quando clico na opcao contact us
    E preencho o formulario de contato           ${fakeFirstName}                  ${fakeLastName}    ${fakeEmail}    MSG123
    Entao verifico que a mensagem foi enviada

Date picker selecionar a data de ontem, gerada a data a ser selecionada no cypress
    Dado que acesso o site                                       http://webdriveruniversity.com
    Quando seleciono o Date picker
    Entao verifico que e possivel selecionar a data anterior