
##self sign cert
```
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -sha256 -days 365 -noenc
```

##socat tls server
```
socat openssl-listen:443,fork,reuseaddr,cert=cert.pem,key=key.pem,verify=0 tcp-connect:localhost:80
```
