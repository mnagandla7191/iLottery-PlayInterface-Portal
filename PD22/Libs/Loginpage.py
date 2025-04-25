import os
from PageObjectLibrary import PageObject
from SeleniumLibrary import SeleniumLibrary
import openpyxl
import xlsxwriter
from robot.api.deco import keyword
from openpyxl import load_workbook
import JSONLibrary
import json
class Loginpage(PageObject):
        final_data=[]
        _locators = {

        }
        def Get_Login_Data_from_json_file(self):
          with open('Wager_details.json',"r") as json_data:
                    data = json.load(json_data)
          # data = json.load('Login_data1.json')
          for j in data.values():
                    print(len(j))
                    print(j[1][1])
          # print(data)
                