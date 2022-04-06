import re
from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class RSAcademyPageKey:

    def __init__(self):
        self.seleniumLib = BuiltIn().get_library_instance("Selenium2Library")

    @keyword
    def return_email_from_text(self, input_text):
        email_regex = '[a-z0-9]+@[a-z]+\.[a-z]{2,3}'
        return re.findall(email_regex, input_text)[0]
