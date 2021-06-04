# FROM node:12

# # set working directory
# WORKDIR /app

# COPY . ./

# FROM fholzer/nginx-brotli:v1.12.2

# WORKDIR /etc/nginx
# ADD nginx.conf /etc/nginx/nginx.conf

# COPY --from=build /app/build /usr/share/nginx/html

# EXPOSE 3000

# CMD ["nginx", "-g", "daemon off;"]






FROM node:12

# set working directory
WORKDIR /app


# COPY . ./

# FROM fholzer/nginx-brotli:v1.12.2

# WORKDIR /etc/nginx

# ADD nginx.conf /etc/nginx/nginx.conf

# COPY --from=build /app/build /usr/share/nginx/html

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies
COPY package.json ./
# COPY package-lock.json ./

# npm install --save-dev sonarqube-scanner
RUN npm install
# RUN npm install react-scripts@3.4.1 -g --silent      

# Install trufflehog 
# RUN npm install trufflehog

# Run trufflehog
# RUN truffleHog --regex --entropy=False https://github.com/dxa4481/truffleHog.git
# RUN trufflehog --json --regex https://github.com/SadiaAshfaq2812/react-buggy.git > trufflehog
# RUN docker pull gesellix/trufflehog
# RUN docker run gesellix/trufflehog --json --regex https://github.com/SadiaAshfaq2812/react-buggy.git > trufflehog

# add app
COPY . ./

# start app
CMD ["npm", "start"]

EXPOSE 8080 