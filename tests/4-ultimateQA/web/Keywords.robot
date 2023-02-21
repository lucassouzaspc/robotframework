***Settings***

***Variables***

***Keywords***

Quando clico no componente Clickable Icon
    Wait Until Keyword Succeeds    5s                                 1s
    ...                            Element Should Be Visible          css:h4 a[href="/link-success/"]
    Click element                  css:h4 a[href="/link-success/"]
    Wait Until Keyword Succeeds    5s                                 1s
    ...                            Location Should Be                 https://ultimateqa.com/link-success/

Entao verifico que a pagina foi direcionada para a home
    Wait Until Keyword Succeeds    5s                                       1s
    ...                            Element Should Be Visible                css:a[href="https://ultimateqa.com/"]
    Click element                  css:a[href="https://ultimateqa.com/"]
    Wait Until Keyword Succeeds    5s                                       1s
    ...                            Location Should Be                       https://ultimateqa.com/

Quando envio uma mensagem para o contact ultimateqa
    [Arguments]    ${firstName}    ${lastName}    ${email}    ${message}
    Click element                  css:#menu-item-216842 a
    Wait Until Keyword Succeeds    5s                              1s
    ...                            Location Should Be              https://ultimateqa.com/contact/
    Wait Until Keyword Succeeds    5s                              1s
    ...                            Element Should Be Visible       css:#et_pb_contact_first_0
    Input Text                     css:#et_pb_contact_first_0      ${firstName}
    Input Text                     css:#et_pb_contact_last_0       ${lastName}
    Input Text                     css:#et_pb_contact_email_0      ${email}
    Input Text                     css:#et_pb_contact_message_0    ${message}
    Click element                  css:.et_pb_contact_submit

Entao verifico a mensagem
    [Arguments]    ${mensagem}
    Wait Until Keyword Succeeds    5s                        1s
    ...                            Element Should Contain    css:.et-pb-contact-message    ${mensagem}

Entao seleciono um radio button
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    css:input[value="female"]
    Click element                  css:input[value="female"]

Entao seleciono um checkbox
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    css:input[value="Bike"]
    Click element                  css:input[value="Bike"]
    Click element                  css:input[value="Car"]

Entao seleciono um dropdown
    Wait Until Keyword Succeeds    5s                                     1s
    ...                            Element Should Be Visible              css:.et_pb_blurb_description select
    Select From List By Value      css:.et_pb_blurb_description select    volvo
    Select From List By Value      css:.et_pb_blurb_description select    audi

Quando escolho em uma opcao da tabela
    [Arguments]    ${optionTab}
    Wait Until Keyword Succeeds    5s                                   1s
    ...                            Element Should Contain               css:.et-pb-active-slide div    tab 1 content
    Run Keyword If                 '${optionTab}' == 'Tab 2 content'    Click element                  css:.et_pb_tab_1 a
    Run Keyword If                 '${optionTab}' == 'tab 1 content'    Click element                  css:.et_pb_tab_0 a
    Wait Until Keyword Succeeds    5s                                   1s
    ...                            Element Should Contain               css:.et-pb-active-slide div    ${optionTab}

Entao verifico a opcao escolhida selecionada na tabela
    [Arguments]    ${optionTab}
    Wait Until Keyword Succeeds    5s                        1s
    ...                            Element Should Contain    css:.et-pb-active-slide div    ${optionTab}
