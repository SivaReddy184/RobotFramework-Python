import time
from time import sleep

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selLib = BuiltIn().get_library_instance('SeleniumLibrary')

    @keyword
    def hello_world(self):
        print('Hello, this is from custom library')

    @keyword
    def add_item_to_cart(self, product_list):
        i = 1
        products_titles = self.selLib.get_webelements("css:.card-title")
        for productsTitle in products_titles:
            if productsTitle.text in product_list:
                self.selLib.click_button("xpath:(//*[@class='card-footer'])[" + str(i) + "]/button")

            i = i + 1

        self.selLib.click_link("css:li.active a")
        time.sleep(5)


