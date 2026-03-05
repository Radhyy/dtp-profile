# Stage 1 - Builder
FROM alpine:latest AS builder
WORKDIR /app
COPY index.html .

# Stage 2 - Production
FROM nginx:alpine
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
