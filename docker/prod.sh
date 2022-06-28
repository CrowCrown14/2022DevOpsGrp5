echo "apt-get update";
sudo apt-get update;

sudo apt install nginx;

# Manual settings for nginx

sudo nginx -t
sudo service nginx restart