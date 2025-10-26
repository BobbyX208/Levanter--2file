FROM node:20

# Install required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg imagemagick webp git curl && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy only launcher files
COPY . .

# Install yarn globally (used by your script)
RUN npm install -g yarn pm2

# Expose port if needed (adjust if bot uses another)
EXPOSE 3000

# Start the launcher (it clones and runs the real bot)
CMD ["node", "index.js"]
