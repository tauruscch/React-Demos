
# ���ڴ��ǰ����Ŀ��docker����

# ����һ������node���񣬰�װnpm����������Ŀ���ٻ���nginx������
FROM node as build-app
COPY . /app
WORKDIR /app
RUN npm install && npm run build

FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build-app /app/build /usr/share/nginx/html
