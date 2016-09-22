*** Settings ***
Library   Selenium2Library

*** Variables ***
${HOST}    localhost:7272
${URL}    http://${HOST}
${DELAY}    0

*** Keywords ***
Open login page
    Open Browser    ${URL}
    SET selenium speed    ${DELAY}	
	
Give username
    [Arguments]    ${username}
    Input text    username_field    ${username}
	
Give password
    [Arguments]    ${password}
    Input text    password_field    ${password}

Click login button
	Click button    login_button