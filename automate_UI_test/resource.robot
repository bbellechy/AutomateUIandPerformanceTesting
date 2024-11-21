*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary


*** Variables ***
${SERVER}         http://45.136.236.146:8081/
${BROWSER}        firefox
${CHROMEDRIVER}   C:\Users\jirac\Downloads\chromedriver-win64\chromedriver-win64\chromedriver.exe  
# LOG IN
${USERNAME}       todsob
${PASSWORD}       12345678

# POST DISCUSSION
${TITLE}           testrobsong
${WRITE POST}       susuๆ
${POST SUCCCESSED}  http://45.136.236.146:8081/d/105-testrobsong


# POST REPLY
${WRITE REPLY}           This is a test reply.

# EDIT REPLY
${EDIT REPLY}     try to edit
*** Keywords ***

# LOG IN
Open Browser To Login Page
    Open Browser    ${SERVER}  ${BROWSER}
    # Maximize Browser Window
    Click Log In Button
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    ITDS362

Go To Login Page
    Go To    ${SERVER}
    Login Page Should Be Open

Input Username
    [Arguments]    ${USERNAME}
    Input Text    xpath=//input[@name='identification']    ${USERNAME}

Input Password
    [Arguments]    ${PASSWORD}  
    Input Text    xpath=//input[@name='password']    ${PASSWORD}

Submit Credentials
    Click Element    xpath=//div[@class='Form-group']//button[span[text()='Log In']]

Welcome Page Should Be Open
    Location Should Be    ${SERVER} 
    # Title Should Be    ITDS362

Click Log In Button
    Click Element    xpath://button[contains(@class, 'Button--link')]//span[text()='Log In']

    
# CREATE POST DISCUSSION
Open Browser To Discussion Page
    # Open Browser    ${SERVER}  ${BROWSER}
    Maximize Browser Window
    Click Start a Discussion Button
    Discussion Page Should Be Open

Discussion Page Should Be Open
    Title Should Be    ITDS362

Go To Discussion Page
    Go To    ${SERVER}
    Discussion Page Should Be Open

Discussion Title
    [Arguments]    ${TITLE}
    Input Text    xpath=//input[@class='FormControl' and @placeholder='Discussion Title']    ${TITLE}


Discussion WRITE POST
    [Arguments]    ${WRITE POST}  
    Input Text    xpath=//textarea[contains(@class, 'TextEditor-editor')]     ${WRITE_POST}

Submit Post
    Click Button    xpath=//button[span[text()='Post Discussion']]


Choose Tag
    Click Element    xpath=//li[contains(@class, 'active')]//span[text()='General']


Submit Tag
    Click Button    xpath=//button[.//span[text()='OK']]


Post Can Created
    Location Should Be    ${POST SUCCCESSED}
    # Title Should Be    ITDS362

Click Start a Discussion Button
    # Wait Until Element Is Visible    xpath=//button[contains(@class, 'IndexPage-newDiscussion') and span[text()='Start a Discussion']] timeout=30
    Click Element    xpath=//button[contains(@class, 'IndexPage-newDiscussion') and span[text()='Start a Discussion']]


# Reply
Open Browser To REPLY Page
    Click Write a Reply

Click Write a Reply
    # Click Element    xpath=//header[@class='Post-header' and contains(text(),'Write a Reply')] ${WRITE REPLY} 
    Click Button    xpath=//button[span[text()='Reply']]
    # Click Element    xpath://button[contains(@class, 'Button--primary')]//span[text()='Post Reply']
    

Write a Reply
    [Arguments]    ${WRITE POST}  
    Input Text    xpath=//textarea[contains(@class, 'TextEditor-editor')]    ${WRITE_POST}

Click Post Reply Button
    # Click Button    xpath=//button[span[text()='Post Reply']]
    # Click Element  xpath=//button[contains(@class, 'Button--primary') and contains(@class, 'hasIcon')]/span[text()='Post Reply']

    # Click Element    xpath=//ul[contains(@class, 'TextEditor-controls Composer-footer')]//li[contains(@class, 'item-submit App-primaryControl')]//button[span[text()='Post Reply']]
    Click Button    xpath=//button[span[text()='Post Reply']]
    # Click Element    xpath://button[contains(@class, 'Button Button--primary hasIcon')]//span[text()='Post Reply']
    # Click Element    xpath=//button[contains(@class, 'Button--primary') and contains(@class, 'hasIcon')]

    

# Edit
Open Browser To EDIT REPLY Page
    Go To    ${POST SUCCCESSED}

    Click Ellipsis Button
    Click Edit Button
    # Write a Edit Reply  ${EDIT REPLY}  

Click Ellipsis Button
    Click Element    xpath=//button[contains(@class, 'Dropdown-toggle') and .//i[contains(@class, 'fa-ellipsis-h')]]

Click Edit Button
    Click Element    xpath=//button[contains(@class, 'hasIcon') and .//span[text()='Edit']]

Write a Edit Reply
    [Arguments]    ${EDIT REPLY}  
    Input Text    xpath=//textarea[contains(@class, 'TextEditor-editor')]     ${EDIT REPLY} 

Click Edit Post Button
    Click Button    xpath=//button[span[text()='Save Changes']]
    # Click Element    xpath=//button[contains(@class, 'Button--primary') and contains(@class, 'hasIcon')]


# DELETE
Click Dropdown Button
    Click Element    xpath=//button[@class='Dropdown-toggle Button Button--icon Button--primary']//i[contains(@class, 'fa-caret-down')]

Click Delete Button
    Click Element    xpath=//button[span[text()='Delete']]



# Logout
Click Username
    Go To    ${POST SUCCCESSED}
    Click Element    xpath=//button[@class='Dropdown-toggle Button Button--user Button--flat']


Click Log Out
    Click Element    xpath=//button[@class='hasIcon']//span[text()='Log Out']
 



