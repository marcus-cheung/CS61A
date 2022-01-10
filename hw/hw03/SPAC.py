# libraries
import requests
import urllib.request
import time
from bs4 import BeautifulSoup #Formats info in url

# url to check
url = 'http://web.mta.info/developers/turnstile.html'

#connecting to url
response = requests.get(url)


soup = BeautifulSoup(response.text, “html.parser”)

print(soup.prettify())