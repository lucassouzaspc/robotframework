***Settings***
Documentation    Aqui teremos a estrutura base do projeto
...              O selenium e FakerLibrary são importantos aqui
...              Abrir e finalizar sessão
...              Definir variaveis para os dados fakes

Library    SeleniumLibrary
Library    FakerLibrary

# Resource    kws.robot
***Variables***

${Browser}       chrome
# ${headless}    headlesschrome

***Keywords***
Open Session
    Open Browser               about:blank    ${Browser}
    maximize browser window

Open Session Headless
    Open Browser    about:blank     ${headless}
    maximize browser window

Close Session
    # Capture Page Screenshot
    Close Browser

Dado que acesso o site
    [Arguments]    ${url}
    Go To    ${url}

Dados Fake
    ${fakeFirstName}=    FakerLibrary.First Name Male
    ${fakeLastName}=     FakerLibrary.Last Name Male
    ${fakeAddress}=       FakerLibrary.Address
    ${fakeEmail}=         FakerLibrary.Email
    ${fakePhone}=         FakerLibrary.Random Number      digits=${10}

    Set Suite Variable    ${fakeFirstName}    children=true
    Set Suite Variable    ${fakeLastName}
    Set Suite Variable    ${fakeAddress}
    Set Suite Variable    ${fakeEmail}
    Set Suite Variable    ${fakePhone}    