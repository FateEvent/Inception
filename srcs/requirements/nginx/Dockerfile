FROM	debian:buster

RUN		apt-get update && apt-get upgrade -y \
		&& apt-get install openssl wget curl nginx -y

# We create a folder to store our key and certificate files :
RUN		mkdir -p /etc/nginx/ssl

# We use OpenSSL to generate our key and certificate files :
# sources:
#	man openssl
#	https://www.linode.com/docs/guides/create-a-self-signed-tls-certificate

RUN		openssl req -new -newkey rsa:4096 -x509 -sha512 -days 365 -nodes  \
		-subj "/C=FR/ST=Mulhouse/O=42/CN=faventur.42.fr"  \
		-out /etc/nginx/ssl/inception.crt  \
		-keyout /etc/nginx/ssl/inception.key

# openssl req -new	: generates a new certificate request
# -newkey rsa4096	: specifies that we want to generate both a new certificate and a new key with an RSA key of 4096 bits
# -x509				: to create a self-signed certificate instead of generating a certificate signing request
# -sha512			: generate the certificate request using 512-bit SHA (Secure Hash Algorithm)
# -days 365			: the certificate will be valid for 365 days
# -nodes			: skip the option to secure our certificate with a passphrase
# -subj				: allows us to specify subject without filling in prompts [/C for country, /ST for state, /O for organization, and /CN for common name]
# -out				: specifies the location of the output .crt file
# -keyout			: specifies the location of the output .key file

# Import the edited configuration file
COPY	./conf/nginx.conf	/etc/nginx/conf.d

# Serves only as documentation here
EXPOSE	443

# Forward request and error logs to docker log collector
RUN		ln -sf /dev/stdout /var/log/nginx/access.log \
		&& ln -sf /dev/stderr /var/log/nginx/error.log

# Launch Nginx in foreground [option -g : used to set global directives]
CMD 	["nginx", "-g", "daemon off;"]
