# Tokens
一个Token管理平台，专逆各种AI平台的对话接口，推荐使用**免费账号**加入Token池中无限薅羊毛。

## 运行

- 填写好 `config/config.yaml` 和 `docker-compose.yaml` 文件需要自定义的配置
- 在后台配置许可证，许可证请联系作者获取，qq：1727283040
- `./deploy.sh` 一键启动部署

## 模型

目前**只支持加Grok平台**的模型，后续将支持Claude、OpenAI等平台

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
curl --location --request POST 'http://localhost:你的端口/grok/v1/chat/completions' \
--header 'Content-Type: application/json' \
--data-raw '{
    "messages": [
        {
            "role": "user",
            "content": "你好"
        }
    ],
    "model": "grok-3-reasoning",
    "stream": true
}'
```

<img width="1060" alt="image" src="https://github.com/user-attachments/assets/1351b719-b4fd-416d-9e62-f14ddbb329c9" />


