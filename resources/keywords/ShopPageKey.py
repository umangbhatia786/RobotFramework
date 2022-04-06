# from selenium import webdriver
# from webdrivermanager.chrome import ChromeDriverManager
import re
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class ShopPageKey:

    def __init__(self):
        self.seleniumLib = BuiltIn().get_library_instance("Selenium2Library")

    @keyword
    def add_items_to_cart_and_checkout(self, product_list):
        product_titles = self.seleniumLib.get_webelements("css:.card-title")
        index = 1
        for product_title in product_titles:
            if product_title.text in product_list:
                xpath_string = f"xpath:(//*[@class='card-footer'])[{index}]/button"
                self.seleniumLib.click_button(xpath_string)
            index += 1
        self.seleniumLib.click_element('css:li.active a')