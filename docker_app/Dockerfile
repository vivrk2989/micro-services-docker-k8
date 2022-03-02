FROM node:latest as APP

WORKDIR /usr/src/app

COPY /app /usr/src/app/ 

#EXPOSE 3000

#CMD ["node", "app.js"]

FROM node:alpine

COPY --from=app /usr/src/app /usr/src/app
# This is the magic line that compresses the size

WORKDIR /usr/src/app

# define the port

EXPOSE 3000

# start the app with CMD

CMD ["node","app.js"]
