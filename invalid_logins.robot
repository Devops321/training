*** Settings ***
Resource         resource.robot
Test teardown    Close browser
Force Tags       domain-invalid_logins
Default Tags     feature-username

*** Variables ***


*** Test Cases ***
Invalid username
    Login should fail    wrong_username    mode
	
Invalid password
	[Tags]    feature-password
    Login should fail    demo    wrong_password
	
Both invalid
    Login should fail    wrong_username    wrong_password

Empty username
    Login should fail    ${EMPTY}    mode

Empty password
    Login should fail    demo    ${EMPTY}

Both Empty
    Login should fail    ${EMPTY}    ${EMPTY}	

*** Keywords ***
Login should fail
    [Arguments]    ${user}    ${password}
    Open login page
    Give username     ${user}
    Give password    ${password}
    Click login button
    Error page should be open
    [Teardown]    Close Browser
	
Error page should be open
    Title Should Be    Error Page