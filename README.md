# Tokens
一个Token管理平台，专逆各种AI平台的对话接口，推荐使用**免费账号**加入Token池中无限薅羊毛。

## 运行

- 填写好 `config/config.yaml` 和 `docker-compose.yaml` 文件需要自定义的配置
- 在后台配置许可证，许可证请联系作者获取，qq：1727283040
- `./deploy.sh` 一键启动部署

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

<img width="1554" alt="image" src="https://github.com/user-attachments/assets/519901c9-0d71-45be-8dc9-cef65941290b" />


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

<img width="1056" alt="image" src="https://github.com/user-attachments/assets/e5659df6-50d2-4e2e-99c3-936eb3a01e4a" />

