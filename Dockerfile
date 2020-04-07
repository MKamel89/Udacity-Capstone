FROM ubuntu:18.04

## Step 2:
# Update Ubuntu and install nginx
RUN apt-get update -y \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

## Step 3:
# Copy html files to Nginx directory
COPY ./index.html /var/www/html

## Step 4:
#Expose port 80
EXPOSE 80

## Step 5:
# Run nginx
CMD ["service", "nginx", "start"]
