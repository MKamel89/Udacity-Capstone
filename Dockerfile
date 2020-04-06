FROM nginx:alpine

## Step 1:
#Copy html files to Nginx directory
COPY ./index.html /usr/share/nginx/html

## Step 2:
#Expose port 80
EXPOSE 80