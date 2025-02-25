# Tokens

## 运行

- 填写好 `config/config.yaml` 和 `docker-compose.yaml` 文件需要自定义的配置
- `docker compose up -d` 一键启动部署

## 模型支持

- `grok-2`
- `grok-2-image`
- `grok-2-search`
- `grok-3`
- `grok-3-image`
- `grok-3-deepsearch`
- `grok-3-reasoning`

## 请求示例

GROK API 端点：`http://localhost:你的端口/grok/v1/chat/completions`
在管理后台添加好 GROK 的鉴权 `cookie`(支持批量导入)

```bash
curl --location --request POST 'http://localhost:8989/grok/v1/chat/completions' \
--header 'Content-Type: application/json' \
--data-raw '{
    "messages": [
        {
            "role": "user",
            "content": "你好"
        }
    ],
    "model": "grok-3",
    "stream": true
}'
```
