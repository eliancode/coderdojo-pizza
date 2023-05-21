import json
import re

from selenium import webdriver
from selenium.webdriver.common.by import By

DRIVER_PATH = '/home/sbj/Downloads/chromedriver/chromedriver'
BASE_URL = 'https://el-salvatore.lieferbuddy.de/de/shop'


def scrape():
    results = []
    pattern = re.compile(r'(\d*,\d{2}) €')
    driver = webdriver.Chrome(executable_path=DRIVER_PATH)
    driver.get(BASE_URL)
    data = driver.find_elements(By.CLASS_NAME, 'cart-add')
    for d in data:
        size = d.get_attribute('data-atype')
        name = d.get_attribute('data-aname')
        price = re.search(pattern, d.text).group(0)
        if "Pizza" in name:
            results.append({'name': name, 'size': size, 'price': price})

    json_str = json.dumps(results, indent=4)
    with open('output/articles.json', 'w') as f:
        f.write(json_str)


if __name__ == '__main__':
    scrape()
