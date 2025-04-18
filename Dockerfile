FROM python:3.10-slim

WORKDIR /app

COPY . /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates && \
    # 安装 Docker CLI
    curl -fsSL https://get.docker.com -o get-docker.sh && \
    sh get-docker.sh && \
    # 安装 Docker Compose v2（compose 插件）
    apt-get install -y docker-compose-plugin && \
    # 清理缓存
    rm -rf /var/lib/apt/lists/* get-docker.sh

RUN chmod +x /app/deploy.sh

# 如有依赖请取消下一行注释
# RUN pip install -r requirements.txt

CMD ["./deploy.sh"] 