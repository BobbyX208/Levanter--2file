FROM node:20

# Install required system packages and yarn globally
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg imagemagick webp git curl && \
    npm install -g yarn pm2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy launcher code
COPY . .

# Expose default port (optional)
EXPOSE 3000

# Run launcher
CMD ["node", "index.js"]
