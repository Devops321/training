*** Settings ***
Resource   resource.robot
#Test Teardown    Close Browser
Test Template    Login should fail
Suite Setup    Open login page
Suite Teardown    Close browser

*** Variables ***


*** Test Cases ***    USERNAME    PASSWORD
Invalid username      wrong_username    mode
Invalid password      demo    wrong_password
Both invalid          wrong_username    wrong_password
Empty username        ${EMPTY}    mode
Empty password        demo    ${EMPTY}
Both Empty            ${EMPTY}    ${EMPTY}	

*** Keywords ***
Login should fail
    [Arguments]    ${user}    ${password}
    #Open login page
    Go to login page	
    Give username     ${user}
    Give password    ${password}
    Click login button
    Error page should be open
    #[Teardown]    Close Browser

Go to login page
    Go to    ${URL}
	
Error page should be open
    Title Should Be    Error Page