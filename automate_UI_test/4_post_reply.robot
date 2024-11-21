*** Settings ***
Documentation     A test suite with a single test for reply post.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Test Setup        Set Selenium Speed    2s

*** Test Cases ***
POST Reply
    Open Browser To REPLY Page
    # Click Write a Reply
    Write a Reply   try to reply   
    Execute Javascript    window.console.clear();
    Click Post Reply Button
    # [Teardown]    Close Browser