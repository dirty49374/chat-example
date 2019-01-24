FROM node:10.12.0 AS builder

WORKDIR /app
COPY package.json .
RUN npm install

COPY app.json . 
COPY index.html .
COPY index.js .


FROM node:10.12.0
WORKDIR /app
COPY --from=builder /app /app
CMD [ "node", "index.js" ]
