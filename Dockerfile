# FROM my_ubuntu_163_source_nginx:18.04

# WORKDIR /var/www/html

# COPY ./totp-admin-frontend.tar.gz .

# CMD ["sh", "-c", "rm /var/www/html/index*; tar -xf /var/www/html/totp-admin-frontend.tar.gz; mv /var/www/html/dist/* /var/www/html/; service nginx start; while true; do sleep 1; done;"]

FROM ubuntu:18.04

# 换源
COPY sources.list /etc/apt/sources.list

# 更新
RUN apt update && apt install -y nginx

# # 传入nginx配置文件
# COPY default /etc/nginx/sites-available

WORKDIR /var/www/html


# # 将前端解压到网站根目录
# COPY ./totp-admin-frontend.tar.gz .
# RUN rm /var/www/html/index*
# RUN tar -xf /var/www/html/totp-admin-frontend.tar.gz
# RUN mv /var/www/html/dist/* /var/www/html/

# 启动命令
CMD ["sh", "-c", "service nginx start; while true; do sleep 1; done;"]
