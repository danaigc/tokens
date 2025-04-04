# Tokens

> [!IMPORTANT]
> ✨ 程序自带过盾，无视各大平台的cloudflare防御，放心使用
>
> ✨ 程序的前后端代码都打包到一个20多MB的二进制中，go语言编写，简易且高性能。
>
> ✨ 无需重启 `Docker` 也可实现系统配置热更新

一个Token管理平台，专逆各种国外AI平台的对话接口，推荐使用**免费账号**加入Token池中无限薅羊毛。

## 项目功能

- [X] 支持 `Grok`、`Claude`、`Cursor`、`ChatGPT`、`Windsurf` 等平台逆向转OpenAI标准对话格式
- [X] 支持全局代理配置以及各平台代理的独立配置，session标识占位符固定IP等玩法
- [X] 支持对话内容审核
- [X] 各平台token池轮训对话，自动标识token模型的上限状态、token异常状态
- [ ] ......

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

访问在线预览：[tokens.yuanbao.dev](https://tokens.yuanbao.dev)

## 运行指南

> 服务器环境要求：
> - Docker环境
> - 流式对话用户需至少配置2-4核4GB内存的服务器
> - 非流式对话用户推荐8核8GB的服务器配置

### 步骤

1. 克隆项目配置文件：

   ```bash
   git clone https://github.com/FakeOAI/tokens.git
   ```

2. 进入项目目录：

   ```bash
   cd tokens
   ```

3. 运行一键部署脚本：

   ```bash
   ./deploy.sh
   ```

4. 编辑配置文件：
   - 根据自己的情况修改 `config/config.yaml` 和 `docker-compose.yaml` 中的配置（保持默认也可以直接运行）
   - 启动部署后，浏览器访问 `http://<你的IP>:<你的端口>` 进入后台管理页面
   - 默认账号和密码为 `admin`，请及时修改

5. 在系统配置中填写许可证（联系作者获取许可证，QQ：1727283040）

6. 添加平台Token后，即可通过 `curl` 或集成至 [NewAPI](https://github.com/Calcium-Ion/new-api) 或 [OneAPI](https://github.com/songquanpeng/one-api) 测试。

### 示例：

- **ChatGPT API 端点**：

   ```bash
   curl --location --request POST 'http://<你的IP>:<你的端口>/chatgpt/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: <你的许可证>' \
   --data-raw '{
       "messages": [{"role": "user", "content": "你是什么模型"}],
       "model": "gpt-4o",
       "stream": true
   }'
   ```

- **GROK API 端点**：

   ```bash
   curl --location --request POST 'http://<你的IP>:<你的端口>/grok/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: <你的许可证>' \
   --data-raw '{
       "messages": [{"role": "user", "content": "你是什么模型"}],
       "model": "grok-3-reasoning",
       "stream": true
   }'
   ```

- **Claude API 端点**：

   ```bash
   curl --location --request POST 'http://<你的IP>:<你的端口>/claude/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: <你的许可证>' \
   --data-raw '{
       "messages": [{"role": "user", "content": "你是什么模型"}],
       "model": "claude-sonnet-3-7",
       "stream": true
   }'
   ```

- **Cursor API 端点**：

   ```bash
   curl --location --request POST 'http://<你的IP>:<你的端口>/cursor/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: <你的许可证>' \
   --data-raw '{
       "messages": [{"role": "user", "content": "你是什么模型"}],
       "model": "claude-3.7-sonnet-thinking",
       "stream": true
   }'
   ```
   
- **Windsurf API 端点**：

   ```bash
   curl --location --request POST 'http://<你的IP>:<你的端口>/windsurf/v1/chat/completions' \
   --header 'Content-Type: application/json' \
   --header 'Authorization: <你的许可证>' \
   --data-raw '{
       "messages": [{"role": "user", "content": "你是什么模型"}],
       "model": "deepseek-r1",
       "stream": true
   }'
   ```

## 支持的模型列表

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
- `gemini-2.5-pro-exp-03-25`
- `deepseek-v3`
- `deepseek-r1`
- `o3-mini`
- `grok-2`
- `o1-preview`：**Pro订阅类型**的token才可用
- `o1`：**Pro订阅类型**的token才可用
- `gpt-4.5-preview`：**Pro订阅类型**的token才可用
- `claude-3.7-sonnet-max`：**Pro订阅类型**的token才可用
- `claude-3.7-sonnet-thinking-max`：**Pro订阅类型**的token才可用

> 使用此程序逆向的cursor不存在任何乱码、随便封号等情况，请不要拿tokens和其他开源项目进行对比！！！

### `Windsurf` 模型

- `gpt-4o-2024-08-06`
- `gpt-4o-mini-2024-07-18`
- `o3-mini`
- `gemini-2-0-flash`
- `claude-3-5-sonnet-20241022`
- `claude-3-5-haiku-20241022`
- `claude-3-7-sonnet-20250219`
- `claude-3-7-sonnet-20250219-thinking`
- `deepseek-v3`
- `deepseek-r1`

> Windsurf模型暂未适配图片、文件识别

## Chat2API

Chat2API适用于自己管理token号池以及token的异常、限速等状态的开发者们
> 此模式下，程序不会进行任何失败重试，会把报错的信息原样返回给开发者们，请开发者们自行适配

```bash
curl --location --request POST 'http://<你的IP>:<你的端口>/<各平台前缀>/v1/chat/completions' \
--header 'Content-Type: application/json' \
--header 'Authorization: <平台Token>' \
--header 'Tokens-Authorization: <你的许可证>' \
--data-raw '{
    "messages": [{"role": "user", "content": "你是什么模型"}],
    "model": "平台提供的模型",
    "stream": true
}'
```

## Star History

![Star History Chart](https://api.star-history.com/svg?repos=fakeoai/tokens&type=Timeline)

## 声明

在使用前您应当知悉使用本项目可能会违反相关用户协议，并了解相关的风险。我们不对任何因使用本项目而导致的任何损失负责。
