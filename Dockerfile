FROM node:12.14.0-alpine3.11
# setup data
#https://blog.hasura.io/an-exhaustive-guide-to-writing-dockerfiles-for-node-js-web-apps-bbee6bd2f3c4/

# Create app directory
WORKDIR /app
# optional
# RUN npm -g install serve
COPY --from=dependencies /app/package.json ./
# Install app dependencies
RUN npm install --only=production
COPY --from=build /app ./
#CMD ["serve", "-s", "dist", "-p", "8080"]
CMD ["node", "app.js"]

EXPOSE 3000