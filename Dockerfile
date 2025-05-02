# Используем официальный образ Node.js
FROM node:18-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install --production

# Копируем весь код проекта
COPY . .

# Собираем сайт
RUN npx eleventy

# Делаем сайт доступным по порту 80
EXPOSE 80

# Запускаем сервер для локальной разработки
CMD ["npx", "eleventy", "--serve", "--port", "80"]
