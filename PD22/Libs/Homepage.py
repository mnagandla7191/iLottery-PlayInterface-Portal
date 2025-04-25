from PageObjectLibrary import PageObject
from SeleniumLibrary import SeleniumLibrary

class Homepage(PageObject):
    _locators = {

        
    "Login_Button": "//button[text()='Login ']",
    "Regiser_Button": "//a[text()='Register']",
    }

    def Click_Login_Button(self):
        self.selib.wait_until_element_is_visible(self.locator.Login_Button,30) 
        self.selib.click_element(self.locator.Login_Button)

    def Click_Register_Button(self):
        self.selib.wait_until_element_is_visible(self.locator.Regiser_Button,30)
        self.selib.click_element(self.locator.Regiser_Button)
          
        