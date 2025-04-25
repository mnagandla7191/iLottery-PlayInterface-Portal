from SeleniumLibrary import SeleniumLibrary
from PageObjectLibrary import PageObject
from selenium.webdriver.support.wait import WebDriverWait

class My_Subscription_Pages(PageObject):
    _locators = {
        #Subscriptions

        "Game_Name_xpath": "//a[contains(text(),'Game Name:')]/parent::div",
        "No_Draws": "//span[contains(text(),'Number of Draws:')]/parent::div",
        "No_plays": "//span[contains(text(),'Number of Plays:')]/parent::div",
        "Start_Draw_Date": "//span[contains(text(),'Start Draw Date:')]/parent::div | //span[contains(text(),'Start Draw:')]/parent::div",
        "End_Draw_Date": "//span[contains(text(),'End Draw Date:')]/parent::div | //span[contains(text(),'End Draw:')]/parent::div",
        "Bet_Amount": "//span[contains(text(),'Bet Amount')]/parent::div",
        "Total_Price": "//span[contains(text(),'Total Price:')]/parent::div | //span[contains(text(),'Transaction Amount:')]/parent::div",
        "transaction_id":"//span[contains(text(),'Transaction ID:')]/following-sibling::label"
      
    }
   

    def  Select_Game_From_Subscriptions_games_list(self,game_name):
        game_name=self.convert_game_name_single_string(game_name)
        xpath="//a[@data-gamename='"+game_name+"']"
        print(xpath)
        self.selib.click_element(xpath)



    def convert_game_name_single_string(self,game_name):
        gname=game_name.lower()
        gname=gname.replace(" ","")
        print("Game Name is :",gname)
        if ("All or Nothing" in game_name):
            gname='aon'
            
        if ("ikeno" in game_name or "iKeno" in game_name):
            gname='keno'
            
        self.builtin.sleep(3)
        return gname
    def Select_No_of_Draws(self,no_draws):
        xpath="//select[@id='betslip-duration']/option[@value='sub"+str(no_draws)+"']"
        self.selib.click_element(xpath)
        self.builtin.sleep(2)



            
    