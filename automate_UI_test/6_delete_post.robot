*** Settings ***
Documentation     A test suite with a single test for Delete Discussion.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Delete a Discussion
    Click Dropdown Button
    Click Delete Button
    Click Username
    # [Teardown]    Close Browser