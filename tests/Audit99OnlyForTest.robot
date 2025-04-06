*** Settings ***

Resource    MyVariables01.robot
Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn
Library    String
Library    JSONLibrary


*** Variables ***



*** Keywords ***



*** Test Cases ***

Test1001
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results

Test1002
    [Documentation]    Check that the service Telemis-Audit is still running
    [Tags]    CRITICALITY NORMAL
    Check That Telemis Entity Is Running    ${MyEntity01Port}

Test1003
    [Documentation]    Identify and check the version number of Telemis-Audit
    [Tags]    CRITICALITY NORMAL
    Check Version Of Telemis Entity    ${MyEntity01Port}    ${MyEntity01Name}    ${MyEntity01VersionNbr}

Test1004
    [Documentation]    Identify and check the name and the entity ID of the application (Telemis-Audit)
    [Tags]    CRITICALITY NORMAL
    Identify And Check Name Of Telemis Entity    ${MyEntity01Port}    ${MyEntity01Name}

Test1005
    [Documentation]    Identify and check the site name of Telemis-Audit
    [Tags]    CRITICALITY LOW
    Identify And Check SiteName Of Telemis EntityV2    ${MyEntity01Port}    ${MyEntity01Name}    ${SiteName}

Test1006
    [Documentation]    Identify and check version number of API for Telemis-Audit
    [Tags]    CRITICALITY LOW
    Identify And Check API version Of Telemis Entity    ${MyEntity01Port}    ${MyEntity01APIVersion}

Test1007
    [Documentation]    Check the hostname of Telemis-Audit
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

Test1008
    [Documentation]    Send events to Telemis-Audit
    [Tags]    CRITICALITY HIGH
    Send My Event To Telemis Audit    ${MyXmlFile01}

Test1009
    [Documentation]    Test and check the presets (audit.preconfigured.preset.xxx) of the page "Predefined search"
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

Test1010
    [Documentation]    Check and update the configuration (cronDefinition, maxMinutesExecTime, retentionDays, batchSize, performArchive, archiveDir, simulationMode)
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

Test1011
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
