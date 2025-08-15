*** Settings ***
Library    SeleniumLibrary
Library    RPA.Excel.Files
Resource   variables.robot
Resource   locator.robot

*** Test Cases ***
Login Test
    # Buat ChromeOptions untuk bypass sertifikat SSL
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --ignore-certificate-errors
    Call Method    ${options}    add_argument    --allow-insecure-localhost

    # Buat browser Chrome dengan opsi tadi
    Create Webdriver    Chrome    options=${options}

    # Arahkan ke URL
    Go To    ${URL}
    Maximize Browser Window
    Execute Javascript    document.body.style.zoom = '60%'

    # Login
    Input Text      ${username_input}    ${USERNAME}
    Input Text      ${password_input}    ${PASSWORD}
    Click Button    ${buttonlogin}

    # Validasi login berhasil
    Wait Until Page Contains    Welcome!    timeout=10s
    Page Should Contain         Welcome!
    Sleep    5s

    # Tutup browsersss
    #Close Browser

Create Order
    
    #Open Enter Order
    Sleep    2s
    Click Element    ${Workspace}
    Click Element    ${Enter_Order}
    Click Element    ${Sidebar}
    
    # Ini order > 1
    #engaa
    # FOR    ${instrument}    ${price}    ${qty}    IN    @{OrderData}
    # Log    Ordering ${instrument} at price ${price} for quantity ${qty}
    #
    #Baca Data Dari Excel
    Open Workbook    ${EXCEL_FILE}
    ${data}=    Read Worksheet As Table    header=True
    FOR    ${row}    IN    @{data}
        ${instrument}=    Set Variable    ${row}[Instrument]
        ${price}=         Set Variable    ${row}[Price]
        ${qty}=           Set Variable    ${row}[Qty]
        
    #Input instrument
    Input Text    ${Instument_Input}    ${Instrument}
    Press Keys    ${Instument_Input}     ENTER
   
    #Input Pruce
    Sleep    3s
    Input Text    ${Price_Input}    ${price}
    Press Keys    ${Price_Input}    ENTER

    #Input Quantity
    Input Text    ${Quantity_Input}    ${qty}
    Press Keys    ${Quantity_Input}    ENTER
    
    #Select Type
    Click Element    ${Type_select}
    Click Element    ${Limit}
    
    #Input Client Account
    Input Text    ${Client_Account_Input}    ${Client_Account}
    Press Keys    ${Client_Account_Input}    ENTER

    #Input Order Source
    Input Text    ${Order_Source_Input}    ${Order_Source}
    Press Keys    ${Order_Source_Input}    ENTER

    #Buy
    Click Button    ${Sell}
    Sleep    10s
    
    ${popup_present}=    Run Keyword And Return Status    Element Should Be Visible    //*[@id="1:message"]/div
    Run Keyword If    ${popup_present}    Press Keys    //*[@id="1:message"]/div    ENTER
    
    Sleep    2s
    ${popup_present}=    Run Keyword And Return Status    Element Should Be Visible    //*[@id="1:message"]/div
    Run Keyword If    ${popup_present}    Press Keys    //*[@id="1:message"]/div    ENTER
    Sleep    2s

    END
    Close Workbook
    