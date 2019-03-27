# subsarecool
Take subdomains from other tools like sublist3r and resolve their dns records and output to csv for easy viewing and manipulation

Done quick and dirty powershell

usage \../

1. take output of the domain/subdomain enum tool of choice (i am using sublister)
create a csv with the top of column (header) name subs.

Create the file to use like this (I used excel) >>

subs
facebook.com
mail.google.com
google.com
yahoo.com

2. save it as anything.csv
3. Run .\subsarecool.ps1
4. Enter path to the .csv with domains c:\users\test\test.csv
5. output will be saved in localpath .\subsarecool.csv




