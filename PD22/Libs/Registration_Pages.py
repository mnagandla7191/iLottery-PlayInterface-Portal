from SeleniumLibrary import SeleniumLibrary
from PageObjectLibrary import PageObject
from selenium.webdriver.support.wait import WebDriverWait
import openpyxl
import os 
import random
class Registration_Pages(PageObject):
    _locators = {
        #registration page
        "username_txt":"id=username",
        "email_txt":"id=email",
        "confirm_email_txt":"id=confirmemail",
        "password_txt":"id=password",
        "confirm_password_txt":"id=confirmpassword",
        "citizenship_drp":"id=citizenship",
        "dollar_lbl":"xpath=//div[@class='btn-group']//label[1]",
        "pound_lbl" :"xpath=//div[@id='shell']//label[2]",
        "euro_lbl"  : "xpath=//div[@id='shell']//label[3]",
        "canadian_dollar_lbl":"xpath=//label[4]//span[2]",
        "security_question_drp":"id=securityquestion_0",
        "security_answer":"id=securityAnswer_0",
        "terms_condition_chk":"xpath=//label[@for='light_tandcs']",
        "submit_btn":"id=regUpgradeSubmit",
        "start_exploring_btn":"id=regSuccessSecondary",
        "enhance_chk":"xpath=//label[@for='fullRegistrationCheckbox']",
        "next_btn":"xpath=//button[contains(text(),'Next')]",
        "privacy_lbl":"xpath=//div[@id='modal-privacyPolicyFullDataModal']//p[@id='fullPrivacyPolicyModalSubTitle']",
        "privacy_accept_btn":"id=fullPrivacyPolicyModalAcceptBtn",
        "firstname_txt":"id=firstname",
        "lastname_txt":"id=lastname",
        "gender_drp":"id=gender",
        "dob_txt":"id=dob",
        "year_btn":"xpath=//*/div[3]//*/td/span[2]",
        "month_txt":"xpath=//*/div[2]//*/td/span[3]",
        "day_btn":"xpath=//*/tr[1]/td[6]",
        "address_txt":"id=address1",
        "town_txt":"id=town",
        "zipcode_txt":"id=postcode",
        "state_drp":"id=state",
        "ssn_txt":"id=socialSecurityNumber",
        "country_drp":"id=country",
        "phone_txt":"id=mobile",
        "tangable_reward_btn":"xpath=//form[@id='regstep2form']//*/li[1]//*/div[2]/div/label",
        "rewards_ok_btn":"xpath=//div[@id='modal-consent-consentsAlert']//*/div[3]/div/button",
        "i_have_read_chk":"xpath=//form[@id='regstep2form']/fieldset[4]/div/label",
        "full_submit_btn":"id=regSubmit",
        "play_now_btn":"xpath=//button[@id=regSuccessSecondary] | //button[@id='regSuccessPrimary']",
        "privacy_policy_lbl_upgrade": "xpath=//*[@id='upgradePrivacyPolicyModalBody']/p",
        "privacy_policy_lbl_full": "xpath=//*[@id='fullPrivacyPolicyModalBody']/p",
          
        "privacy_policy_title": "xpath=//div[@id='upgradePrivacyPolicyModalBody']/*[last()] | //*[@id='fullPrivacyPolicyModalBody']/*[last()]",
        "alert_accept_btn_upgrade":"xpath=//*[@id='upgradePrivacyPolicyModalAcceptBtn']",
        "alert_accept_btn_full":"xpath=//*[@id='fullPrivacyPolicyModalAcceptBtn']",
        
        "upgrade_submit_btn":"id=regUpgradeSubmit",
      
    }
    
    
    def Enter_Player_details_for_Upgrade_registration(self):
        self.selib.wait_until_element_is_visible(self.locator.privacy_policy_lbl_upgrade,30)
        self.builtin.sleep(5, 'waiting for alert')
        self.selib.click_element(self.locator.privacy_policy_lbl_upgrade)    
        element = self.browser.find_element_by_xpath("//div[@id='upgradePrivacyPolicyModalBody']/*[last()]"); 
        self.browser.execute_script('arguments[0].scrollIntoView(true);',element)    
        self.selib.press_keys(None, "PAGE_DOWN")
        self.selib.press_keys(None, "RETURN")
        self.builtin.sleep(10)
        self.selib.click_button(self.locator.alert_accept_btn_upgrade)
    
    def Enter_Player_details_for_Full_registration(self):
        self.selib.wait_until_element_is_visible(self.locator.privacy_policy_lbl_full,30)
        self.builtin.sleep(5, 'waiting for alert')
        self.selib.click_element(self.locator.privacy_policy_lbl_full)    
        
        element = self.selib.find_element("//*[@id='fullPrivacyPolicyModalBody']/*[last()]"); 
        self.browser.execute_script('arguments[0].scrollIntoView(true);',element) 
            
        self.selib.press_keys(None, "PAGE_DOWN")
        self.selib.press_keys(None, "RETURN")
        self.builtin.sleep(10)
        self.selib.click_button(self.locator.alert_accept_btn_full)
        
    def enter_full_registration_details_Next_Page(self):
        zipcode=52300   
        self.selib.click_element(self.locator.dob_txt)
        self.selib.click_element(self.locator.year_btn)
        self.selib.click_element(self.locator.month_txt)
        self.selib.click_element(self.locator.day_btn)
     
        self.selib.input_text(self.locator.address_txt,"4th cross fifth avenue")        
        self.selib.input_text(self.locator.town_txt,"Cincinnati")
        self.selib.input_text(self.locator.zipcode_txt,zipcode)        
        self.selib.select_from_list_by_label(self.locator.state_drp,"OH")        
        ssnnum=Registration_Pages.generate_4_random_number()
        print('ssnnum='+ssnnum)
        self.selib.input_text(self.locator.ssn_txt,ssnnum)        
        self.selib.select_from_list_by_label(self.locator.country_drp,"United States")   
        phone=Registration_Pages.generate_10_random_number()
        print('phone='+phone)
        self.selib.input_text(self.locator.phone_txt,phone) 
    
        self.selib.click_element(self.locator.tangable_reward_btn)
        print("tangable selected")
        self.selib.wait_until_page_contains_element(self.locator.rewards_ok_btn,20)
        print("Rewards")
        
        self.builtin.sleep(4)
        element = self.browser.find_element_by_xpath("//div[@id='modal-consent-consentsAlert']/*[last()]"); 
       
        self.browser.execute_script('arguments[0].scrollIntoView(true);',element) 
        print("Rewards")
        result=self.selib.find_element(self.locator.rewards_ok_btn)
        # self.selib.click_element(self.locator.rewards_ok_btn)
        self.selib.wait_until_page_contains_element(self.locator.i_have_read_chk,20)
        element = self.browser.find_element_by_xpath("//div[@id='personalinformation']/*[last()]"); 
        self.browser.execute_script('arguments[0].scrollIntoView(true);',element)
        self.selib.click_element(self.locator.rewards_ok_btn)
        print("popup open")
        self.builtin.sleep(4)
        self.selib.click_element(self.locator.i_have_read_chk)        
        self.selib.wait_until_page_contains_element(self.locator.submit_btn,20)
        print("reading is done")
        self.selib.click_element(self.locator.submit_btn)
        self.builtin.sleep(10)

    
        
    # def enter_full_registration_details_Next_Page(self,customer="KY"):
    #     zipcode=52300   
    #     self.selib.click_element(self.locator.dob_txt)
    #     self.selib.click_element(self.locator.year_btn)
    #     self.selib.click_element(self.locator.month_txt)
    #     self.selib.click_element(self.locator.day_btn)
    #
    #     self.selib.input_text(self.locator.address_txt,"4th cross fifth avenue")        
    #     self.selib.input_text(self.locator.town_txt,"Cincinnati")
    #     self.selib.input_text(self.locator.zipcode_txt,zipcode)        
    #     self.selib.select_from_list_by_label(self.locator.state_drp,"KY")        
    #     ssnnum=Registration_Pages.generate_4_random_number()
    #     print('ssnnum='+ssnnum)
    #     self.selib.input_text(self.locator.ssn_txt,ssnnum)
    #     if "KY" not in customer:        
    #         self.selib.select_from_list_by_label(self.locator.country_drp,"United States")   
    #     phone=Registration_Pages.generate_10_random_number()
    #     print('phone='+phone)
    #     self.selib.input_text(self.locator.phone_txt,phone) 
    #     if "KY" not in customer: 
    #         self.selib.click_element(self.locator.tangable_reward_btn)
    #         print("tangable selected")
    #         self.selib.wait_until_page_contains_element(self.locator.rewards_ok_btn,20)
    #         print("Rewards")
    #
    #         self.builtin.sleep(4)
    #         element = self.browser.find_element_by_xpath("//div[@id='modal-consent-consentsAlert']/*[last()]"); 
    #
    #         self.browser.execute_script('arguments[0].scrollIntoView(true);',element) 
    #         print("Rewards")
    #         result=self.selib.get_element_attribute(self.locator.rewards_ok_btn,'class')
    #         if 'ng-not-empty' in result:
    #             print("cameout")
    #             self.selib.click_element(self.locator.rewards_ok_btn)
    #         self.builtin.sleep(4)
    #         print("cameout")
    #         self.selib.wait_until_page_contains_element(self.locator.i_have_read_chk,20)
    #         element = self.browser.find_element_by_xpath("//div[@id='personalinformation']/*[last()]"); 
    #         self.browser.execute_script('arguments[0].scrollIntoView(true);',element)
    #         print("popup open and not KY")
    #         self.builtin.sleep(4)
    #         self.selib.click_element(self.locator.i_have_read_chk)        
    #         self.selib.wait_until_page_contains_element(self.locator.upgrade_submit_btn,20)
    #         print("reading is done")
    #         self.selib.click_element(self.locator.upgrade_submit_btn)
    #         self.builtin.sleep(10)
    #         xpath="//a[text()='OK']"
    #         self.selib.wait_until_page_contains_element(xpath,20)
    #         self.selib.click_element(xpath)
    #     elif "KY" in customer:
    #         xpath="//*[@id='regstep2form']/fieldset[3]/div/label"
    #         self.selib.wait_until_page_contains_element(xpath,20)
    #         element = self.browser.find_element_by_xpath("//div[@id='personalinformation']/*[last()]"); 
    #         self.browser.execute_script('arguments[0].scrollIntoView(true);',element)
    #         print("popup open")
    #         self.builtin.sleep(4)
    #         self.selib.click_element(xpath)
    #         self.builtin.sleep(2)
    #         xpath_submit="//button[@id='regSubmit']"  
    #         self.selib.click_element(xpath_submit)      
    #     # # result=self.selib.find_element(xpath)
    #     # # if result:
    #     # #     self.selib.click_element(xpath)
    #         self.builtin.sleep(60)
    #         self.selib.wait_until_page_contains_element(self.locator.play_now_btn,30)
    #         self.selib.click_element(self.locator.play_now_btn)
    #         self.builtin.sleep(10)
        
    def generate_4_random_number(self):  
        num2 = random.randint(1000, 9999)
        print("Random integer: ", num2)
        return str(num2)    
    
    def generate_10_random_number(self):  
        num2 = random.randint(1000000000, 9999999999)
        print("Random integer: ", num2)
        return str(num2)  
    
    
    def scroll_down_in_page(self):
        self.selib.press_keys(None, "PAGE_DOWN")
        # self.selib.press_keys(None, "RETURN")       
  