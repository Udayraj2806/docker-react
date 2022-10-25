# this can be said kind of temporary container 

FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# whatrver the output from the above temporary container that is the build floder
# is given frther to the new container
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
 
 