*** Settings ***
Documentation     A test suite with a single test for Logout.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Test Setup        Set Selenium Speed    1s
*** Test Cases ***
Logout
    Click Username
    Click Log Out
    [Teardown]    Close Browser
