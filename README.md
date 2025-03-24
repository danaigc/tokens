# Tokens

> [!IMPORTANT]
> ✨ 程序自带过盾，无视任何cloudflare防御，放心使用

一个Token管理平台，专逆各种国外AI平台的对话接口，推荐使用**免费账号**加入Token池中无限薅羊毛。

## 项目结构

```
tokens
│
├── config # 项目配置
│    ├── config.yaml # 数据库持久层、服务端口日志配置
│    └── system.yaml # 程序系统配置，账号密码以及后台的系统配置都保存在此文件
├── keys # ssl证书存放位置
│    ├── ssl.pem # ssl证书公钥
│    └── ssl.key # ssl证书私钥
├── deploy.sh # 一键启动脚本
└── docker-compose.yaml # docker服务编排文件
```

## 在线预览

https://tokens.yuanbao.dev

## 运行

> 服务器需要有docker环境
> 
> 流式对话用户需要至少2-4核4g内存的服务器，非流式对话用户推荐8h8g的服务器配置

```bash
# 克隆仓库配置文件
git clone https://github.com/FakeOAI/tokens.git
# 进入项目
cd tokens
# 运行一键部署脚本
./deploy.sh
```

1. 填写好 `config/config.yaml` 和 `docker-compose.yaml` 文件需要自定义的配置
2. `./deploy.sh` 一键启动部署
3. 浏览器访问 `http://你的IP:你的端口` 进入后台管理页面，账号密码模型都是 `admin`（请及时在系统配置中修改）
4. 在系统配置中填写许可证，许可证请联系作者获取，qq：1727283040
   
   <img width="833" alt="image" src="https://github.com/user-attachments/assets/093965e6-d22f-4299-90ba-3658277d4adb" />
5. 添加对应平台的token，然后就可以直接使用curl或者接入到newapi或oneapi中进行测试了
   
   <img width="773" alt="image" src="https://github.com/user-attachments/assets/e666e1c9-968e-4731-9d59-5a2451ab48be" />
6. 在newapi或oneapi中使用
   - 密钥：你的许可证
   - 代理地址：
      - **ChatGPT**：`http://你的IP:你的端口/chatgpt`
      - **Grok**：`http://你的IP:你的端口/grok`
      - **Claude**：`http://你的IP:你的端口/claude`
      - **Cursor**：`http://你的IP:你的端口/cursor`


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
- `grok-3-deepersearch`：使用grok3进行深度思考联网搜索
- `grok-3-reasoning`：使用grok3进行思考

> 一个Grok普号可以分别调用很多次以上模型，程序都是轮训自动监控一个号模型上限，把次数薅到极致！！！

### `Claude` 模型

- `claude-opus-3`：需有 `Claude Pro` 订阅的token才能进行调用
- `claude-sonnet-3-5`：需有 `Claude Pro` 订阅的token才能进行调用
- `claude-haiku-3-5`：需有 `Claude Pro` 订阅的token才能进行调用
- `claude-sonnet-3-7`：普号默认模型
- `claude-sonnet-3-7-reasoner`：使用claude 3.7模型进行思考，需有 `Claude Pro` 订阅的token才能进行调用

> 截止今日，免费账号只支持调用 `claude-sonnet-3-7` 模型，Pro订阅类型的账号可以调用以上Claude全系模型

### `Cursor` 模型

- `gpt-4`
- `claude-3.5-sonnet`
- `claude-3.7-sonnet`
- `claude-3.7-sonnet-thinking`
- `gpt-4o`
- `claude-3-opus`
- `gpt-3.5-turbo`
- `gpt-4-turbo-2024-04-09`
- `gpt-4o-128k`
- `gemini-1.5-flash-500k`
- `claude-3-haiku-200k`
- `claude-3-5-sonnet-200k`
- `gpt-4o-mini`
- `o1-mini`
- `claude-3.5-haiku`
- `gemini-2.0-pro-exp`
- `gemini-2.0-flash-thinking-exp`
- `gemini-2.0-flash`
- `deepseek-v3`
- `deepseek-r1`
- `o3-mini`
- `grok-2`
- `o1-preview`：**Pro订阅类型**的token才可用
- `o1`：**Pro订阅类型**的token才可用
- `gpt-4.5-preview`：**Pro订阅类型**的token才可用
- `claude-3.7-sonnet-max`：**Pro订阅类型**的token才可用
- `claude-3.7-sonnet-thinking-max`：**Pro订阅类型**的token才可用

> 使用此程序逆向的cursor不存在任何乱码，请不要拿tokens和其他开源项目进行对比！！！
> 
> 使用此程序逆向的cursor不存在任何封号，请不要拿tokens和其他开源项目进行对比！！！

## Chat2API

- ChatGPT API 端点：`http://你的IP:你的端口/chatgpt/v1/chat/completions`

   ```bash
   curl --location --request POST 'http://你的IP:你的端口/chatgpt/v1/chat/completions' \
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

- GROK API 端点：`http://你的IP:你的端口/grok/v1/chat/completions`

   ```bash
   curl --location --request POST 'http://你的IP:你的端口/grok/v1/chat/completions' \
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

- Claude API 端点：`http://你的IP:你的端口/claude/v1/chat/completions`

   ```bash
   curl --location --request POST 'http://你的IP:你的端口/claude/v1/chat/completions' \
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

- Cursor API 端点：`http://你的IP:你的端口/cursor/v1/chat/completions`

   ```bash
   curl --location --request POST 'http://你的IP:你的端口/cursor/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: 你的许可证' \
   --data-raw '{
       "messages": [
           {
               "role": "user",
               "content": "你是什么模型"
           }
       ],
       "model": "claude-3.7-sonnet-thinking",
       "stream": true
   }'
   ```

## Star History

![Star History Chart](https://api.star-history.com/svg?repos=fakeoai/tokens&type=Timeline)




