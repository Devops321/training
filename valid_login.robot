*** Settings ***
Resource   resource.robot

*** Variables ***


*** Test Cases ***
Login should pass
    Open login page
    Give username     demo
    Give password    mode
    Click login button
    Welcome page should be open
    [Teardown]    Close Browser

*** Keywords ***	
Welcome page should be open
    Title Should Be    Welcome Page