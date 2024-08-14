from selenium import webdriver

from selenium.webdriver.chrome.options import Options

print("FOOO")
options = Options()
# options.binary_location='/var/jenkins_home/chrome-linux64'
# options.binary_location='/var/jenkins_home/chshell/chrome-headless-shell-linux64'
# options.binary_location='/mychromeshell/chrome-headless-shell-linux64'
options.binary_location='/mychromex/chrome-headless-shell-linux64'
# options.headless = True
options.add_argument("--no-sandbox")
options.add_argument("--disable-dev-shm-usage")
options.add_argument("--verbose")  # Enable verbose logging for Chrome
# options.add_argument("--log-path=/tmp/chrome.log")  # Log path for Chrome's output
options.add_argument("--disable-gpu")  # Disable GPU to avoid issues
# options.add_argument("--disable-software-rasterizer")
options.add_argument("--remote-debugging-pipe")


driver = webdriver.Chrome(options=options)

driver.get('http://demostore.supersqa.com')

print("++++++++")
print(driver.title)
print("++++++++")