FROM node:18.18-alpine as build

WORKDIR /app
COPY . .
RUN npm i
RUN npm run build

FROM nginx:alpine

COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
