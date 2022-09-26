FROM node:16-alpine as builder

WORKDIR /usr/app
COPY  package.json .
COPY  package-lock.json .

RUN npm i
COPY  . . 
CMD ["npm","run","build"]

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html



