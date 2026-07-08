FROM node:20-alpine AS builder

# Create app directory
WORKDIR /usr/src/app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy Prisma schema and generate client
COPY prisma ./prisma/
RUN npx prisma generate

# Copy source files
COPY tsconfig.json ./
COPY src ./src/

# Build the TypeScript app
RUN npm run build

# Production image
FROM node:20-alpine

WORKDIR /usr/src/app

# Copy package.json and install only production dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy generated Prisma client
COPY --from=builder /usr/src/app/node_modules/.prisma ./node_modules/.prisma
COPY --from=builder /usr/src/app/node_modules/@prisma ./node_modules/@prisma

# Copy built app
COPY --from=builder /usr/src/app/dist ./dist

# Expose port
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
