FROM python:3.10-slim

WORKDIR /app

COPY . /app

RUN chmod +x /app/deploy.sh

# 如有依赖请取消下一行注释
# RUN pip install -r requirements.txt

CMD ["./deploy.sh"] 