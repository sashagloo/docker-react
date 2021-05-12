# Stap 1 ----------------------------------------------------
# named builder
#FROM node:alpine as builder

# unnamed builder
FROM node:alpine

WORKDIR '/app'
COPY package.json .
RUN npm install --silent
COPY . .
RUN npm run build


# Stap 2 ----------------------------------------------------
FROM nginx
# use named builder
#COPY --from=builder /app/build /usr/share/nginx/html

# use unnamed builder
COPY --from=0 /app/build /usr/share/nginx/html