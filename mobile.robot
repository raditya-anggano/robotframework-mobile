*** Settings ***
Library                 AppiumLibrary
Variables               apiDemosLocator.yaml
Test Setup              Start Session
Test Teardown           Close Application

*** Keywords ***
Start Session
    Set Appium Timeout  10
    Open Application    http://localhost:4723/wd/hub
    ...                 automationName=UiAutomator2
    ...                 platformName=Android
    ...                 deviceName=emulator-5554
    ...                 appPackage=io.appium.android.apis
    ...                 appActivity=io.appium.android.apis.ApiDemos
    ...                 autoGrantPermissions=true
    ...                 noReset=true
    Sleep               1

Tap Accessibility
    Tap                 ${accessibility}    
# Tap Accessibility Node Provider
#     Tap                 ${accessbility_node_provider}                   

Close Session
    Capture Page Screenshot
    Quit Application

*** Test Cases ***
As a user i want to open API Demos apps
    Page should contain Text    Accessibility
    Tap                         ${accessibility}
    Sleep                       1