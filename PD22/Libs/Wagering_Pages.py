from SeleniumLibrary import SeleniumLibrary
from PageObjectLibrary import PageObject
from selenium.webdriver.support.wait import WebDriverWait

class Wagering_Pages(PageObject):
    _locators = {
        #Activity
        "delete_button": "",
         
        "Quickpick_button": "//*[@class='btn btn-box btn-box-primary quickpick']",
        "Board_count": "//input[@type='text' and @aria-required='true' and @digits='true' and contains(@data-ball-qp,'Quick')] | //input[contains(@unique,'internetWagering')]",
        "privacy_policy_lbl": "xpath=//*[@id='fullPrivacyPolicyModalBody']/p",
        "privacy_policy_title": "xpath=//div[@id='fullPrivacyPolicyModalBody']/*[last()]",
        "alert_accept_btn":"id=fullPrivacyPolicyModalAcceptBtn",
        "add_a_play_btn": "xpath=//*[text()='Add a play'] | //a[@class='btn-add-play']",
        "Game_Name": "//span[contains(text(),'Game Name:')]/parent::div",
        "No_Draws": "//span[contains(text(),'Number of Draws:')]/parent::div",
        "No_plays": "//span[contains(text(),'Number of Plays:')]/parent::div",
        "Start_Draw_Date": "//span[contains(text(),'Start Draw Date:')]/parent::div | //span[contains(text(),'Start Draw:')]/parent::div",
        "End_Draw_Date": "//span[contains(text(),'End Draw Date:')]/parent::div | //span[contains(text(),'End Draw:')]/parent::div",
        "Bet_Amount": "//span[contains(text(),'Bet Amount')]/parent::div",
        "Total_Price": "//span[contains(text(),'Total Price:')]/parent::div | //span[contains(text(),'Transaction Amount:')]/parent::div",
        "transaction_id":"//span[contains(text(),'Transaction ID:')]/following-sibling::label"
      
    }
  

    def Get_Wager_details_from_confirmation_page(self,game_name,cust_key="none"):
        Wager_details_final=[]
        Board_numbers_list=[]
        game_name=self.convert_game_name_single_string(game_name)
        xpath="//ul[@data-pd='cart-items']/li | //ul[@data-pd='checkoutListItems']/li"
        print("No of games is :",len(self.selib.get_webelements(xpath)))
        No_games=len(self.selib.get_webelements(xpath))
        if No_games>=1:
            if(game_name=='pick3' or game_name=='pick4'):
                xpath1="//ul[@id='wagerconfirm']/*//div[@class='lotto-numbers']"
            elif(game_name=='megamillions'):
                xpath1="//ul[@id='wagerconfirm']/*//div[contains(@class ,'lotto-numbers-"+game_name+"')]"
            else:
                xpath1="//ul[@id='wagerconfirm']/*//div[@class='lotto-numbers']"
            No_boards=len(self.selib.get_webelements(xpath1))
            print("No of boards is :",len(self.selib.get_webelements(xpath1)))
            for y in range(1,No_boards+1):
                boardnumberslist=[]
                if(game_name=='pick3' or game_name=='pick4'):
                    xpath2=xpath1+"["+str(y)+"]/span"
                elif(game_name=='megamillions'):
                    xpath2=xpath1+"["+str(y)+"]/*//span"
                else:
                    xpath2=xpath1+"["+str(y)+"]/span"
                board_values_count=len(self.selib.get_webelements(xpath2))
                print("maruthivvvv",board_values_count)
                for x in range(1,board_values_count+1):
                    xpath=xpath2+"["+str(x)+"]/i"
                    # print(len(self.selib.get_webelements(xpath)))
                    if len(self.selib.get_webelements(xpath))>0:
                        xpath=xpath2+"["+str(x)+"]/i"
                        board_number=self.selib.get_element_attribute(xpath,'textContent')
                        print("board value :",board_number)
                        boardnumberslist.append(int(board_number))
                print(boardnumberslist)
                Board_numbers_list.append(boardnumberslist)        
        Wager_details_final.append(Board_numbers_list)
        if "KY" in cust_key:
            xpath="//a[@data-pd='cartItemDetailsBtn']"
            self.selib.click_element(xpath)
            self.selib.wait_until_element_is_visible(self.locator.Game_Name,30)
        self.builtin.sleep(3)
        Game_Name= self.selib.get_text(self.locator.Game_Name)
        print(Game_Name)
        Game_Name=Game_Name.replace("Game Name:","")       
        No_Draws= self.selib.get_text(self.locator.No_Draws)
        print(No_Draws)
        No_Draws=No_Draws.replace("Number of Draws:","")  
        No_plays= self.selib.get_text(self.locator.No_plays)
        print(No_plays)  
        No_plays=No_plays.replace("Number of Plays:","")  
        Start_Draw_Date= self.selib.get_text(self.locator.Start_Draw_Date)
        print(Start_Draw_Date)  
        Start_Draw_Date=Start_Draw_Date.replace("Start Draw Date:","")  
        End_Draw_Date= self.selib.get_text(self.locator.End_Draw_Date)
        print(End_Draw_Date)  
        End_Draw_Date=End_Draw_Date.replace("End Draw Date:","")  
        Bet_Amount= self.selib.get_text(self.locator.Bet_Amount)
        print(Bet_Amount)
        Bet_Amount=Bet_Amount.replace("Bet Amount:","")
        Bet_Amount=Bet_Amount.replace("$","")   
        Total_Price= self.selib.get_text(self.locator.Total_Price)
        Total_Price=Total_Price.replace("Total Price: ","")
        Total_Price=Total_Price.replace("$","")
        Transaction_id= self.selib.get_text(self.locator.transaction_id) 
        Wager_details_final.append(Game_Name)
        Wager_details_final.append(int(No_Draws))
        Wager_details_final.append(int(No_plays))
        Wager_details_final.append(Start_Draw_Date)
        Wager_details_final.append(End_Draw_Date)
        Wager_details_final.append(float(Bet_Amount))
        Wager_details_final.append(float(Total_Price))
        Wager_details_final.append(Transaction_id)
        return Wager_details_final
    
    def Do_Quick_Pick_by_selecting_No_of_Boards(self,no_boards,game_name,flag=0,sub_flag=0):
        game_name=self.convert_game_name_single_string(game_name)
        self.add_delete_boards(no_boards,game_name,flag,sub_flag)
        self.builtin.sleep(3)
        self.Click_on_Quick_pick_button(no_boards,game_name,flag,sub_flag)
    def Do_Manual_pick_by_selecting_No_of_Boards(self,no_boards,game_name,flag=0,sub_flag=0):
        game_name=self.convert_game_name_single_string(game_name)
        self.add_delete_boards(no_boards,game_name,flag,sub_flag)
        self.builtin.sleep(3)
        self.Enter_Board_Values_Manually(no_boards,game_name)


    def add_delete_boards(self,no_boards,game_name,flag,sub_flag):
        self.builtin.sleep(3)
        # game_name=self.convert_game_name_single_string(game_name)
        # xpath="//div[@id='srNavMain']/*//*[@class='btn btn-box btn-box-primary quickpick']"
        # No_boards=self.selib.get_webelements(xpath)
        # for x in range(0,len(No_boards)):
        #     xpath= "//button[@data-pd='quickpickbutton_"+str(x)+"_"+game_name+"']"
        #     self.selib.click_element(xpath)
        #     self.builtin.sleep(3)
            
        # self.builtin.sleep(3)
        if flag==0:
            add_play_buttton=self.locator.add_a_play_btn
            
        elif flag==1:
            # it is a favirites page
            if "eurojackpot" in game_name:
                game_name="euroJackpot"
            elif "euromillions" in game_name:
                game_name="euroMillions" 
            add_play_buttton="//*[@id='favorites-"+game_name+"']/*//a[@class='btn-add-play']"
        
        if(game_name=='pick3' or game_name=='pick4'):
           xpath="//fieldset[2]/div[@class='betslip-board-rows betslip-boardRows']/div"
        else:
            xpath="//fieldset[1]/div[@class='betslip-board-rows betslip-boardRows']/div"
        default_boards = self.selib.get_webelements(xpath)
        # print(type(no_boards))
        # if(len(default_boards)<3):
        if("euromillions" in game_name or "eurojackpot" in game_name or "euroJackpot" in game_name or "euroMillions" in game_name):
            self.selib.wait_until_element_is_visible(add_play_buttton,30)                  
            self.selib.click_element(add_play_buttton)
            self.selib.wait_until_element_is_visible(add_play_buttton,30)                  
            self.selib.click_element(add_play_buttton) 
        
        if (int(no_boards)>3):
            print("adding Boards")
            additional_boards_count = int(no_boards)-3
            print(type(additional_boards_count))
            print("additional boards need to add is :",additional_boards_count)
            
            Wager_details = self.selib.find_elements(add_play_buttton)
            Wager_details_count = len(Wager_details)
            if Wager_details_count == 0:
                self.selib.press_keys(None, "PAGE_DOWN")
            self.builtin.sleep(2)
            for i in range(1,additional_boards_count+1):
                self.selib.wait_until_element_is_visible(add_play_buttton,30)
                
                print(add_play_buttton)                  
                self.selib.click_element(add_play_buttton)
            
            
            
        elif (int(no_boards)==3):
            print("we have 3 boards")
            
        elif (int(no_boards)<3):
            additional_boards_count = 3-int(no_boards)
            print(type(additional_boards_count))
            for i in range(1,additional_boards_count+1):
                # xpath= "//form[contains(@id ,'internetWagering') or contains(@id, 'wagering-aon') or contains(@id, 'favorites-"+game_name+"')]//*/div["
                # xpath += str(i)
                # xpath+="]/div[2]/button[2]"
                xpath= "//form[contains(@id ,'internetWagering') or contains(@id, 'wagering-aon') or contains(@id, 'favorites-"+game_name+"') or contains(@id ,'subscriptions')]//*/div[1]/div[2]/button[2]"
                # print(xpath)
                self.selib.wait_until_element_is_visible(xpath,30)  
                self.selib.click_element(xpath) 
                self.builtin.sleep(3)
            if sub_flag==0:
                self.selib.reload_page()
            self.selib.wait_until_element_is_visible(xpath,30)   
            
                
            
    def Click_on_Quick_pick_button(self,no_boards,game_name,flag,sub_flag):
        print("game name is.. :",game_name)
        xpath="//div[@id='srNavMain']/*//*[@class='btn btn-box btn-box-primary quickpick'] | //form[contains(@id ,'subscriptions')]/*//*[@class='btn btn-box btn-box-primary quickpick']"
        No_boards=self.selib.get_webelements(xpath)
        for x in range(0,len(No_boards)):
            if sub_flag==1 and no_boards<3:
                y=3-no_boards
                x=x+y
            
            xpath= "//button[@data-pd='quickpickbutton_"+str(x)+"_"+game_name+"']"
            print(xpath)
            self.selib.click_element(xpath)
            self.builtin.sleep(3)
            # for i in range(1,int(no_boards)+1):
            #     if "lotto" not in game_name:
            #         xpath = "//*[contains(@id ,'internetWagering-') or contains(@id, 'wagering-aon')or contains(@id, 'favorites-"+game_name+"')]//*/div["
            #     else:
            #         if flag==0:
            #             xpath = "//*[contains(@id ,'internetWagering-') or contains(@id, 'wagering-aon')or contains(@id, 'favorites-"+game_name+"')]//*/div[3]/div["
            #         elif flag==1:
            #             xpath = "//*[contains(@id ,'internetWagering-') or contains(@id, 'wagering-aon')or contains(@id, 'favorites-"+game_name+"')]//*/div[4]/div["
            #     xpath += str(i)
            #     xpath+="]/div[2]/button[1]"
            #     print(xpath)
            #     self.selib.click_element(xpath)
            #     self.builtin.sleep(3) 
                
                

   
    
    def Enter_Board_Values_Manually(self,no_boards,game_name):
        
        print("game name is Manually:",game_name)
        print("no boards is Manually:",no_boards)
        # xpath="//*[@class='betslip-"+game_name+"']/*//div/div[contains(@class ,'"+game_name+"')]"
        
        if(game_name=='pick3' or game_name=='pick4'):
            xpath1="//fieldset[2]"
        else:
            xpath1="//fieldset[1]"
        xpath=xpath1+"/div[3]/div"
        print(xpath)
        boards_count=len(self.selib.get_webelements(xpath)) 
        print("No of boards are:",boards_count) 
        for y in range(1,boards_count+1):
            temp=1
            xpath=xpath1+"/div[3]/div["+str(y)+"]/div/div[1]/input[@type='text']"
            # print(xpath)
            # xpath1="//*[@class='betslip-"+game_name+"']/*//div["+str(y)+"]/div[contains(@class ,'"+game_name+"')]/input[@type='text' and @digits='true' and contains(@data-ball-qp,'Quick')]"
            board_values_count=len(self.selib.get_webelements(xpath))
            print("board values count on each board manual entry",board_values_count)
            # print(xpath1)
            for x in range(1,board_values_count+1):
                xpath_board=xpath1+"/div[3]/div["+str(y)+"]/div/div[1]/input[@type='text']["+str(x)+"]"
                # print(xpath+" with value", temp)
                # print(xpath_board)
                # self.selib.click_element(xpath_board)
                self.selib.input_text(xpath_board,temp)
                self.builtin.sleep(2)
                temp+=1
      #
    # def Do_manual_pick_by_selecting_No_of_Boards(self,No_boards,game_name,flag=0):
    #
    #     gname= self.convert_game_name_single_string(game_name)
    #     self.builtin.sleep(5)
    #     if flag==0:
    #         xpath="//div[@id='srNavMain']/*//*[@class='btn btn-box btn-box-primary pd-btn-clear']"
    #     elif flag==2:
    #         # this is for Jackpot Triggers
    #         gname=gname.upper()
    #         xpath="//form[@id='triggerJackpot-"+gname+"']/*//*[@class='btn btn-box btn-box-primary pd-btn-clear']"    
    #     elif flag==3:
    #         # this is for Subscription
    #         xpath="//*[@class='btn btn-box btn-box-primary pd-btn-clear']"
    #     else:
    #          # this is for favorites
    #         xpath="//*[@id='favorites-"+gname+"']/*//button[@class='btn btn-box btn-box-primary pd-btn-clear']"
    #
    #     self.selib.wait_until_element_is_visible(xpath,30)
    #     delete_Buttons=self.selib.get_webelements(xpath)
    #     delete_Button_count=len(delete_Buttons)
    #     print(delete_Button_count)
    #     if(delete_Button_count>=3):
    #         if(str(No_boards)==1):
    #             print("2 boards delete")
    #             self.selib.click_element(xpath)
    #             self.builtin.sleep(3)
    #             self.selib.click_element(xpath)
    #             self.builtin.sleep(3)
    #         else:
    #             self.selib.click_element(xpath)
    #             self.builtin.sleep(3)
    #             self.selib.click_element(xpath)
    #             self.builtin.sleep(3)
    #
    #
    #
    #
    #     # self.selib.click_element(self.locator.Quickpick_button) 

            
    def Do_Quick_quick_pick_all_boards(self,game_name):
        self.builtin.sleep(5)
        xpath="//div[@data-pd='group-tickets']/div"
        board_count=self.selib.get_webelements(xpath)
        board_count=len(board_count)
        for x in range(1,board_count+1):
            xpath="//div[@data-pd='group-tickets']/div["+str(x)+"]/*//button[@class='btn btn-box btn-box-primary quick1']"
            self.selib.click_element(xpath)
            self.builtin.sleep(2)
            
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


    
    def Select_Pick_numbers_from_ikeno_Number_panel(self,picknumbers_ikeno):
        list_numbers = self.covert_string_to_integer(picknumbers_ikeno)
        print(list_numbers)
        for x in range(len(list_numbers)):
            xpath="//div[@class='ikeno-number-picker']/ul/li/button[@id='"
            xpath+=str(list_numbers[x])
            xpath+="button']"
            self.selib.click_element(xpath)
            
              
        
        
        
    def covert_string_to_integer(self,pick_numbers):
        print("Actual String containing integers: ",pick_numbers)
        print("Type of string: ",type(pick_numbers))
        if isinstance(pick_numbers, list):
            list2=pick_numbers 
        else:
            #coverting the string into list of strings
            list1=list(pick_numbers.split())
            print("Converted string to list : ",list1)
     
            #typecasting the individual elements of the string list into integer using the map() method
            list2=list(map(int,list1))
            print("List of integers : ",list2)

        return list2

        
