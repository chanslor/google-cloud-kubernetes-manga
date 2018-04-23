FROM node:4.4
EXPOSE 8124
COPY server.js .
COPY manga.png .
CMD node server.js
