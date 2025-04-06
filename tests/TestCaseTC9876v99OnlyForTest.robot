*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn


*** Variables ***

${MyHostname}    desktopj93k2ev
# ${MyHostname}    demo7358
${MyRepositoryName}    TFPSVC
# You must create the folder "MyFolderWorkspace" manually in the computer of Jenkins master, in case you test the script with the computer of Jenkins master

${MyFolderWorkspace}    C:/000/jenkins/workspace
# NOT REQUIRED ANYMORE ${MyFolderResults}    results
${MyLogFile}    MyLogFile.log
${MyFolderCertificate}    security

${MyPortNumber}    10000
#  Do not use the brackets to define the variable of bearer token
${bearerToken}    Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJJbnN0YWxsZXIiLCJuYW1lIjoiSW5zdGFsbGVyIiwiaXNzIjoiVGVsZW1pcyIsImlhdCI6MTUxNjIzOTAyMiwiZXhwIjoxODYxOTIwMDAwfQ.pynnZ69Qx50wuz0Gh4lx-FHZznrcQkbMm0o-PLhb3S0

${MyBrowser1}    chrome
${MyBrowser2}    firefox
${MyBrowser3}    edge

${SiteManagerUser1Login}     local_admin
${SiteManagerUser1Password}    KEYCLOAKTastouk!

${SiteManagerUser2Login}     alphonse
${SiteManagerUser2Password}    alphonse

${MyEntityName1}    audit
${MyEntityPort1}    9940
${MyEntityName2}    dicomgate
${MyEntityPort2}    9920
${MyEntityName3}    hl7gate
${MyEntityPort3}    9930
${MyEntityName4}    patient
${MyEntityPort4}    9990
${MyEntityName5}    registry
${MyEntityPort5}    9960
${MyEntityName6}    repository
${MyEntityPort6}    9970
${MyEntityName7}    user
${MyEntityPort7}    9950
${MyEntityName8}    worklist
${MyEntityPort8}    9980

${VersionSiteManager}    4.2.0-SNAPSHOT-2384-BETA
# ${VersionWatchdog}    4.1.0-3491    # Not required anymore from version 1.2.0 of TFP because Site Manager and Watchdog have been merged into only one application



*** Keywords ***

Remove My Previous Results
    [Documentation]    Delete the previous results and log files
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/geckodriver*
    # Delete the previous screenshots
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/*.png
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}
    # ${Time} =    Get Current Date
    # Create file  ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Start the tests \n


Check That Watchdog Is Running
    [Documentation]    Check that Watchdog is running
    create session    mysession    https://${MyHostname}:${MyPortNumber}/watchdog/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Check Version Of Watchdog
    [Documentation]    Check the version number of Watchdog
    create session    mysession    https://${MyHostname}:${MyPortNumber}/watchdog/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Watchdog ${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s
    # Should Contain    ${response.text}    ${VersionSiteManager}


Check That Site Manager Is Running
    [Documentation]    Check that Site Manager is running
    create session    mysession    https://${MyHostname}:${MyPortNumber}/site/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Check Version Of Site Manager
    [Documentation]    Check the version number of Site Manager
    create session    mysession    https://${MyHostname}:${MyPortNumber}/site/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Site Manager ${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s

    ${response} =    GET On Session    mysession    /identity    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    sitemanager
    Sleep    1s


Check That Telemis Entity Is Running
    [Documentation]    Check that Telemis Entity is running
    [Arguments]    ${MyEntityPort}
    create session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Check Version Of Telemis Entity
    [Documentation]    Check the version number of entity
    [Arguments]    ${MyEntityName}    ${MyEntityPort}
    create session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin

    ${headers}    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /version    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Telemis-${MyEntityName}${SPACE}${response.text} \n

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s

    ${response} =    GET On Session    mysession    /identity    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}
    Sleep    1s


Take My Screenshot
    ${MyCurrentDateTime} =    Get Current Date    result_format=%Y%m%d%H%M%S
    Log    ${MyCurrentDateTime}
    # Keyword of SeleniumLibrary, you do not need to use the library Screenshot
    Capture Page Screenshot    selenium-screenshot-${MyCurrentDateTime}.png
    Sleep    2s


My User Opens Internet Browser And Connects To Site Manager
    [Documentation]    The user opens Internet browser and then connects to the website of Site Manager
    [Arguments]    ${MyUserLogin}    ${MyUserPassword}
    Open Browser    https://${MyHostname}:10000/site    Chrome    options=add_argument("--disable-infobars");add_argument("--lang\=en");binary_location=r"C:\\000\\chromeWin64ForTests\\chrome.exe"
    Wait Until Page Contains    Login to your account    timeout=15s
    Maximize Browser Window
    Wait Until Element Is Visible    id=username    timeout=15s
    Wait Until Element Is Visible    id=password    timeout=15s
    Wait Until Element Is Visible    id=kc-login    timeout=15s
    Input Text    id=username    ${MyUserLogin}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=username    ${MyUserLogin}
    Input Text    id=password    ${MyUserPassword}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    id=password    ${MyUserPassword}
    Click Button    id=kc-login
    Wait Until Page Contains    Site Manager    timeout=15s
    Wait Until Element Is Visible    link=Sign out    timeout=15s
    Sleep    3s


Log Out My User Session Of Site Manager
    Wait Until Page Contains    Site Manager    timeout=15s
    Wait Until Element Is Visible    link=Sign out    timeout=15s
    Click Link    link=Sign out
    Wait Until Element Is Visible    id=kc-logout    timeout=15s
    Element Should Be Visible    id=kc-logout
    Click Button    id=kc-logout
    Wait Until Page Contains    Login to your account    timeout=15s
    Wait Until Element Is Visible    id=kc-login    timeout=15s
    Sleep    2s


Check My Predefined Search With Two Input Boxes
    [Documentation]    Test and check the predefined search of the tab Presets, only applicable with two input boxes
    [Arguments]    ${MyPresetName}    ${MyInputBox1}    ${MyInputBox2}    ${MyInputBoxValue1}    ${MyInputBoxValue2}    ${MyButtonClear}    ${MyButtonSearch}
    Wait Until Page Contains    ${MyPresetName}    timeout=15s
    Wait Until Element Is Visible    ${MyInputBox1}    timeout=15s
    Wait Until Element Is Visible    ${MyInputBox2}    timeout=15s
    Input Text    ${MyInputBox1}    ${MyInputBoxValue1}    clear=True
    Input Text    ${MyInputBox2}    ${MyInputBoxValue2}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    ${MyInputBox1}    ${MyInputBoxValue1}
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    ${MyInputBox2}    ${MyInputBoxValue2}
    Take My Screenshot
    Wait Until Element Is Visible    ${MyButtonClear}    timeout=15s
    Wait Until Element Is Visible    ${MyButtonSearch}    timeout=15s
    Click Element    ${MyButtonClear}
    Wait Until Keyword Succeeds    15s    3s    Element Text Should Be    ${MyInputBox1}    ${EMPTY}
    ${MyValue} =    Get Text    ${MyInputBox1}
    Log    ${MyValue}


Check My Predefined Search With Only One Input Box
    [Documentation]    Test and check the predefined search of the tab Presets, applicable with only one input box
    [Arguments]    ${MyPresetName}    ${MyInputBox1}    ${MyInputBoxValue1}    ${MyButtonClear}    ${MyButtonSearch}
    Wait Until Page Contains    ${MyPresetName}    timeout=15s
    Wait Until Element Is Visible    ${MyInputBox1}    timeout=15s
    Input Text    ${MyInputBox1}    ${MyInputBoxValue1}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    ${MyInputBox1}    ${MyInputBoxValue1}
    Take My Screenshot
    Wait Until Element Is Visible    ${MyButtonClear}    timeout=15s
    Wait Until Element Is Visible    ${MyButtonSearch}    timeout=15s
    Click Element    ${MyButtonClear}
    Wait Until Keyword Succeeds    15s    3s    Element Text Should Be    ${MyInputBox1}    ${EMPTY}
    ${MyValue} =    Get Text    ${MyInputBox1}
    Log    ${MyValue}


Fill My Input Box Of Search Criterion In Tab Search
    [Documentation]    Fill the input box of search criterion located in the tab Search
    [Arguments]    ${MySearchCriterion}    ${MySearchCriterionValue}
    Wait Until Element Is Visible    ${MySearchCriterion}    timeout=15s
    Element Should Be Visible    ${MySearchCriterion}
    Input Text    ${MySearchCriterion}    ${MySearchCriterionValue}    clear=True
    Wait Until Keyword Succeeds    15s    3s    Textfield Value Should Be    ${MySearchCriterion}    ${MySearchCriterionValue}


Check And Test My Event Name
    [Documentation]    Test and check the event name with the tab Presets
    [Arguments]    ${MyEventName}
    Wait Until Element Is Visible    link=Presets    timeout=15s
    Element Should Be Visible    link=Presets
    Click Link    link=Presets
    Wait Until Page Contains    All audit events related to its type    timeout=15s
    Wait Until Element Is Visible    ${Preset01z01}    timeout=15s
    Element Should Be Visible    ${Preset01z01}
    # Select one item from the combo box
    Click Element    ${Preset01z01}
    Wait Until Element Is Visible    xpath=//span[contains(.,'${MyEventName}')]    timeout=15s
    Element Should Be Visible    xpath=//span[contains(.,'${MyEventName}')]
    Click Element    xpath=//span[contains(.,'${MyEventName}')]
    Wait Until Element Contains    xpath=//span[contains(.,'${MyEventName}')]    ${MyEventName}    timeout=15s
    Wait Until Keyword Succeeds    15s    3s    Element Should Contain    xpath=//span[contains(.,'${MyEventName}')]    ${MyEventName}
    # Check the button Search
    Wait Until Element Is Visible    ${Preset01S}    timeout=15s
    Element Should Be Visible    ${Preset01S}
    Click Element    ${Preset01S}
    Sleep    2s
    Wait Until Page Contains    Timestamp    timeout=15s
    Wait Until Page Contains    Event    timeout=15s
    Wait Until Page Contains    ${MyEventName}    timeout=15s
    Take My Screenshot
    Sleep    1s




*** Test Cases ***

Test01
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results


Test02
    [Documentation]    Check that the service is running (Telemis-Audit)
    [Tags]    CRITICALITY NORMAL
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:9940/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    # Keyword Get On Session sends a GET request.
    ${response} =    GET On Session    mysession    /ping
    # Keyword Log of BuiltIn, all HTTP request keywords (GET, POST, etc) return response objects, see the complete list of attributes in the documentation of RequestsLibrary, see the table of Response Object
    Log    ${response}
    Log    ${response.text}
    Log    ${response.status_code}
    Log    ${response.content}
    # Keyword Log To Console of BuiltIn shows the message in the console
    Log To Console    ${response.status_code}
    # Keyword Should Be Equal As Strings of BuildIn
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    pong

Test03
    [Documentation]    Check that the service is running (Telemis-DicomGate, 9920)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9920/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /ping
    Log    ${response.text}
    Log To Console    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    pong

Test04
    [Documentation]    Check that the service is running (Telemis-HL7Gate, 9930)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9930/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /ping
    Log    ${response.text}
    Log To Console    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    pong

Test05
    [Documentation]    Check that the service is running (Telemis-Patient, 9990)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9990/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /ping
    Log    ${response.text}
    Log To Console    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    pong

Test06
    [Documentation]    Check that the service is running (Telemis-Registry, 9960)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9960/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /ping
    Log    ${response.text}
    Log To Console    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    pong

Test07
    [Documentation]    Check that the service is running (Telemis-Repository, 9970)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9970/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /ping
    Log    ${response.text}
    Log To Console    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    pong

Test08
    [Documentation]    Check that the version number of the application (Telemis-Audit, 9940)
    [Tags]    CRITICALITY NORMAL
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:9940/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    # Keyword Get On Session sends a GET request
    ${response} =    GET On Session    mysession    /version
    # Keyword Log of BuiltIn, all HTTP request keywords (GET, POST, etc) return response objects, see the complete list of attributes in the documentation of RequestsLibrary, see the table of Response Object
    Log    ${response.status_code}
    Log    ${response.content}
    Log    ${response.text}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Telemis-Audit${SPACE}${response.text} \n
    # Keyword Should Be Equal As Strings of BuildIn
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    4.2.0-SNAPSHOT-1494-BETA

Test09
    [Documentation]    Check that the version number of the application (Telemis-DicomGate, 9920)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9920/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /version
    Log    ${response.status_code}
    Log    ${response.text}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Telemis-DicomGate${SPACE}${response.text} \n
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    4.2.0-SNAPSHOT-1638-BETA

Test10
    [Documentation]    Check that the version number of the application (Telemis-HL7Gate, 9930)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9930/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /version
    Log    ${response.status_code}
    Log    ${response.text}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Telemis-HL7Gate${SPACE}${response.text} \n
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    3.2.0-SNAPSHOT-1463-BETA

Test11
    [Documentation]    Check that the version number of the application (Telemis-Patient, 9990)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9990/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /version
    Log    ${response.status_code}
    Log    ${response.text}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Telemis-Patient${SPACE}${response.text} \n
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    3.2.0-SNAPSHOT-1425-BETA

Test12
    [Documentation]    Check that the version number of the application (Telemis-Registry, 9960)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9960/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /version
    Log    ${response.status_code}
    Log    ${response.text}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Telemis-Registry${SPACE}${response.text} \n
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    4.2.0-SNAPSHOT-1448-BETA

Test13
    [Documentation]    Check that the version number of the application (Telemis-Repository, 9970)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9970/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /version
    Log    ${response.status_code}
    Log    ${response.text}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of Telemis-Repository${SPACE}${response.text} \n
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    4.2.0-SNAPSHOT-1475-BETA

Test14
    [Documentation]    Identify the name of the application (Telemis-Audit, 9940)
    [Tags]    CRITICALITY NORMAL
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:9940/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    # Keyword Get On Session sends a GET request
    ${response} =    GET On Session    mysession    /identity
    # Keyword Log of BuiltIn, all HTTP request keywords (GET, POST, etc) return response objects, see the complete list of attributes in the documentation of RequestsLibrary, see the table of Response Object
    Log    ${response.status_code}
    Log    ${response.content}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    audit

Test15
    [Documentation]    Identify the name of the application (Telemis-DicomGate, 9920)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9920/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /identity
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    dicomgate

Test16
    [Documentation]    Identify the name of the application (Telemis-HL7Gate, 9930)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9930/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /identity
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    hl7gate

Test17
    [Documentation]    Identify the name of the application (Telemis-Patient, 9990)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9990/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /identity
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    patient

Test18
    [Documentation]    Identify the name of the application (Telemis-Registry, 9960)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9960/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /identity
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    registry

Test19
    [Documentation]    Identify the name of the application (Telemis-Repository, 9970)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9970/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /identity
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    repository

