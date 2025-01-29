# 使用Node.js 18作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制源代码
COPY . .

# 构建时注入环境变量
ARG VITE_VERSION
ARG VITE_PROJECT_API
ARG VITE_BAIDU_TONGJI_SITE_ID
ARG VITE_BAIDU_TONGJI_ACCESS_TOKEN
ARG VITE_AI_APIPASSWORD
ARG VITE_AI_MODEL
ARG VITE_GAODE_WEB_API

# 暴露端口
EXPOSE 5173

# 启动命令 - 添加 --host 0.0.0.0 参数
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"] 