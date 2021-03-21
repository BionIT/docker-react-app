# step one
FROM node:alpine
WORKDIR 'usr/simple-app'

COPY package.json .
RUN npm install
COPY . .

#this command build production ready file with output being build folder
RUN npm run build

# step two, a new from statement terminates the first block
FROM nginx
COPY --from=0 /usr/simple-app/build /usr/share/nginx/html
# default command for nginx thus don't need to put start up command here
