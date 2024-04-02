FROM node:lts as build 
WORKDIR /app 
COPY package*.json ./ 
RUN npm install  --force
COPY . . 
RUN npm run build 

# Production stage
FROM node:lts
WORKDIR /app
COPY --from=build /app ./
# copy the .env.production file
# COPY --from=build /app/.env.production ./.env.production
RUN npm install -g serve
EXPOSE 3000
CMD ["npm", "start"]

# all this lines used to build image for docker
# after build image we can run(deploy the image to container not sure)