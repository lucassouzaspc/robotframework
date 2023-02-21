***Settings***
Documentation

Library    String

***Variables***

***Keywords***

Quando registro uma conta com saldo
    Click Button                   Registrar
    Input Text    xpath://div[@class="card__register"]/form//input[@name="email"]    caue_brito@saopaulo10hotmail.com
    Input Text                     xpath://input[@name="name"]    Cauê Isaac Brito
    Input Text    xpath://div[@class="card__register"]/form//input[@name="password"]    1234
    Input Text    xpath://div[@class="card__register"]/form//input[@name="passwordConfirmation"]    1234
    Wait Until Keyword Succeeds    5s                             1s
    ...                            Element Should Be Visible      css:.styles__Container-sc-1pngcbh-0
    Click Element                  id:toggleAddBalance
    Wait Until Keyword Succeeds    5s                             1s
    ...                            Element Should Be Visible      css:.styles__Container-sc-1pngcbh-0.hsmFIT
    Click Button                   Cadastrar
    Wait Until Keyword Succeeds    5s                             1s
    ...                            Element Should Be Visible      id:modalText
    ${modalText}=                  Get Text                       id:modalText
    ${splitModalText}=             Split String                   ${modalText}
    Element Should Contain         id:modalText                   A conta ${splitModalText}[2] foi criada com sucesso
    Click Element                  id:btnCloseModal
    Set Suite Variable             ${shared_variable}             ${splitModalText}[2]

E realizo o login
    Input Text                     xpath://input[@name="email"]       caue_brito@saopaulo10hotmail.com
    Input Text                     xpath://input[@name="password"]    1234
    Click Button                   Acessar
    Wait Until Keyword Succeeds    5s                                 1s
    ...                            Page Should Contain                Olá Cauê Isaac Brito,bem vindo ao BugBank :
    Element Should Contain         id:textAccountNumber               ${shared_variable}

Entao acesso o extrato com salvo
    Click Element                  id:btn-EXTRATO
    Wait Until Keyword Succeeds    5s                                            1s
    ...                            Element Should Be Visible                     id:textDescription
    Location Should Be             https://bugbank.netlify.app/bank-statement
    Element Should Contain         id:textDescription                            Saldo adicionado ao abrir conta