*** Settings ***

Library    RequestsLibrary
Library    Collections
Library    OperatingSystem
Library    SeleniumLibrary
Library    DateTime
Library    BuiltIn
Library    String

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



*** Keywords ***

Remove My Previous Results
    [Documentation]    Delete the previous results and log files
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/geckodriver*
    # Delete the previous screenshots
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/*.png
    Remove Files    ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}
    # ${Time} =    Get Current Date
    # Create file  ${MyFolderWorkspace}/${MyRepositoryName}/results/${MyLogFile}    ${Time}${SPACE}Start the tests \n


*** Test Cases ***

Test01
    [Documentation]    Reset the test results
    [Tags]    CRITICALITY LOW
    Remove My Previous Results

Test02
    [Documentation]    Retrieve and check the site name (Telemis-Repository, 9970)
    [Tags]    CRITICALITY NORMAL
    ${headers}    Create Dictionary    Authorization=${bearerToken}
    Create Session    mysession    https://${MyHostname}:9970/api/admin    headers=${headers}    verify=${MyFolderWorkspace}/${MyRepositoryName}/tests/${MyFolderCertificate}/telemis_ca.cer
    ${response} =    GET On Session    mysession    /identity
    Log    ${response.status_code}
    Log    ${response.text}
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}    repository
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
    Should Contain    ${MyString2}    simon.be





