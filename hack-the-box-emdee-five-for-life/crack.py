from bs4 import BeautifulSoup
import requests,hashlib,json,sys

if len(sys.argv) < 2:
    print("You gotta give the IP address\n EX: python ./crack.py 167.172.52.58:31574")
    sys.exit(-1)

ip=sys.argv[1]
print("getting the webpage")
res = requests.get("http://%s/"%ip)
cookie = res.headers["Set-Cookie"].split(";")[0]
soup = BeautifulSoup(res.text,"lxml")
text = soup.h3.get_text()
print("the text to be hashed is",text)
hashed = hashlib.md5(text.encode()).hexdigest()
body = "hash={}".format(hashed)
print("the form data is ",body)

res = requests.post("http://%s/"%ip,headers={"Cookie":cookie,"Origin":"http://%s"%ip,
"Referer":"http://%s/"%ip,"Content-Type":"application/x-www-form-urlencoded","Connection": "close",
"Content-Length": str(len(body)),"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:81.0) Gecko/20100101 Firefox/81.0",
"Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
"Accept-Language": "en-US,en;q=0.5",
"Accept-Encoding": "gzip, deflate"},
data=body)

soup = BeautifulSoup(res.text,"lxml")
print("The flag is ",soup.p.text)
file =open("some.html","w")
file.write(res.text)
file.close()