# Menggunakan base image node js versi 14 dengan menggunakan mini root alpine
FROM node:14-alpine

# Membuat direktori baru /app dan menetapkan sebagai working directory 
WORKDIR /app

# Menyalin seluruh data pada local working directory ke container working directory
COPY . .

# Menentukan aplikasi berjaalan dalam production mode
ENV NODE_ENV=production

# Menetapkan aplikasi berjalan menggunakan host database yang ditentukan
ENV DB_HOST=item-db

# Menginstall depedency yang dibutuhkan untuk production dan melakukan build
RUN npm install --production --unsafe-perm && npm run build

# Membuka port container agar host bisa meng-akses dengan port yang di tentukan
EXPOSE 80:8080

# Mengeskekusi perintah ini ketika image sudah menjadi container atau container di jalankan
CMD ["npm", "start"]