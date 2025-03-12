# Usar la imagen base de Node.js
FROM node:18

# Definir el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar package.json y package-lock.json antes de instalar dependencias
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar el resto del código de la aplicación
COPY . .

# Exponer el puerto 3000 para acceder a la API
EXPOSE 3000

# Definir el comando para ejecutar la aplicación
CMD ["npm", "start"]
