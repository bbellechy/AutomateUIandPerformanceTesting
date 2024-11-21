*** Settings ***
Documentation     A test suite with a single test for edit post.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Test Setup        Set Selenium Speed    2s
*** Test Cases ***
Reply Discussion
    Open Browser To EDIT REPLY Page
    Write a Edit Reply   try to edit
    Click Edit Post Button
    # [Teardown]    Close Browser