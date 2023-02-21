***Settings***

***Variables***

***Keywords***

Quando clico no no botao Click me
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    css:#ajax-loader
    Execute Javascript    document.querySelector("#ajax-loader").removeAttribute("target")

    Click element                  css:#ajax-loader
    Wait Until Keyword Succeeds    10s                          1s
    ...                            Element Should Be Visible    css:#button1
    Click element                  css:#button1

Entao verifico o modal com a mensagem
    Wait Until Keyword Succeeds    5s                             1s
    ...                            Element Should Be Visible      css:div .modal-footer button[type="button"]
    Element Should Contain         css:h4[class="modal-title"]    Well Done For Waiting....!!!
    Click Button                   Close

Quando clico na opcao contact us
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    css:#contact-us
    Execute Javascript    document.querySelector("#contact-us").removeAttribute("target")
    Click element                  css:#contact-us

E preencho o formulario de contato
    [Arguments]    ${firstName}    ${lastName}    ${email}    ${message}

    Wait Until Keyword Succeeds    10s                             1s
    ...                            Element Should Be Visible       css:input[name="first_name"]
    Input Text                     css:input[name="first_name"]    ${firstName}
    Input Text                     css:input[name="last_name"]     ${lastName}
    Input Text                     css:input[name="email"]         ${email}
    Input Text                     css:textarea[name="message"]    ${message}
    Click element                  css:input[value="SUBMIT"]

Entao verifico que a mensagem foi enviada
    Wait Until Keyword Succeeds    5s                    1s
    ...                            Location Should Be    http://webdriveruniversity.com/Contact-Us/contact-form-thank-you.html

    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    css:#contact_reply
    Element Should Contain         css:#contact_reply           Thank You for your Message!

Quando seleciono o Date picker
    Wait Until Keyword Succeeds    5s                                                   1s
    ...                            Element Should Be Visible                            css:#datepicker
    Execute Javascript    document.querySelector("#datepicker").removeAttribute("target")
    Click element                  css:#datepicker
    Click element                  css:.input-group-addon
    Click element                  //td[@class="today day"]/preceding-sibling::td[1]

Entao verifico que e possivel selecionar a data anterior
    Click element    css:.input-group-addon
    Click element    //td[@class="today day"]/preceding-sibling::td[1]
