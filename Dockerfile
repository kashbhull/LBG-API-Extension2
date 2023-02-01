FROM node:14
# Copy contents into image
WORKDIR /app
COPY . .
# Install pip dependencies from requirements
RUN npm install
# Set YOUR_NAME environment variable
# ENV YOUR_NAME="BHULLAR"
# Expose the correct port
EXPOSE 9090
# Create an entrypoint
# ENTRYPOINT ["python3", "app.py"]
# Base image and entrypoint provided
# Research npm to discover how to install app and dependencies

ENTRYPOINT ["npm", "start"]