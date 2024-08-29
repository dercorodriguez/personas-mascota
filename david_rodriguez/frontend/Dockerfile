# Usa una imagen base de Node.js
FROM node:16.15.1 AS build

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el package.json y el package-lock.json (si existe)
COPY package*.json ./



# Instala las dependencias del proyecto
RUN npm install

# Copia los archivos del proyecto
COPY . .

RUN chmod -R +x /app

# Compila la aplicación
RUN npm run build

# Usa una imagen base de Nginx
FROM nginx:alpine
ADD ./config/default.conf /etc/nginx/conf.d/default.conf

# Copia los archivos compilados al directorio de Nginx
COPY --from=build /app/build /usr/share/nginx/html

# Expone el puerto 80 
EXPOSE 80

# Comando por defecto para ejecutar Nginx
CMD ["nginx", "-g", "daemon off;"]



