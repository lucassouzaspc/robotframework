***Settings***

***Variables***

***Keywords***

Quando realizo o login
    [Arguments]    ${username}    ${password}
    Input Text      xpath://input[@data-test="username"]    ${username}
    Input Text      xpath://input[@data-test="password"]    ${password}
    Click Button    Login

Entao verifico verifico sucesso no login
    Wait Until Keyword Succeeds    5s                    1s
    ...                            Location Should Be    https://www.saucedemo.com/inventory.html

Entao verifico verifico falha no login
    Wait Until Keyword Succeeds    5s                        1s
    ...                            Element Should Contain    css:.error-message-container    Epic sadface: Sorry, this user has been locked out.
Entao consigo seleciono a ordencao dos produtos
    [Arguments]    ${label}
    Click Element                    css:.product_sort_container
    wait until element is visible    xpath=//option[contains(text(),'${label}')]
    click element                    xpath=//option[contains(text(),'${label}')]
    Element Should Contain           css:.active_option                             ${label.upper()}

Adiciono o produto ao carrinho
    [Arguments]    ${produto}
    Click element    xpath://div[@class="inventory_item_name"][contains(text(),'${produto}')]//ancestor::div[@class="inventory_item_label"]/following-sibling::div /button

Verifico o carrinho
    [Arguments]    ${produto}    ${preco}
    Click element    css:.shopping_cart_badge
    Element Should Contain    xpath://div[@class="inventory_item_name"][contains(text(),'${produto}')]    ${produto}
    Element Should Contain    xpath://div[@class="inventory_item_name"][contains(text(),'${produto}')]//ancestor::a/following-sibling::div/following-sibling::div    ${preco}

Realizo o checkout informando o endereco
    [Arguments]    ${firstName}    ${lastName}    ${postalCode}
    Click element    css:[data-test="checkout"]
    Input Text       css:[data-test="firstName"]     ${firstName}
    Input Text       css:[data-test="lastName"]      ${lastName}
    Input Text       css:[data-test="postalCode"]    ${postalCode}

Finalizo a compra com sucesso
    [Arguments]    ${total}    ${mensagemCompra}
    click element             css:[data-test="continue"]
    Element Should Contain    css:.summary_subtotal_label       ${total}
    click element             css:[data-test="finish"]
    Element Should Contain    id:checkout_complete_container    ${mensagemCompra}

