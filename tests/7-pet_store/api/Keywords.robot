***Settings***

***Variables***

***Keywords***

Realizar login
    [Arguments]    ${username}    ${password}

    Create Session                api                                                  ${urlBase}
    ${HEADERS}                    Create Dictionary                                    content-type=application/json
    ${response}                   GET On Session                                       api                              /v2/user/login
    ...                           headers=${HEADERS}
    ...                           params=?username=${username}&password=${password}
    Set Test Variable             ${response}
    Should Be Equal As Strings    ${response.status_code}                              200
    Should Be Equal As Strings    ${response.json()["code"]}                           200
    Should Be Equal As Strings    ${response.json()["type"]}                           unknown
    should contain                ${response.json()["message"]}                        logged in user session:


Criar um usuario
    [Arguments]    ${payloadUser}

    Create Session                   api                           ${urlBase}
    ${HEADERS}                       Create Dictionary             content-type=application/json
    ${response}                      POST On Session               api                              /v2/user
    ...                              headers=${HEADERS}
    ...                              data=${payloadUser}
    Set Test Variable                ${response}
    Should Be Equal As Strings       ${response.status_code}       200
    Should Be Equal As Strings       ${response.json()["code"]}    200
    Should Be Equal As Strings       ${response.json()["type"]}    unknown
    Dictionary Should Contain Key    ${response.json()}            message

Atualizar um usuario
    [Arguments]    ${username}    ${payloadUser}

    Create Session                api                           ${urlBase}
    ${HEADERS}                    Create Dictionary             content-type=application/json
    ${response}                   Put On Session                api                              /v2/user/${username}
    ...                           headers=${HEADERS}
    ...                           data=${payloadUser}
    Set Test Variable             ${response}
    Should Be Equal As Strings    ${response.status_code}       200
    Should Be Equal As Strings    ${response.json()["code"]}    200
    Should Be Equal As Strings    ${response.json()["type"]}    unknown
    log                           ${response.json()}
    should contain                ${response.json()}            message

Deletar um usuario
    [Arguments]    ${username}

    Create Session                api                           ${urlBase}
    ${HEADERS}                    Create Dictionary             content-type=application/json
    ${response}                   Delete On Session             api                              /v2/user/${username}
    ...                           headers=${HEADERS}
    Set Test Variable             ${response}
    Should Be Equal As Strings    ${response.status_code}       200
    Should Be Equal As Strings    ${response.json()["code"]}    200
    Should Be Equal As Strings    ${response.json()["type"]}    unknown
    log                           ${response.json()}
    should contain                ${response.json()}            message


Criar um usuario com array
    [Arguments]    ${payloadUser}

    Create Session                api                           ${urlBase}
    ${HEADERS}                    Create Dictionary             content-type=application/json
    ${response}                   POST On Session               api                              /v2/user/createWithArray
    ...                           headers=${HEADERS}
    ...                           data=${payloadUser}
    Set Test Variable             ${response}
    Should Be Equal As Strings    ${response.status_code}       200
    Should Be Equal As Strings    ${response.json()["code"]}    200
    Should Be Equal As Strings    ${response.json()["type"]}    unknown
    log                           ${response.json()}
    should contain                ${response.json()}            message


Validar usuario criado com array
    [Arguments]    ${username}

    Create Session                api                                 ${urlBase}
    ${HEADERS}                    Create Dictionary                   content-type=application/json
    ${response}                   Get On Session                      api                              /v2/user/${username}
    ...                           headers=${HEADERS}
    Set Test Variable             ${response}
    Should Be Equal As Strings    ${response.status_code}             200
    Should Be Equal As Strings    ${response.json()["username"]}      UserpetnameArray
    Should Be Equal As Strings    ${response.json()["firstName"]}     UserpetFirstName
    Should Be Equal As Strings    ${response.json()["lastName"]}      UserpetLastName
    Should Be Equal As Strings    ${response.json()["email"]}         userpet@pet.com
    Should Be Equal As Strings    ${response.json()["password"]}      passPet
    Should Be Equal As Strings    ${response.json()["phone"]}         82987881116
    Should Be Equal As Strings    ${response.json()["userStatus"]}    0
