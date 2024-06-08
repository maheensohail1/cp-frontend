# Use node image as base
FROM node:20

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application to the container
COPY . .

# Build Next.js app
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 3000
EXPOSE 4000
CMD ["nginx", "-g", "daemon off;"]
# Command to run the Next.js server
CMD ["npm", "run", "dev", "--", "--host"]
