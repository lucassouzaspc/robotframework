***Settings***

***Variables***

***Keywords***

E que realizo o login
    [Arguments]    ${rota}
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    css:#login
    Click element                  css:#login

    Wait Until Keyword Succeeds    10s                          1s
    ...                            Element Should Be Visible    css:#userName
    Input Text                     css:#userName                caue1_brito@saopaulo10hotmail.com
    Input Text                     css:#password                Caue@123
    Click element                  css:#login
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Location Should Be           https://demoqa.com/${rota}

E removo todos os livros ja existentes

    Wait Until Keyword Succeeds    10s                    1s
    ...                            Page Should Contain    Delete All Books
    Click Button                   Delete All Books
    Click Button                   OK
    Handle Alert

E realizo logout
    Click Button    Log out

E adiciono um livro
    [Arguments]    ${livro}
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    css:#searchBox
    Click element                  css:#searchBox
    Click Link                     ${livro}
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    css:div[id="title-wrapper"] div label[id="userName-value"]
    Click Button                   Add To Your Collection
    Handle Alert

Entao verifico o livro adicionado ao perfil
    [Arguments]    ${livro}
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    xpath://span[@class="text"][contains(text(),'Profile')]
    Wait Until Keyword Succeeds    5s                           1s
    ...                            Element Should Be Visible    xpath://label[@id="userName-value"][contains(text(),'Speaking JavaScript')]
    Element Should Contain    xpath://label[@id="userName-value"][contains(text(),'${livro}')]    ${livro}


Remove livros existentes
    [Arguments]    ${site}    ${rota}
    Dado que acesso o site                    ${site}
    E que realizo o login                     ${rota}
    E removo todos os livros ja existentes
    E realizo logout