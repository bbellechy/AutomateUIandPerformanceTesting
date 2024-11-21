*** Settings ***
Documentation     A test suite with a single test for create Discussion.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot
Test Setup        Set Selenium Speed    1s

*** Test Cases ***
Strat a Discussion
    Open Browser To Discussion Page
    Discussion Title         testrobsong
    Discussion WRITE POST    susuๆ
    Submit Post
    Choose Tag
    Submit Tag
    Post Can Created
    # [Teardown]    Close Browser