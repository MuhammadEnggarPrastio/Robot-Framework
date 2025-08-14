*** Variables ***

#Login
${username_input}        //input[@id='username'] 
${password_input}        //*[@id='password']
${buttonlogin}           //input[@id='kc-login']

#Create Order
${Workspace}            //div[@id='SharedWorkspaces']
${Enter_Order}          //div[@id= 'enter_order']
${Sidebar}              //div[@id= 'sidebar-button-2']
${Instument_Input}      //*[@id='1:InstrumentID:0']
${Price_Input}          //*[@id='1:Price:0']
${Quantity_Input}       //*[@id='1:Quantity:0']
${Type_select}          //*[@id='1:OrderType:0-wrapper']/div/div
${Limit}                //*[@id='root']/div[3]/div//*[contains(text(), 'Limit')]
${Client_Account_Input}    //*[@id='1:Client:0']
${Order_Source_Input}      //*[@id='1:OrderSource:0']
${Buy}                  //*[@id='1:BuyOrderCommand']
${Sell}                 //*[@id='1:SellOrderCommand']
