from PageObjectLibrary import PageObject


class My_Details_Page(PageObject):


    _locators = {
       "email_xpath":"xpath=//html/body/div[2]/div[2]/div[3]/div/nav/div[1]/div/div[1]/div/div[2]/div[1] | //input[@id='email']",
       "first_name_xpath":"xpath=//input[@id='firstname'] | //*[@id='accountBarDesktop']/div/div/div[1]/a/span[1]",
       "last_name_xpath":"xpath=//input[@id=lastname']",
       "My_Preferencese_xpath":"//ul[contains(@class,'my-preferences')]/li",
    }
    
        
    def Get_personal_details_from_My_details_page(self):
        email=self.selib.get_text(self.locator.email_xpath)
        first_name=self.selib.get_text(self.locator.first_name_xpath)
        # last_name=self.selib.get_text(self.locator.last_name_xpath) 
        
        print("First nameof the player is :",first_name)
        return  first_name
    
    def Verify_the_tabs_available_in_My_preferences(self):
        tab_list=[]
        first_name=self.selib.get_text(self.locator.first_name_xpath)
        tabs_count = len(self.selib.get_webelements(self.locator.My_Preferencese_xpath))
        for x in range(1,tabs_count+1):
            xpath=self.locator.My_Preferencese_xpath+"["+str(x)+"]/a"
            tab_name=self.selib.get_text(xpath)
            tab_name=tab_name.strip()
            tab_list.append(tab_name)
        print(tab_list)
        return tab_list
    
    def Get_Player_details_from_control(self):
        self.builtin.sleep(25)
        # xpath="//*[@id='nav-tabpanel-1']/div/div[2]/div/div[2]/div/div[2]/div[1]/div/div[2]/div/div/div/form/nav/div/li[8]/div[2]/span/div/span"
        xpath="//div[text()='First Name']/ancestor::div[1]/following::div//div/span"
        # self.selib.wait_until_page_contains(xpath,55)
        first_name=self.selib.get_text(xpath)
        return  first_name
    
    
        
        
        
       