*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn
Library    String
Library    JSONLibrary


*** Variables ***

# MULTIPLE VARIABLES (BEGINNING)

### Computer desktopj93k2ev for tests at home
### Computer demo1911 is used for the automated tests of Telemis-Audit
### Computer demo7358 is used for the tests of API REST, probably I use only the computer demo1911 for both tests

${MyHostname}    desktopj93k2ev
# ${MyHostname}    demo1911
# ${MyHostname}    demo7358

### ID of the scheduled task for testing Telemis-Audit
### Computer desktopj93k2ev for tests at home
### Computer demo1911 for the automated tests of Telemis-Audit
### Computer demo9109 for tests with the virtual machine

${MyScheduledTaskID01}    vZYCPTDhMwuOpzg1
# ${MyScheduledTaskID01}    8qEdvUX6DwNiWpMg
# ${MyScheduledTaskID01}    lCdsS8mQ7XxmyHxE

### docId for testing Telemis-Repository
### Computer desktopj93k2ev for tests at home
### Computer demo1911 for the automated tests of Telemis-Audit
### Computer demo9109 for tests with the virtual machine

${MyPatient1DocId}    A2.sim.a192.be.simon.P1.8.1
# ${MyPatient1DocId}    A2.sim.d2b8.be.simon.P1.1
# ${MyPatient1DocId}    A2.sim.cf61.be.simon.P1.0


# MULTIPLE VARIABLES (END)

${MyRepositoryName}    TFPSVC
# You must create the folder "MyFolderWorkspace" manually in the computer of Jenkins master, in case you test the script with the computer of Jenkins master

${MyFolderWorkspace}    C:/000/jenkins/workspace
# NOT REQUIRED ANYMORE ${MyFolderResults}    results
${MyLogFile}    MyLogFile.log
${MyFolderCertificate}    security

${MyTmpPortNbr}    2310

${SiteName}    simon.be
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

${MyEntity01Name}    audit
${MyEntity01Port}    9940
${MyEntity01VersionNbr}    4.2.0
${MyEntity01APIVersion}    1.0.0
${MyEntity01EntityId}    simon.be:audit:audit

${MyEntity02Name}    dicomgate
${MyEntity02Port}    9920
${MyEntity02VersionNbr}    4.2.0
${MyEntity02APIVersion}    1.0.0
${MyEntity02EntityId}    simon.be:dicomgate:dicomgate

${MyEntity03Name}    hl7gate
${MyEntity03Port}    9930
${MyEntity03VersionNbr}    3.2.0
${MyEntity03APIVersion}    1.0.0
${MyEntity03EntityId}    simon.be:hl7gate:hl7gate

${MyEntity04Name}    patient
${MyEntity04Port}    9990
${MyEntity04VersionNbr}    3.2.0
${MyEntity04APIVersion}    1.0.0
${MyEntity04EntityId}    simon.be:patient:patient

${MyEntity05Name}    registry
${MyEntity05Port}    9960
${MyEntity05VersionNbr}    4.2.0
${MyEntity05APIVersion}    1.0.0
${MyEntity05EntityId}    simon.be:registry:registry

${MyEntity06Name}    repository
${MyEntity06Port}    9970
${MyEntity06VersionNbr}    4.2.0
${MyEntity06APIVersion}    1.0.0
${MyEntity06EntityId}    simon.be:repository:repository

${MyEntity07Name}    user
${MyEntity07Port}    9950
${MyEntity07VersionNbr}    4.2.0
${MyEntity07APIVersion}    1.0.0
${MyEntity07EntityId}    simon.be:user:user

${MyEntity08Name}    worklist
${MyEntity08Port}    9980
${MyEntity08VersionNbr}    3.2.0
${MyEntity08APIVersion}    1.0.0
${MyEntity08EntityId}    simon.be:worklist:worklist

${MyEntity09Name}    sitemanager
${MyEntity09Port}    10000
${MyEntity09VersionNbr}    4.2.0
${MyEntity09APIVersion}    1.0.0
${MyEntity09EntityId}    simon.be:sitemanager:sitemanager

# API command for API version of Site Manager https://HOSTNAME:10000/site/api/admin/api-version
# ${VersionWatchdog}    4.1.0-3491    # Not required anymore from version 1.2.0 of TFP because Site Manager and Watchdog have been merged into only one application

${MyXmlFile01}    20250330-013349.0521.xml

${MyMappingName01}    TESTORMO01
${MyMappingName02}    MYTEST95
${MyHL7Port01}    2599
${MyHL7Port02}    2597

${JsonFileHL7Gate01}    ris2597.json
${JsonFileHL7Gate02}    mapping95.json

${JsonFilePatient01}    patient970532create.json
${JsonFilePatient02}    patient970532delete.json

${JsonFileDcmGate01}    dcmportwkl6999create.json
${JsonFileDcmGate02}    dcmportwkl6999delete.json
${JsonFileDcmGate03}    dcmsvcwkl99create.json
${JsonFileDcmGate04}    dcmsvcwkl99delete.json

${MyPatient1FamilyName}    AZ128571
${MyPatient1FirstName}    ALBERT
${MyPatient1SeriesDescription}    CTOP128571
${MyPatient1BirthdateYYYY}    1945
${MyPatient1BirthdateMM}    11
${MyPatient1BirthdateDD}    24
${MyPatient1AccessionNumber}    CTEF128571
${MyPatient1PatientID}    CTAB128571
${MyPatient1StudyDescription}    CTMN128571
${MyPatient1StudyDate}    27/03/2025
${MyPatient1SOPIUID}    1.2.276.0.7230010.3.1.4.4197639315.23468.1743042029.839
${MyPatient1StudyIUID}    1.2.276.0.7230010.3.1.2.4197639315.23468.1743042029.838
${MyPatient1SeriesIUID}    1.2.276.0.7230010.3.1.3.4197639315.23468.1743042029.837
${MyPatient1StudyType}    CTST128571
${MyPatient1SeriesDescription}    CTOP128571

${MyPublicLabel01}    EMERGENCY



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

    ${headers} =    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Check Version Of Watchdog
    [Documentation]    Check the version number of Watchdog
    create session    mysession    https://${MyHostname}:${MyPortNumber}/watchdog/api/admin

    ${headers} =    create dictionary    Authorization=${bearerToken}

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

    ${headers} =    create dictionary    Authorization=${bearerToken}

    ${response} =    GET On Session    mysession    /ping    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    log    ${response.status_code}
    log    ${response.content}

    Should Be Equal As Strings    ${response.status_code}    200
    Sleep    1s


Check Version Of Site Manager
    [Documentation]    Check the version number of Site Manager
    create session    mysession    https://${MyHostname}:${MyPortNumber}/site/api/admin

    ${headers} =    create dictionary    Authorization=${bearerToken}

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
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
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


Check Version Of Telemis Entity
    [Documentation]    Check the version number of entity
    [Arguments]    ${MyEntityPort}    ${MyEntityName}    ${MyEntityVersionNbr}
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    # Keyword Get On Session sends a GET request
    ${response} =    GET On Session    mysession    /version
    # Keyword Log of BuiltIn, all HTTP request keywords (GET, POST, etc) return response objects, see the complete list of attributes in the documentation of RequestsLibrary, see the table of Response Object
    Log    ${response.status_code}
    Log    ${response.content}
    Log    ${response.text}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Version number of ${MyEntityName}${SPACE}${response.text} \n
    # Keyword Should Be Equal As Strings of BuildIn
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityVersionNbr}


Identify And Check Name Of Telemis Entity
    [Documentation]    Identify and check the name of the entity
    [Arguments]    ${MyEntityPort}    ${MyEntityName}
    # Keyword Create Dictionary of BuiltIn, it is required for the argument "headers" of the keyword Create Session
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    # Keyword Create Session of RequestsLibrary, create a HTTP session in the server
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    # Keyword Get On Session sends a GET request
    ${response} =    GET On Session    mysession    /identity
    # Keyword Log of BuiltIn, all HTTP request keywords (GET, POST, etc) return response objects, see the complete list of attributes in the documentation of RequestsLibrary, see the table of Response Object
    Log    ${response.status_code}
    Log    ${response.content}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}


Identify And Check SiteName Of Telemis Entity
    [Documentation]    Retrieve and check the site name of the entity
    [Arguments]    ${MyEntityPort}    ${MyEntityName}    ${MySiteName}
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /identity
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}
    # Retrieve the second line of the text
    ${MyRetrievedLine} =    Get Line    ${response.text}    1
    # In some cases you have to convert the retrieved value with the keyword Convert To String of BuiltIn
    Log    ${MyRetrievedLine}
    ${MySplittedLine} =    Split String    ${MyRetrievedLine}    "
    Log    ${MySplittedLine}
    # Retrieve the field name (sitename)
    ${MyString1} =    Get Substring    ${MySplittedLine}    1    2
    Log    ${MyString1}
    Should Contain    ${MyString1}    siteName
    # Retrieve the value of the field
    ${MyString2} =    Get Substring    ${MySplittedLine}    3    4
    Log    ${MyString2}
    Should Contain    ${MyString2}    ${MySiteName}


Identify And Check SiteName Of Telemis EntityV2
    [Documentation]    Retrieve and check the site name of the entity
    [Arguments]    ${MyEntityPort}    ${MyEntityName}    ${MySiteName}
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${endpoint} =    Set Variable    /api/admin/identity
    ${response} =    GET On Session    mysession    ${endpoint}
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    ${MyEntityName}
    Log    ${response.headers}
    #  The attribute json does NOT work, you get no response, you must replace json first with content, and then you convert the response into a string
    # Log    ${response.json}
    Log    ${response.content}
    # Keyword Convert String To Json of JSONLibrary
    ${json_response} =    Convert String To Json    ${response.content}
    # Keyword Get Value From Json of JSONLibrary
    ${MyValue} =    Get Value From Json    ${json_response}    $.siteName
    ${MyValue} =    Convert To String    ${MyValue}
    ${MyValue} =    Remove String Using Regexp    ${MyValue}    ['\\[\\],]
    Log    ${MyValue}
    Should Be Equal    ${MyValue}    ${MySiteName}
    # Keyword Get From Dictionary of Collections, verify the data type of the response
    ${headerValue} =    Get From Dictionary    ${response.headers}    Content-Type
    Log    ${headerValue}
    Should Be Equal    ${headerValue}    application/json


Identify And Check API version Of Telemis Entity
    [Documentation]    Retrieve and check the version number of API for the application
    [Arguments]    ${MyEntityPort}    ${MyEntityApiVersion}
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntityPort}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${endpoint} =    Set Variable    /api/admin/api-version
    ${response} =    GET On Session    mysession    ${endpoint}
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    ${apiversion} =    Convert to String    ${response.content}
    Log    ${apiversion}
    Should Be Equal    ${apiversion}    ${MyEntityApiVersion}
    # For this test, you can also replace response.content with response.text, it is easier because the format of the response is a text
    Log    ${response.headers}
    # Keyword Get From Dictionary of Collections, verify the data type of the response, this check is not mandatory for the test
    ${headerValue} =    Get From Dictionary    ${response.headers}    Content-Type
    Log    ${headerValue}
    Should Be Equal    ${headerValue}    text/plain;charset=UTF-8


Send My Event To Telemis Audit
    [Documentation]    Send the event to Telemis-Audit
    [Arguments]    ${MyXmlFile}
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/xml
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/xml/${MyXmlFile}
    Create Session    mysession    https://${MyHostname}:${MyEntity01Port}
    ${endpoint} =    Set Variable    /api/audit
    ${response} =    POST On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200


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

TEST001
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results

TEST002
    [Documentation]    Check that the service Telemis-Audit is still running
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntity01Port}

TEST003
    [Documentation]    Identify and check the version number of Telemis-Audit
    [Tags]    CRITICALITY NORMAL
    Check Version Of Telemis Entity    ${MyEntity01Port}    ${MyEntity01Name}    ${MyEntity01VersionNbr}

TEST004
    [Documentation]    Identify and check the name and the entity ID of the application (Telemis-Audit)
    [Tags]    CRITICALITY NORMAL
    Identify And Check Name Of Telemis Entity    ${MyEntity01Port}    ${MyEntity01Name}

TEST005
    [Documentation]    Identify and check the site name of Telemis-Audit
    [Tags]    CRITICALITY LOW
    Identify And Check SiteName Of Telemis EntityV2    ${MyEntity01Port}    ${MyEntity01Name}    ${SiteName}

TEST006
    [Documentation]    Identify and check the version number of API for the service Telemis-Audit
    [Tags]    CRITICALITY LOW
    Identify And Check API version Of Telemis Entity    ${MyEntity01Port}    ${MyEntity01APIVersion}

TEST007
    [Documentation]    Identify and check the hostname of Telemis-Audit
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity01Port}
    ${endpoint} =    Set Variable    /api/admin/env/hostname
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    ${MyHostname}

TEST008
    [Documentation]    Retrieve and check the detailed informations of Telemis-Audit, for example: entity ID, entity name, hostname, date of last activity, status, version number, URL of UI, URL of API, directory of installation, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity09Port}
    ${endpoint} =    Set Variable    /site/api/entity/${MyEntity01EntityId}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    audit

TEST009
    [Documentation]    Press the button [Reload the configuration] of Telemis-Audit
    [Tags]    CRITICALITY NORMAL
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity01Port}
    ${endpoint} =    Set Variable    /api/config/reload?force=false
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST010
    [Documentation]    Import audited events to Telemis-Audit
    [Tags]    CRITICALITY HIGH
    Send My Event To Telemis Audit    ${MyXmlFile01}

TEST011
    [Documentation]    Test and check the presets of Telemis-Audit (audit.preconfigured.preset.xxx)
    [Tags]    CRITICALITY HIGH
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity01Port}
    ${endpoint} =    Set Variable    /api/cfg/presets
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    # The attribute json does NOT work, you get no response, you must replace json with content, and then you convert the response into a string
    # Log    ${response.json}
    Log    ${response.content}
    ${Time} =    Get Current Date
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Telemis-Audit, response in JSON format \n
    Append To File    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${response.content} \n
    # Keyword Convert String To Json of JSONLibrary
    ${json_response} =    Convert String To Json    ${response.content}
    # Keyword Get Value From Json of JSONLibrary, if there are multiple identical elements "label" in JSON file, please use "[0]." to get the value from the first element "label"
    ${MyValue} =    Get Value From Json    ${json_response}    $.[0].label
    # The line below retrieves all the values from all the elements "label"
    # ${MyValue} =    Get Value From Json    ${json_response}    $..label
    ${MyValue} =    Convert To String    ${MyValue}
    ${MyValue} =    Remove String Using Regexp    ${MyValue}    ['\\[\\],]
    Log    ${MyValue}
    # Should Be Equal    ${MyValue}    Qui a modifié un patient?
    Should Contain    ${MyValue}    patient
    Log    ${response.headers}
    # Keyword Get From Dictionary of Collections, verify the data type of the response, only for test
    ${headerValue} =    Get From Dictionary    ${response.headers}    Content-Type
    Log    ${headerValue}
    Should Be Equal    ${headerValue}    application/json

TEST012
    [Documentation]    Check and modify the configuration of Telemis-Audit, for example (properties of Central Config): cronDefinition, maxMinutesExecTime, retentionDays, batchSize, performArchive, archiveDir, simulationMode, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity01Port}
    ${endpoint} =    Set Variable    /api/cfg/retention
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    # Keyword Convert String To Json of JSONLibrary
    ${json_response} =    Convert String To Json    ${response.content}
    # Keyword Get Value From Json of JSONLibrary, if there are multiple identical elements "label" in JSON file, please use "[0]." to get the value from the first element "label"
    ${MyValue} =    Get Value From Json    ${json_response}    $.retentionDays
    ${MyValue} =    Convert To String    ${MyValue}
    ${MyValue} =    Remove String Using Regexp    ${MyValue}    ['\\[\\],]
    Log    ${MyValue}
    Should Be Equal    ${MyValue}    365
    Log    ${response.headers}
    # Keyword Get From Dictionary of Collections, verify the data type of the response, only for test
    ${headerValue} =    Get From Dictionary    ${response.headers}    Content-Type
    Log    ${headerValue}
    Should Be Equal    ${headerValue}    application/json

TEST013
    [Documentation]    Identify and check the global version number of Telemis-Audit
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity01Port}
    ${endpoint} =    Set Variable    /api/admin/global-version
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}


### Telemis-DicomGate ###


TEST014
    [Documentation]    Check that the service Telemis-DicomGate is still running
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntity02Port}

TEST015
    [Documentation]    Identify and check the version number of Telemis-DicomGate
    [Tags]    CRITICALITY NORMAL
    Check Version Of Telemis Entity    ${MyEntity02Port}    ${MyEntity02Name}    ${MyEntity02VersionNbr}

TEST016
    [Documentation]    Identify and check the name and the entity ID of the application (Telemis-DicomGate)
    [Tags]    CRITICALITY NORMAL
    Identify And Check Name Of Telemis Entity    ${MyEntity02Port}    ${MyEntity02Name}

TEST017
    [Documentation]    Identify and check the site name of Telemis-DicomGate
    [Tags]    CRITICALITY LOW
    Identify And Check SiteName Of Telemis EntityV2    ${MyEntity02Port}    ${MyEntity02Name}    ${SiteName}

TEST018
    [Documentation]    Identify and check the version number of API for the service Telemis-DicomGate
    [Tags]    CRITICALITY LOW
    Identify And Check API version Of Telemis Entity    ${MyEntity02Port}    ${MyEntity02APIVersion}

TEST019
    [Documentation]    Check the value of the property [site.manager.service] of Telemis-DicomGate
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/admin/site-manager
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    10000

TEST020
    [Documentation]    Get the stack trace during the execution of Telemis-DicomGate
    [Tags]    CRITICALITY LOW
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/admin/stackTrace
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST021
    [Documentation]    Check that the property [features = dicom.worklist] of Telemis-DicomGate has been enabled or disabled
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/admin/worklist
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    true

TEST022
    [Documentation]    List and check DICOM associations of Telemis-DicomGate (send DICOM, query/retrieve, worklist)
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/dicom-associations
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    callingIp

TEST023
    [Documentation]    Check the value of the property [dicom.port.concurrency.max] of Telemis-DicomGate
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/config/defaultMaxPortConcurrency
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    50

TEST024
    [Documentation]    Check the value of the property [dicom.store.rootPath] of Telemis-DicomGate
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/config/defaultStorageDirectory
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    dicom

TEST025
    [Documentation]    Enable or disable the modality (AET) in Site Manager (true or false)
    [Tags]    CRITICALITY NORMAL
    # PUT request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/enable/telemis3?enable=true
    ${response} =    PUT On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    isClosed

TEST026
    [Documentation]    Test and check the port 5000 of DICOM Gate (only for testing purpose)
    [Tags]    CRITICALITY LOW
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/getTestDicomEntityDef
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    5000

TEST027
    [Documentation]    Identify and check the log level of Telemis-DicomGate and the modality (AET)
    [Tags]    CRITICALITY LOW
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/logLevel/client/telemis3
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    INFO

TEST028
    [Documentation]    Modify the log level of Telemis-DicomGate and the modality (AET) (list of values: INFO, ERROR, WARN, DEBUG, TRACE)
    [Tags]    CRITICALITY LOW
    # PUT request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/logLevel/client/telemis3/info
    ${response} =    PUT On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST029
    [Documentation]    Press the button [Reload the configuration] of Telemis-DicomGate
    [Tags]    CRITICALITY NORMAL
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/reloadConfig
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST030
    [Documentation]    Check the scope of Telemis-DicomGate
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/scope
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    simon.be

TEST031
    [Documentation]    List and check the configurations of all the ports in Telemis-DicomGate, for example: description of the port, maximum number of connected clients, called AET, port number, enabled/disabled, name(s) of the associated service, value of the scope, etc
    [Tags]    CRITICALITY HIGH
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    portNumber

TEST032
    [Documentation]    Check that the port exists in Telemis-DicomGate ("false" = port exists, "true" = port does NOT exist)
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port/available/9999
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    # false = port exists, true = port does NOT exist
    Should Contain    ${response.text}    false

TEST033
    [Documentation]    Enable or disable the port of Telemis-DicomGate (true or false)
    [Tags]    CRITICALITY HIGH
    # Remark: after disabling the port automatically, please do not enable the port manually with the user interface, because it doesn't work. Afterwards you must enable the port ONLY with API command.
    # PUT request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port/enable/9999?enable=true
    # ${endpoint} =    Set Variable    /api/port/enable/9999?enable=false
    ${response} =    PUT On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST034
    [Documentation]    Modify the log level of the port in Telemis-DicomGate (list of values: INFO, ERROR, WARN, DEBUG, TRACE)
    [Tags]    CRITICALITY LOW
    # Remark: if you change the log level of the port, you must use GET request, please do NOT use POST request.
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port/logLevel/9999/info
    # ${endpoint} =    Set Variable    /api/port/logLevel/9999/trace
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST035
    [Documentation]    Reload or restart the port of Telemis-DicomGate
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port/reload/9999
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST036
    [Documentation]    Check the configurations of the ports in Telemis-DicomGate (e.g. description of the port, maximum number of connected clients, type NORMAL or GENERIC, called AET, port number, enabled/disabled, name(s) of associated service, value of the scope, status, number of active clients, log level)
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port/scpInfos
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    portConfig

TEST037
    [Documentation]    Stop the port of Telemis- DicomGate (port 9999)
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port/stop/9999
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST038
    [Documentation]    Start the port of Telemis-DicomGate (port 9999)
    [Tags]    CRITICALITY NORMAL
    # GET request
    # Wait 5 seconds because the previous test takes a long time to stop the port 9999
    Sleep    5s
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port/start/9999
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST039
    [Documentation]    Check the configurations of DICOM services in Telemis-DicomGate (e.g. ID of the service, description, called AET, value of the scope, TmAddress of TMAA, checkbox [Notify when finished] selected/deselected, selected option [ACCEPTS ALL DICOM ENTITIES] or [REFUSES ALL DICOM ENTITIES], list of authorized DICOM entities, path of the output directory)
    [Tags]    CRITICALITY HIGH
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/service
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    dicomServiceConfig

TEST040
    [Documentation]    Check that Scheduler is still running (Telemis-DicomGate)
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/scheduler/engine/admin/ping
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    pong

TEST041
    [Documentation]    Reload or restart Scheduler (Telemis-DicomGate)
    [Tags]    CRITICALITY NORMAL
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/scheduler/engine/config/refresh
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST042
    [Documentation]    Stop the selected job in Scheduler
    [Tags]    CRITICALITY NORMAL
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/scheduler/engine/job/${MyScheduledTaskID01}/cancel
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST043
    [Documentation]    Start the selected job in Scheduler
    [Tags]    CRITICALITY NORMAL
    # POST request
    # Wait 5 seconds because the previous test takes a long time to stop the job
    Sleep    5s
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/scheduler/engine/job/${MyScheduledTaskID01}/start
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST044
    [Documentation]    Check the configuration of the scheduled task (list of values: DICOM_SEND, PREFETCHER, TESTING), for example: search criteria, DICOM source, AET source, AET destination, description, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/scheduler/engine/job/DICOM_SEND/config
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    parameters

TEST045
    [Documentation]    Identify and check the global version number of Telemis-DicomGate
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/admin/global-version
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    1.3.0


TEST046
    [Documentation]    Create the port in Telemis-DicomGate (worklist port 6999)
    [Tags]    CRITICALITY HIGH
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/json/${JsonFileDcmGate01}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port
    ${response} =    POST On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST047
    [Documentation]    Delete the port in Telemis-DicomGate (worklist port 6999)
    [Tags]    CRITICALITY HIGH
    # DELETE request
    # Wait 7 seconds because the previous test has just created the port, the application takes a long time to create the port
    Sleep    7s
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/json/${JsonFileDcmGate02}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/port
    ${response} =    DELETE On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST048
    [Documentation]    Create the service in Telemis-DicomGate (worklist service WKL99)
    [Tags]    CRITICALITY HIGH
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/json/${JsonFileDcmGate03}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/service
    ${response} =    POST On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST049
    [Documentation]    Delete the service in Telemis-DicomGate (worklist service WKL99)
    [Tags]    CRITICALITY HIGH
    # DELETE request
    # Wait 7 seconds because the previous test has just created the service, the application takes a long time to create the service
    Sleep    7s
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/json/${JsonFileDcmGate04}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/service
    ${response} =    DELETE On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    # POST request, press the button Reload Configuration of Telemis-DicomGate
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity02Port}
    ${endpoint} =    Set Variable    /api/reloadConfig
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200


### Telemis-HL7Gate ###


TEST050
    [Documentation]    Check that the service Telemis-HL7Gate is still running
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntity03Port}

TEST051
    [Documentation]    Identify and check the version number of Telemis-HL7Gate
    [Tags]    CRITICALITY NORMAL
    Check Version Of Telemis Entity    ${MyEntity03Port}    ${MyEntity03Name}    ${MyEntity03VersionNbr}

TEST052
    [Documentation]    Identify and check the name and the entity ID of the application (Telemis-HL7Gate)
    [Tags]    CRITICALITY NORMAL
    Identify And Check Name Of Telemis Entity    ${MyEntity03Port}    ${MyEntity03Name}

TEST053
    [Documentation]    Identify and check the site name of Telemis-HL7Gate
    [Tags]    CRITICALITY LOW
    Identify And Check SiteName Of Telemis EntityV2    ${MyEntity03Port}    ${MyEntity03Name}    ${SiteName}

TEST054
    [Documentation]    Identify and check version number of API for the service Telemis-HL7Gate
    [Tags]    CRITICALITY LOW
    Identify And Check API version Of Telemis Entity    ${MyEntity03Port}    ${MyEntity03APIVersion}

TEST055
    [Documentation]    Identify and check the global version number of Telemis-HL7Gate, for example: version 1.1.0, version 1.2.0, version 1.3.0, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/admin/global-version
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    1.3.0

TEST056
    [Documentation]    Check the scope of Telemis-HL7Gate
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/admin/scope
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    simon.be

TEST057
    [Documentation]    Check the informations of Telemis-HL7Gate, for example: entity ID, entity name, hostname, date of last activity, status, version number, URL of UI, URL of API, directory of installation, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity09Port}
    ${endpoint} =    Set Variable    /site/api/entity/${MyEntity03EntityId}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    hl7gate

TEST058
    [Documentation]    Press the button [Reload the configuration] of Telemis-HL7Gate
    [Tags]    CRITICALITY NORMAL
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/config/reload?force=false
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST059
    [Documentation]    Send PIX query to PIX manager (IHE Connectathon)
    [Tags]    CRITICALITY LOW
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /experimental/pix/${MyMappingName01}/${MyHL7Port01}
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    Outbound

TEST060
    [Documentation]    Send HL7 message to a service by using a specific mapping (IHE Connectathon)
    [Tags]    CRITICALITY LOW
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /experimental/query/${MyMappingName01}/hl7gate/facility/${MyHostname}/${MyHL7Port01}/issuer/1234
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    # Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST061
    [Documentation]    Check the informations of all the ports in Telemis-HL7Gate, for example: names of the ports, port numbers, enabled/disabled, associated mapping(s), path of input directory, scope of the ports, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    config

TEST062
    [Documentation]    Create the port in Telemis-HL7Gate (port 2597) (Check, create, update and delete the port of Telemis-HL7Gate)
    [Tags]    CRITICALITY HIGH
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/json/${JsonFileHL7Gate01}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/
    ${response} =    POST On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200

TEST063
    [Documentation]    Check the detailed informations of the selected port (2599), for example: name of the port, port number, enabled/disabled, associated mapping(s), path of input directory, status, scope of the port, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/${MyHL7Port01}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    config

TEST064
    [Documentation]    Delete the port of Telemis-HL7Gate (port 2597)
    [Tags]    CRITICALITY HIGH
    # DELETE request
    # Please wait 7 seconds because the script has just created the port 2597
    Sleep    7s
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/${MyHL7Port02}
    ${response} =    DELETE On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST065
    [Documentation]    Check the log level of the selected port in Telemis-HL7Gate (port 2599)
    [Tags]    CRITICALITY LOW
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/${MyHL7Port01}/log
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST066
    [Documentation]    Change the log level of the selected port in Telemis-HL7Gate (list of values: INFO, ERROR, WARN, DEBUG, TRACE)
    [Tags]    CRITICALITY LOW
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/${MyHL7Port01}/log/INFO
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST067
    [Documentation]    Check the status of the selected port in Telemis-HL7 Gate (port 2599, false = stopped, true = open)
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/${MyHL7Port01}/status
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    true

TEST068
    [Documentation]    Stop the port of Telemis-HL7Gate (port 2599)
    [Tags]    CRITICALITY HIGH
    # PUT request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/${MyHL7Port01}/stop
    ${response} =    PUT On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    202
    Log    ${response.content}

TEST069
    [Documentation]    Start the port of Telemis-HL7Gate (port 2599)
    [Tags]    CRITICALITY HIGH
    # PUT request
    # Please wait 5 seconds because the script has just stopped the port 2599
    Sleep    5s
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/port/${MyHL7Port01}/start
    ${response} =    PUT On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Wait Until Keyword Succeeds    15s    3s    Should Be Equal As Strings    ${response.status_code}    202
    Log    ${response.content}

TEST070
    [Documentation]    Check the configurations of the mappings in Telemis-HL7Gate, for example: names of the mapping, descriptions, scopes, types of mapping, version of dictionary, types of message, HL7 segments, etc
    [Tags]    CRITICALITY HIGH
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/mapping/
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    mappingDescription

TEST071
    [Documentation]    Create or update the mapping in Telemis-HL7Gate (name of the mapping = MYTEST95)
    [Tags]    CRITICALITY HIGH
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/json/${JsonFileHL7Gate02}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/mapping/
    ${response} =    POST On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200

TEST072
    [Documentation]    Delete a mapping of Telemis-HL7Gate (List of values for the parameter [type]: CreatePatient, UpdatePatient, MergePatient, DeletePatient, Worklist, Report)
    [Tags]    CRITICALITY HIGH
    # DELETE request
    # Please wait 7 seconds because the script has just created the mapping MYTEST95
    Sleep    7s
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/mapping/${MyMappingName02}?type=Worklist
    ${response} =    DELETE On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    # POST request, press the button [Reload the configuration] of HL7 Gate after deleting the mapping
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity03Port}
    ${endpoint} =    Set Variable    /api/config/reload?force=false
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200


### Telemis-Patient ###


TEST073
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results

TEST074
    [Documentation]    Check that the service Telemis-Patient is still running
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntity04Port}

TEST075
    [Documentation]    Identify and check the version number of Telemis-Patient
    [Tags]    CRITICALITY NORMAL
    Check Version Of Telemis Entity    ${MyEntity04Port}    ${MyEntity04Name}    ${MyEntity04VersionNbr}

TEST076
    [Documentation]    Identify and check the name and the entity ID of the application (Telemis-Patient)
    [Tags]    CRITICALITY NORMAL
    Identify And Check Name Of Telemis Entity    ${MyEntity04Port}    ${MyEntity04Name}

TEST077
    [Documentation]    Identify and check the site name of Telemis-Patient
    [Tags]    CRITICALITY LOW
    Identify And Check SiteName Of Telemis EntityV2    ${MyEntity04Port}    ${MyEntity04Name}    ${SiteName}

TEST078
    [Documentation]    Identify and check the version number of API for the service Telemis-Patient
    [Tags]    CRITICALITY LOW
    Identify And Check API version Of Telemis Entity    ${MyEntity04Port}    ${MyEntity04APIVersion}

TEST079
    [Documentation]    Identify and check the global version number of Telemis-Patient, for example: version 1.1.0, version 1.2.0, version 1.3.0, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity04Port}
    ${endpoint} =    Set Variable    /api/admin/global-version
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    1.3.0

TEST080
    [Documentation]    Identify and check the hostname of Telemis-Patient
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity04Port}
    ${endpoint} =    Set Variable    /api/admin/env/hostname
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    ${MyHostname}

TEST081
    [Documentation]    Check the informations of Telemis-Patient, for example: entity ID, entity name, hostname, date of last activity, status, version number, URL of UI, URL of API, directory of installation, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity09Port}
    ${endpoint} =    Set Variable    /site/api/entity/${MyEntity04EntityId}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    patient

TEST082
    [Documentation]    Press the button [Reload the configuration] of Telemis-Patient
    [Tags]    CRITICALITY NORMAL
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity04Port}
    ${endpoint} =    Set Variable    /api/config/reload?force=false
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST083
    [Documentation]    Check that the patient exists in TMP.hospital.be, and check the patient information, for example: patient ID, name of patient issuer, UID of patient issuer, first name, family name, address, sex, birthdate, status of VIP, birthplace, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyTmpPortNbr}
    ${endpoint} =    Set Variable    /patient?query=patient.id==${MyPatient1PatientID}&?sort=patient.name&limit=10,30
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    ${MyPatient1PatientID}

TEST084
    [Documentation]    Create a patient in TMP with the service Telemis-Patient
    [Tags]    CRITICALITY HIGH
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/json/${JsonFilePatient01}
    Create Session    mysession    https://${MyHostname}:${MyTmpPortNbr}
    ${endpoint} =    Set Variable    /patient
    ${response} =    POST On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    201
    Should Be Equal As Strings    ${response.status_code}    201
    Log    ${response.content}
    Should Contain    ${response.text}    New patient successfully created

TEST085
    [Documentation]    Delete a patient in TMP with the service Telemis-Patient
    [Tags]    CRITICALITY HIGH
    # DELETE request
    # Please wait 6s because the script has just created the patient
    Sleep    6s
    ${headers} =    Create Dictionary    Authorization=${bearerToken}    Content-Type=application/json
    # Keyword Get File of OperatingSystem
    ${body} =    Get File    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/json/${JsonFilePatient02}
    Create Session    mysession    https://${MyHostname}:${MyTmpPortNbr}
    ${endpoint} =    Set Variable    /patient
    ${response} =    DELETE On Session    mysession    ${endpoint}    data=${body}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    201
    Should Be Equal As Strings    ${response.status_code}    201
    Log    ${response.content}
    Should Contain    ${response.text}    Patient successfully deleted
    # Reset the database for the next test
    Run    ${MyFolderWorkspace}/${MyRepositoryName}/tests/data/bat/resetdb01.bat


### Telemis-Registry ###


TEST086
    [Documentation]    Check that the service Telemis-Registry is still running
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntity05Port}

TEST087
    [Documentation]    Identify and check the version number of Telemis-Registry
    [Tags]    CRITICALITY NORMAL
    Check Version Of Telemis Entity    ${MyEntity05Port}    ${MyEntity05Name}    ${MyEntity05VersionNbr}

TEST088
    [Documentation]    Identify and check the name and the entity ID of the application (Telemis-Registry)
    [Tags]    CRITICALITY NORMAL
    Identify And Check Name Of Telemis Entity    ${MyEntity05Port}    ${MyEntity05Name}

TEST089
    [Documentation]    Identify and check the site name of Telemis-Registry
    [Tags]    CRITICALITY NORMAL
    Identify And Check SiteName Of Telemis EntityV2    ${MyEntity05Port}    ${MyEntity05Name}    ${SiteName}

TEST090
    [Documentation]    Identify and check version number of API for the service Telemis-Registry
    [Tags]    CRITICALITY NORMAL
    Identify And Check API version Of Telemis Entity    ${MyEntity05Port}    ${MyEntity05APIVersion}

TEST091
    [Documentation]    Identify and check the global version number of Telemis-Registry, for example: version 1.1.0, version 1.2.0, version 1.3.0, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity05Port}
    ${endpoint} =    Set Variable    /api/admin/global-version
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    1.3.0

TEST092
    [Documentation]    Identify and check the hostname of Telemis-Registry
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity05Port}
    ${endpoint} =    Set Variable    /api/admin/env/hostname
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    ${MyHostname}

TEST093
    [Documentation]    Retrieve and check the detailed informations of Telemis-Registry, for example: entity ID, entity name, hostname, date of last activity, status, version number, URL of UI, URL of API, directory of installation, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity09Port}
    ${endpoint} =    Set Variable    /site/api/entity/${MyEntity05EntityId}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    registry

TEST094
    [Documentation]    Press the button [Reload the configuration] of Telemis-Registry
    [Tags]    CRITICALITY NORMAL
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity05Port}
    ${endpoint} =    Set Variable    /api/config/reload?force=false
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST095
    [Documentation]    Get the list of images (query at image level) and check the output informations, for example: SOP Instance UID, Image Orientation, Image Position, Width, Height, Series Description, Manufacturer Model Name, Accession Number, Modality, Patient Name, Patient Birthdate, Referring Physician, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyTmpPortNbr}
    ${endpoint} =    Set Variable    /imagequery?dicomfields=00080050,00080060,00100010,00100020&limitResults=1,5&?query=image.type=="${MyPatient1StudyType}"
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    imageOrientation

TEST096
    [Documentation]    Get the list of series (query at series level) and check the output information, for example: Series Instance UID, Modality, Series Description, Manufacturer Model Name, DICOM Class SOP UID, Refering Physician, Accession Number, Patient Name, Patient ID, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyTmpPortNbr}
    ${endpoint} =    Set Variable    /series?query=series.label==${MyPublicLabel01}&limitResults=1,10
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    ${MyPatient1SeriesDescription}

TEST097
    [Documentation]    Get the list of studies (query at study level) and check the output information, for example: Study Instance UID, Study Description, Accession Number, Modality, Patient ID, Patient Name, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyTmpPortNbr}
    ${endpoint} =    Set Variable    /study?query=study.iuid==${MyPatient1StudyIUID}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    ${MyPatient1AccessionNumber}


### Telemis-Repository ###


TEST098
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results

TEST099
    [Documentation]    Check that the service Telemis-Repository is still running
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntity06Port}

TEST100
    [Documentation]    Identify and check the version number of Telemis-Repository
    [Tags]    CRITICALITY NORMAL
    Check Version Of Telemis Entity    ${MyEntity06Port}    ${MyEntity06Name}    ${MyEntity06VersionNbr}

TEST101
    [Documentation]    Identify and check the name and the entity ID of the application (Telemis-Repository)
    [Tags]    CRITICALITY NORMAL
    Identify And Check Name Of Telemis Entity    ${MyEntity06Port}    ${MyEntity06Name}

TEST102
    [Documentation]    Identify and check the site name of Telemis-Repository
    [Tags]    CRITICALITY LOW
    Identify And Check SiteName Of Telemis EntityV2    ${MyEntity06Port}    ${MyEntity06Name}    ${SiteName}

TEST103
    [Documentation]    Identify and check version number of API for the service Telemis-Repository
    [Tags]    CRITICALITY LOW
    Identify And Check API version Of Telemis Entity    ${MyEntity06Port}    ${MyEntity06APIVersion}

TEST104
    [Documentation]    Identify and check the global version number of Telemis-Repository, for example: version 1.1.0, version 1.2.0, version 1.3.0, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity06Port}
    ${endpoint} =    Set Variable    /api/admin/global-version
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    1.3.0

TEST105
    [Documentation]    Identify and check the hostname of Telemis-Repository
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity06Port}
    ${endpoint} =    Set Variable    /api/admin/env/hostname
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    ${MyHostname}

TEST106
    [Documentation]    Retrieve and check the detailed informations of Telemis-Repository, for example: entity ID, entity name, hostname, date of last activity, status, version number, URL of UI, URL of API, directory of installation, etc
    [Tags]    CRITICALITY NORMAL
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity09Port}
    ${endpoint} =    Set Variable    /site/api/entity/${MyEntity06EntityId}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    repository

TEST107
    [Documentation]    Press the button [Reload the configuration] of Telemis-Repository
    [Tags]    CRITICALITY NORMAL
    # POST request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity06Port}
    ${endpoint} =    Set Variable    /api/config/reload?force=false
    ${response} =    POST On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}

TEST108
    [Documentation]    Check that Document ID of DICOM series exists in TMP.hospital.be, and check the directory path of the file (storage folder)
    [Tags]    CRITICALITY HIGH
    # GET request
    ${headers} =    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:${MyEntity06Port}
    ${endpoint} =    Set Variable    /api/resource/${MyPatient1DocId}
    ${response} =    GET On Session    mysession    ${endpoint}    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    Log    ${response.status_code}
    # ${status_code} =    Convert To String    ${response.status_code}
    # Should Be Equal    ${status_code}    200
    Should Be Equal As Strings    ${response.status_code}    200
    Log    ${response.content}
    Should Contain    ${response.text}    resourceId

