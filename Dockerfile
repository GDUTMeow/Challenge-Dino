FROM nginx:alpine

ARG ATTACKR_FLAG

# 复制src目录下的文件到Nginx的Web根目录
COPY src/ /usr/share/nginx/html

# 替换 flag
RUN sed -i 's/{{flag}}/'"$ATTACKR_FLAG"'/g' /usr/share/nginx/html/index.html

RUN echo 'server { listen 8080; server_name localhost; location / { root /usr/share/nginx/html; index index.html index.htm; } }' > /etc/nginx/conf.d/default.conf

# 暴露8080端口
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]