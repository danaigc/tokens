# Tokens

> [!IMPORTANT]
> ✨ 程序自带过盾，无视任何cloudflare防御，放心使用

一个Token管理平台，专逆各种AI平台的对话接口，推荐使用**免费账号**加入Token池中无限薅羊毛。

## 运行

1. 填写好 `config/config.yaml` 和 `docker-compose.yaml` 文件需要自定义的配置
2. `./deploy.sh` 一键启动部署
3. 浏览器访问 `http://localhost:你的端口` 进入后台管理页面，账号密码模型都是 `admin`（请及时在系统配置中修改）
4. 在系统配置中填写许可证，许可证请联系作者获取，qq：1727283040
   
   <img width="829" alt="image" src="https://github.com/user-attachments/assets/d0392eba-6185-4e9e-8ec2-453204244128" />
5. 添加对应平台的token（现在只支持grok平台），然后就可以直接使用curl或者接入到newapi或oneapi中进行测试了
   
   <img width="805" alt="image" src="https://github.com/user-attachments/assets/a48f2ea1-9367-47d1-9722-c208b5efede8" />
6. 在newapi或oneapi中的密钥：你的许可证，代理填写：`http://localhost:你的端口/grok`，建议使用newapi或者oneapi进行请求


## 模型

目前**只支持加Grok平台**的模型，后续将支持Claude、OpenAI等平台

- `grok-2`：
- `grok-2-image`：使用grok2进行生图
- `grok-2-search`：使用grok2进行联网搜索
- `grok-3`：可开启自动调用联网、生图、思考以及深度网络搜索能力(需在后台系统配置中手动开启)
- `grok-3-image`：使用grok3进行生图
- `grok-3-deepsearch`：使用grok3进行深度联网搜索
- `grok-3-reasoning`：使用grok3进行思考

> 一个Grok谱号可以分别调用很多次以上模型，程序都是轮训自动监控一个号模型上限，把次数薅到极致！！！
> 支持openai标准格式的**文件图片上传**，文件（包括图片）可以传url或者base64格式

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

## 后台功能界面

<img width="1506" alt="image" src="https://github.com/user-attachments/assets/931563d3-6962-412c-985e-91d964b326a1" />

<img width="1504" alt="image" src="https://github.com/user-attachments/assets/ab18db45-51c9-40f1-baa6-6ab3c512393d" />

<img width="1509" alt="image" src="https://github.com/user-attachments/assets/12876ef1-7431-4246-accf-1f23be26195b" />

<img width="1504" alt="image" src="https://github.com/user-attachments/assets/18183171-8f2c-4b95-839e-9ab86d9914c6" />

<img width="1503" alt="image" src="https://github.com/user-attachments/assets/3eb2d88f-db5a-47e5-a6e4-4c0b08353fd9" />





