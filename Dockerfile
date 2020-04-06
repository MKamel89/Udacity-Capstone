FROM ubuntu

MAINTAINER Mostafa Kamel

## Step 3:
# Update Ubuntu and install nginx
RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y nginx \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

## Step 4:
# Copy html files to Nginx directory
COPY ./index.html /var/www/html

## Step 5:
#Expose port 80
EXPOSE 80

## Step 6:
# Run nginx
CMD ["service", "nginx", "start"]
