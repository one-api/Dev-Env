socat openssl-listen:443,fork,reuseaddr,cert=cert.pem,key=key.pem,verify=0 tcp-connect:localhost:80
