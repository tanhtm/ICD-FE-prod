# Setup nginx in the ICD-FE-prod folder

sudo apt-get install nginx -y

# Cài đặt certbot
echo "2. Installing certbot"
sudo apt-get install certbot python3-certbot-nginx -y

# Tạo SSL certificate với ccms.whiteneuron.com
echo "3. Creating SSL certificate: icd.kcb.vn"
sudo certbot --nginx -d icd.kcb.vn

# Cho phép truy cập từ bên ngoài
echo "3. Allowing access from outside"
sudo chmod -R 755 /var/www/ICD-FE-prod/

# Sao chép file cấu hình ngnix vào thư mục cấu hình của ngnix
echo "4. Copying ngnix configuration file"
sudo cp nginx_kcb.conf /etc/nginx/sites-available/icd-fe-kcb

# Tạo symbolic link
echo "5. Creating symbolic link"
sudo ln -s /etc/nginx/sites-available/icd-fe-kcb /etc/nginx/sites-enabled

# Kiểm tra cấu hình ngnix
echo "6. Checking ngnix configuration"
sudo nginx -t

# Khởi động lại ngnix
echo "7. Restarting ngnix"
sudo systemctl restart nginx
