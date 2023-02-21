*** Settings ***
Documentation
...    Exercício 1 - Buger - eats(https://buger-eats.vercel.app/)
...    Efetue uma tentativa de cadastro informando um CPF inválido e deixando de enviar a foto da CNH
...    e valide que mensagens informando da necessidade de corrigir os campos são exibidas.
...    Efetue um cadastro completo, informando os dados necessários corretamente,
...    selecionando o método de entrega “Bicicleta”(porque somos amigos da natureza 😀🚲).
...    Valide que o cadastro foi concluído com sucesso.

Library     SeleniumLibrary
Resource    ../../../resources/base.robot

Test Setup       Open Session
Test Teardown    Close Session

***Test Cases***

Cadastro com cpf invalido
    Go To                     https://buger-eats.vercel.app/
    Click Element             xpath://a[@href="/deliver"]
    Input Text                xpath://input[@name="cpf"]                            00000000000
    Click Element             class:button-success
    Element Should Contain    xpath://input[@name="cpf"]/following-sibling::span    Oops! CPF inválido

cadastro sem envio da cnh
    Go To                     https://buger-eats.vercel.app/
    Click Element             xpath://a[@href="/deliver"]
    Input Text                xpath://input[@name="name"]                            Cauê Isaac Brito
    Input Text                xpath://input[@name="cpf"]                             87919776732
    Input Text                xpath://input[@name="email"]                           caue_brito@saopaulo10hotmail.com
    Input Text                xpath://input[@name="whatsapp"]                        87919776732
    Input Text                xpath://input[@name="postalcode"]                      69093196
    Click Element             xpath://input[@value="Buscar CEP"]
    Input Text                xpath://input[@name="address-number"]                  11
    Input Text                xpath://input[@name="address-details"]                 Antiga rua 1
    Click Element             xpath://img[@src="/static/media/moto.c7bfc5a6.svg"]
    Click Element             class:button-success
    Element Should Contain    class:alert-error                                      Adicione uma foto da sua CNH

Cadastro completo com sucesso
    Go To            https://buger-eats.vercel.app/
    Click Element    xpath://a[@href="/deliver"]
    Input Text       xpath://input[@name="name"]               Cauê Isaac Brito
    Input Text       xpath://input[@name="cpf"]                87919776732
    Input Text       xpath://input[@name="email"]              caue_brito@saopaulo10hotmail.com
    Input Text       xpath://input[@name="whatsapp"]           87919776732
    Input Text       xpath://input[@name="postalcode"]         69093196
    Click Element    xpath://input[@value="Buscar CEP"]
    Sleep            2
    Input Text       xpath://input[@name="address-number"]     11
    Input Text       xpath://input[@name="address-details"]    Antiga rua 1

    # ${elementAddress}=        Get Value                                              xpath://input[@name="address"]
    # Wait Until Element Contains    ${elementAddress}     Rua Baré    5

    ${elementAddress}=     Get Value             xpath://input[@name="address"]
    ${elementDistrict}=    Get Value             xpath://input[@name="district"]
    ${elementCityUf}=      Get Value             xpath://input[@name="city-uf"]
    Should be equal        ${elementAddress}     Rua Baré
    Should be equal        ${elementDistrict}    Colônia Santo Antônio
    Should be equal        ${elementCityUf}      Manaus/AM

    Click Element         xpath://img[@src="/static/media/moto.c7bfc5a6.svg"]
    Choose File           xpath://input[@type="file"]                            ${CURDIR}/cnh.png
    Click Element         class:button-success
    Wait Until Element Contains    id:swal2-html-container    Recebemos os seus dados. Fique de olho na sua caixa de email, pois e em breve retornamos o contato.
    Click Element         class:swal2-confirm
    Location Should Be    https://buger-eats.vercel.app/
