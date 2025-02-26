# Tokens
一个Token管理平台，专逆各种AI平台的对话接口，推荐使用**免费账号**加入Token池中无限薅羊毛。

## 运行

1. 填写好 `config/config.yaml` 和 `docker-compose.yaml` 文件需要自定义的配置
2. `./deploy.sh` 一键启动部署
3. 浏览器访问 `http://localhost:你的端口` 进入后台管理页面，账号密码模型都是 `admin`（请及时在系统配置中修改）
4. 在系统配置中填写许可证，许可证请联系作者获取，qq：1727283040
   
   <img width="830" alt="image" src="https://github.com/user-attachments/assets/1aba74e0-d76d-4cab-ac74-84e05ddb0530" />
5. 添加对应平台的token（现在只支持grok平台），然后就可以直接使用curl或者接入到newapi或oneapi中进行测试了
   
   <img width="805" alt="image" src="https://github.com/user-attachments/assets/a48f2ea1-9367-47d1-9722-c208b5efede8" />
6. 在newapi或oneapi中的密钥可以随便填写，代理填写：`http://localhost:你的端口/grok`，本程序没有任何鉴权，也不建议把程序暴露到公网，建议使用newapi或者oneapi进行请求


## 模型

目前**只支持加Grok平台**的模型，后续将支持Claude、OpenAI等平台

- `grok-2`：
- `grok-2-image`：使用grok2进行生图
- `grok-2-search`：使用grok2进行联网搜索
- `grok-3`
- `grok-3-image`：使用grok3进行生图
- `grok-3-deepsearch`：使用grok3进行深度联网搜索
- `grok-3-reasoning`：使用grok3进行思考

> 一个Grok谱号可以分别调用很多次以上模型，程序都是轮训自动监控一个号模型上限，把次数薅到极致！！！

## API端点请求示例

GROK API 端点：`http://localhost:你的端口/grok/v1/chat/completions`

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


