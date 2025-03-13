# Tokens

> [!IMPORTANT]
> ✨ 程序自带过盾，无视任何cloudflare防御，放心使用

一个Token管理平台，专逆各种AI平台的对话接口，推荐使用**免费账号**加入Token池中无限薅羊毛。

## 在线预览

https://tokens.yuanbao.dev

## 运行

1. 填写好 `config/config.yaml` 和 `docker-compose.yaml` 文件需要自定义的配置
2. `./deploy.sh` 一键启动部署
3. 浏览器访问 `http://localhost:你的端口` 进入后台管理页面，账号密码模型都是 `admin`（请及时在系统配置中修改）
4. 在系统配置中填写许可证，许可证请联系作者获取，qq：1727283040
   
   <img width="829" alt="image" src="https://github.com/user-attachments/assets/d0392eba-6185-4e9e-8ec2-453204244128" />
5. 添加对应平台的token，然后就可以直接使用curl或者接入到newapi或oneapi中进行测试了
   
   <img width="776" alt="image" src="https://github.com/user-attachments/assets/8aef6c17-1346-4986-805b-3c764e17d676" />
6. 在newapi或oneapi中使用
   - 密钥：你的许可证
   - 代理地址：
      - **ChatGPT**：`http://localhost:你的端口/chatgpt`
      - **Grok**：`http://localhost:你的端口/grok`
      - **Claude**：`http://localhost:你的端口/claude`


## 模型列表

> 支持openai标准格式的**文件图片上传**，文件（包括图片）可以传url或者base64格式

### `ChatGPT` 模型

- `auto`：普号可用
- `gpt-4o`：普号可用
- `gpt-4o-mini`：普号可用
- `o3-mini`：普号可用
- `o1`：需订阅类型的token
- `o1-pro`：需订阅类型的token
- `o3-mini-high`：需订阅类型的token

> ChatGPT平台的token需要单独在系统配置中填写网关地址，模型是否降智都在网关中处理，与本程序没有任何关联，本程序只负责转发处理消息流转OpenAI格式。

### `Grok` 模型

- `grok-2`：
- `grok-2-image`：使用grok2进行生图
- `grok-2-search`：使用grok2进行联网搜索
- `grok-3`：可开启自动调用联网、生图、思考以及深度网络搜索能力(需在后台系统配置中手动开启)
- `grok-3-image`：使用grok3进行生图
- `grok-3-deepsearch`：使用grok3进行深度联网搜索
- `grok-3-reasoning`：使用grok3进行思考

> 一个Grok普号可以分别调用很多次以上模型，程序都是轮训自动监控一个号模型上限，把次数薅到极致！！！

  ### `Claude` 模型

- `claude-opus-3`：需有 `Claude Pro` 订阅的token才能进行调用
- `claude-sonnet-3-5`：需有 `Claude Pro` 订阅的token才能进行调用
- `claude-haiku-3-5`：需有 `Claude Pro` 订阅的token才能进行调用
- `claude-sonnet-3-7`：普号默认模型
- `claude-sonnet-3-7-reasoner`：使用claude 3.7模型进行思考，需有 `Claude Pro` 订阅的token才能进行调用

> 截止今日，免费账号只支持调用 `claude-sonnet-3-7` 模型，Pro订阅类型的账号可以调用以上Claude全系模型

## Chat2API

- ChatGPT API 端点：`http://localhost:你的端口/chatgpt/v1/chat/completions`

   ```bash
   curl --location --request POST 'http://localhost:你的端口/chatgpt/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: 你的许可证' \
   --data-raw '{
       "messages": [
           {
               "role": "user",
               "content": "你是什么模型"
           }
       ],
       "model": "gpt-4o",
       "stream": true
   }'
   ```

- GROK API 端点：`http://localhost:你的端口/grok/v1/chat/completions`

   ```bash
   curl --location --request POST 'http://localhost:你的端口/grok/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: 你的许可证' \
   --data-raw '{
       "messages": [
           {
               "role": "user",
               "content": "你是什么模型"
           }
       ],
       "model": "grok-3-reasoning",
       "stream": true
   }'
   ```

- Claude API 端点：`http://localhost:你的端口/claude/v1/chat/completions`

   ```bash
   curl --location --request POST 'http://localhost:你的端口/claude/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: 你的许可证' \
   --data-raw '{
       "messages": [
           {
               "role": "user",
               "content": "你是什么模型"
           }
       ],
       "model": "claude-sonnet-3-7",
       "stream": true
   }'
   ```

## 接口代理

- `Grok` 官网接口代理：`http://localhost:你的端口/grok/rest/*`

## Star History

![Star History Chart](https://api.star-history.com/svg?repos=fakeoai/tokens&type=Timeline)




