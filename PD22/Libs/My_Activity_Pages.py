from SeleniumLibrary import SeleniumLibrary
from PageObjectLibrary import PageObject
from selenium.webdriver.support.wait import WebDriverWait

class My_Activity_Pages(PageObject):
    _locators = {
        #Activity
        
    "game_history_Latest_record": "//div[@id='activityGamesList']//*/a[1]",
    "financial_history_Latest_record": "//div[@id='finActivityGamesList']//*/a[1]",
    "Start_Date": "//span[contains(text(),'Start Date')]/following-sibling::span", 
    "End_Date":"//span[contains(text(),'End Date')]/following-sibling::span", 
    "No_Draws": "//span[contains(text(),'Number of Draws')]/following-sibling::span", 
    }

    def Get_Game_History_Details(self):
        Game_History_Details=[]
        self.selib.wait_until_element_is_visible(self.locator.game_history_Latest_record,30)
        xpath_wager_amount="//div[@id='activityGamesList']//*/a[1]/*//span[contains(text(),'WAGER')]/following-sibling::span"       
        wager_amount=self.selib.get_text(xpath_wager_amount)
        if 'Free Ticket' in wager_amount:
            xpath_wager_amount = "//div[@id='activityGamesList']/*//div[@class='panel panel-default'][2]//*/a[1]/*//span[contains(text(),'WAGER')]/following-sibling::span"
            wager_amount=self.selib.get_text(xpath_wager_amount)
            xpath_game_name= "//div[@id='activityGamesList']/*//div[@class='panel panel-default'][2]//*/a[1]/*//span[contains(text(),'Draw Game')]/following-sibling::span"
        else:        
            xpath_game_name="//div[@id='activityGamesList']//*/a[1]/*//span[contains(text(),'Draw Game')]/following-sibling::span"
            
        wager_amount=self.selib.get_text(xpath_wager_amount)
        Game_Name= self.selib.get_text(xpath_game_name)
        wager_amount=wager_amount.replace("$","")
        Game_History_Details.append(Game_Name)
        Game_History_Details.append(float(wager_amount))
        
        return  Game_History_Details
    
    def Get_Game_History_Summary_Details(self):
        
        Game_History_Summary_Details=[]
        boardnumberslist_final=[] 
        xpath_wager_amount="//div[@id='activityGamesList']//*/a[1]/*//span[contains(text(),'WAGER')]/following-sibling::span"       
        wager_amount=self.selib.get_text(xpath_wager_amount)
        if 'Free Ticket' in wager_amount:
            xpath = "//*[@id='activityGamesList']/*//div[@class='panel panel-default'][2]"
            self.selib.click_element(xpath)
        else:        
            self.selib.wait_until_element_is_visible(self.locator.game_history_Latest_record,30) 
            self.selib.click_element(self.locator.game_history_Latest_record)
        xpath="//div[@class='lotto-numbers']"
        self.selib.wait_until_element_is_visible(xpath,30) 
        No_boards=len(self.selib.get_webelements(xpath))
        print("No of boards is :",len(self.selib.get_webelements(xpath)))
        for y in range(1,No_boards+1):
            boardnumberslist=[]
            xpath="//div[@class='my-activity-item-panel__lotto-numbers-container']["+str(y)+"]/*//span"
            board_values_count=len(self.selib.get_webelements(xpath))
            for x in range(1,board_values_count+1):
                xpath="//div[@class='my-activity-item-panel__lotto-numbers-container']["+str(y)+"]/*//span["+str(x)+"]/i"
                # print(len(self.selib.get_webelements(xpath)))
                if len(self.selib.get_webelements(xpath))>0:
                    xpath="//div[@class='my-activity-item-panel__lotto-numbers-container']["+str(y)+"]/*//span["+str(x)+"]/i"
                    
                    board_number=self.selib.get_element_attribute(xpath,'textContent')
                    # print("board value :",board_number)
                    if not 'X' in board_number: 
                        boardnumberslist.append(int(board_number))
                # if len(self.selib.get_webelements(xpath))>0:
                #     xpath="//div[@class='my-activity-item-panel__lotto-numbers-container']["+str(y)+"]/*//span["+str(x)+"]/i"
                #     board_number=self.selib.get_element_attribute(xpath,'textContent')
                #     print("board value :",board_number)
                #     boardnumberslist.append(int(board_number))
            boardnumberslist_final.append(boardnumberslist)
        Game_History_Summary_Details.append(boardnumberslist_final)
        Start_Draw_Date= self.selib.get_text(self.locator.Start_Date)
        Start_Draw_Date=Start_Draw_Date.replace("Start Draw Date","")  
        End_Draw_Date= self.selib.get_text(self.locator.End_Date)
        End_Draw_Date=End_Draw_Date.replace("End Draw Date","")
        No_Draws= self.selib.get_text(self.locator.No_Draws)
        No_Draws=No_Draws.replace("Number of Draws","")            
        Game_History_Summary_Details.append(Start_Draw_Date)
        Game_History_Summary_Details.append(End_Draw_Date)
        Game_History_Summary_Details.append(int(No_Draws))
        
        return  Game_History_Summary_Details
    
    def Get_Financial_History_Details(self):
        Financial_History_Details=[]
        self.selib.wait_until_element_is_visible(self.locator.financial_history_Latest_record,30) 
        xpath="//div[@id='finActivityGamesList']//*/a[1]/*//span[contains(text(),'Amount')]/following-sibling::span"
        f_Amount= self.selib.get_text(xpath)
        f_Amount=f_Amount.replace("-$","")
        xpath="//div[@id='finActivityGamesList']//*/a[1]/*//span[@class='my-activity-list-item-header__value my-activity-list-item-header__value--main']"
        Transaction_type=self.selib.get_text(xpath)
        
        Financial_History_Details.append(float(f_Amount))
        Financial_History_Details.append(Transaction_type)
        
        return  Financial_History_Details
        
    def Get_Financial_History_Summary_Details(self):
        self.selib.wait_until_element_is_visible(self.locator.financial_history_Latest_record,30)
        self.selib.click_element(self.locator.financial_history_Latest_record)
        xpath="//div[@id='finActivityGamesList']/*//span[contains(text(),'Comment')]/following-sibling::span"
        self.selib.wait_until_element_is_visible(xpath,30)
        comment_message=self.selib.get_text(xpath)
        return  comment_message 