# sisalineacionproyecto

Proyecto de grado Ingeniería Telemática:  **SISTEMA WEB PARA LA ALINEACIÓN ENTRE RESULTADOS ESPECÍFICOS Y ESPACIOS ACADÉMICOS CON OBJETIVOS DEL PROGRAMA**

>    #Proyecto de grado #Ingeniería Telemática #Desarrollo de Software #Backend #Frontend #MVC #PHP #MySQL #XAMPP #phpMyAdmin #Git #GitHub #Visual Studio Code    

## Tabla de Contenido

- [Tabla de Contenido](#tabla-de-contenido)
- [Descripción](#descripción)
- [Tecnologías](#tecnologías)
- [Prerequisitos](#prerequisitos)
- [Ejecución en local](#ejecución-en-local)
- [Documentación](#documentación)
- [Versionamiento](#versionamiento)
- [Contribuciones](#contribuciones)
- [Autores](#autores)
- [Licencia](#licencia)

---

## Descripción

Con el presente proyecto se busca el desarrollo de un sistema que permita la visualización y
edición de contenidos de los espacios académicos y las categorías de conocimiento, a
continuación, se detallan las funcionalidades:
 - Módulo de visualización de las categorías de conocimiento detallando los
campos: nombre de la categoría, descripción y espacios académicos
correspondientes.
 - Módulo de visualización de los espacios académicos detallando los campos:
resultado resumido, resultados concretos, herramientas.
 - Sistema de Login para acceso de un rol editor que podrá agregar, editar y/o
eliminar información de los módulos anteriormente mencionados.
 - Generación de informes (en formato PDF, Excel y CSV) para los módulos de
categorías de conocimiento y espacios académicos.

([Ir a Tabla de Contenido](#tabla-de-contenido))

---

## Tecnologías

Las herramientas tecnológicas que se utilizarán para el desarrollo del proyecto son:

- Lenguaje de programación PHP 7.0.
- Control de versionamiento: Git/GitHub.
- Entorno de desarrollo (IDE): Visual Studio Code
- Paquete de programas: XAMPP principalmente para el Sistema de Gestión de Bases de Datos y el servidor apache de pruebas.
- Gestor de base de datos MySQL.
- Arquitectura de Modelo, Vista, Controlador (MVC).

([Ir a Tabla de Contenido](#tabla-de-contenido))

---

## Prerequisitos

- Instalar XAMPP [desde la web oficial](https://www.apachefriends.org/es/index.html)

- Instalar Git/GitBash [desde la web oficial](https://git-scm.com/downloads/win)

([Ir a Tabla de Contenido](#tabla-de-contenido))

---

## Ejecución en local

- Ingresar a la carpeta: xampp\htdocs.

- Abrir una consola git bash en en dicha ubicación.

- Dentro de la consola, clonar el proyecto:

    - git clone https://github.com/dihrodriguezg/sisalineacionproyecto.git

- Abrir xampp y ejecutar los módulos de apache y MySQL.

- Dentro de **xampp\htdocs** buscar el siguiente directorio:
    - \sisalineacionproyecto\db\sistematizaciondatos_com.sql

- Ingresar a [phpMyAdmin](http://localhost/phpmyadmin/)

- Crear una nueva Base de datos importando el archivo **sistematizaciondatos_com.sql**

- Para visualizar el front, ingresar a http://localhost/sisalineacionproyecto/

([Ir a Tabla de Contenido](#tabla-de-contenido))

---

## Documentación

# Falta documentación!!!

([Ir a Tabla de Contenido](#tabla-de-contenido))

---

## Versionamiento

- [Repositorio en GitHub](https://github.com/dihrodriguezg/sisalineacionproyecto).
- Para todas las versiones disponibles, mira las [ramas en este repositorio](https://github.com/dihrodriguezg/sisalineacionproyecto/branches).

([Ir a Tabla de Contenido](#tabla-de-contenido))

---

## Contribuciones

Para contribuir al proyecto, soluciones de bug o creación de nuevas funcionalidades.

1. Clona el proyecto
2. Crea la nueva rama a partir de master (`git checkout -b 'nombre-de-rama'`)
4. Haz commit de los cambios (`git commit -m 'Nueva funcionalidad'`)
5. Sube la rama (`git push origin 'nombre-de-rama'`)
6. Crea un Pull Request

([Ir a Tabla de Contenido](#tabla-de-contenido))

---

## Autores

El equipo involucrado en el desarrollo del proyecto de grado:

- Equipo de Desarrollo:
    - Williams A. Gutiérrez G. <wilagutierrezg@udistrital.edu.co>
    - Diego H. Rodríguez G. <dihrodriguezg@udistrital.edu.co>
- Tutor: Luis F. Wanumen S. <lwanumen@udistrital.edu.co>
- Jurado: Darín J. Mosquera P. <djmosquerap@udistrital.edu.co>

([Ir a Tabla de Contenido](#tabla-de-contenido))

---

## Licencia

![License](Assets/images/uploads/logo_ud_sin_texto.png)

- Copyright 2025 ©