
# 用于打包前端项目的docker镜像

# 方法一：基于node镜像，安装npm包，构建项目后，再基于nginx镜像打包
FROM node as build-app
COPY . /app
WORKDIR /app
RUN npm install && npm run build

FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build-app /app/build /usr/share/nginx/html
