FROM python:3.10-slim

WORKDIR /app

COPY . /app

RUN chmod +x /app/deploy.sh

# 如有依赖请取消下一行注释
# RUN pip install -r requirements.txt

# 这里不要再运行 deploy.sh
# 例如，如果你的应用是 main.py，可以这样：
# CMD ["python", "main.py"] 