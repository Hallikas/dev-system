kubectl create secret tls \
	tls-gamehost --cert /etc/letsencrypt/live/gamehost.fi/cert.pem --key /etc/letsencrypt/live/gamehost.fi/privkey.pem \
	-o yaml --dry-run=client | kubectl apply -f -
