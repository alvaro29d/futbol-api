# Futbol-api

##Pasos para lanzar la aplicacion

Requisitos
Java8
Maven2

- Configurar la base datos (archivo application-mysql.properties)
- Por linea de comandos ir a la carpeta donde se encuentra el archivo pom.xml y ejecutar el comando:
```
mvn spring-boot:run
```

##Probar los servicios

- Lanzar la aplicacion Futbol-api
- Instalar el complemento de Chrome PostMan
```
https://www.getpostman.com/
```
- Abrir PostMan
- Importar el archivo 
```
Futbol-api.postman_collection.json
```
- Ir a la pestania 'Colecciones' y probar los requests. 
