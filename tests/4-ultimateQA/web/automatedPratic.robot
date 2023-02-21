*** Settings ***
Documentation    Automation Practice - Ultimate QA (https://ultimateqa.com/simple-html-elements-for-automation/)
...              Localize o componente Clickable Icon e validar o redirecionamento para a próxima página e voltar para a home
...              Preencher o contato e validar a mensagem de Thanks for contacting us
...              Selecionar um radio button (male, female, other)
...              Selecionar os checkbox I have a bike e I have a car
...              Selecionar dropdown Volvo depois selecionar Audi
...              Selecionar Tab 2 Validar seu conteúdo
...              Selecionar tab 1 validar seu conteúdo

Library    SeleniumLibrary

Resource    ../../../resources/base.robot
Resource    Keywords.robot

Test Setup       Open Session
Test Teardown    Close Session
Suite Setup      Dados Fake

***Test Cases***

Localize o componente Clickable Icon e validar o redirecionamento para a próxima página e voltar para a home
   Dado que acesso o site                                     https://ultimateqa.com/simple-html-elements-for-automation/
   Quando clico no componente Clickable Icon
   Entao verifico que a pagina foi direcionada para a home

Preencher o contato e validar a mensagem de Thanks for contacting us
    Dado que acesso o site                                 https://ultimateqa.com/simple-html-elements-for-automation/
    Quando envio uma mensagem para o contact ultimateqa    ${fakeFirstName}    ${fakeLastName}    ${fakeEmail}    MSG123
    Entao verifico a mensagem                              Thanks for contacting us

Selecionar um radio button (male, female, other)
   Dado que acesso o site             https://ultimateqa.com/simple-html-elements-for-automation/
   Entao seleciono um radio button

Selecionar os checkbox I have a bike e I have a car
   Dado que acesso o site         https://ultimateqa.com/simple-html-elements-for-automation/
   Entao seleciono um checkbox

Selecionar dropdown Volvo depois selecionar Audi
   Dado que acesso o site         https://ultimateqa.com/simple-html-elements-for-automation/
   Entao seleciono um dropdown

Selecionar Tab 2 Validar seu conteudo
   Dado que acesso o site                                    https://ultimateqa.com/simple-html-elements-for-automation/
   Quando escolho em uma opcao da tabela                     Tab 2 content
   Entao verifico a opcao escolhida selecionada na tabela    Tab 2 content

Selecionar tab 1 validar seu conteudo
   Dado que acesso o site                                    https://ultimateqa.com/simple-html-elements-for-automation/
   Quando escolho em uma opcao da tabela                     tab 1 content
   Entao verifico a opcao escolhida selecionada na tabela    tab 1 content
