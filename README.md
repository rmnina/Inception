# Inception

Inception is a project aimed at building a **multi-service infrastructure** entirely contained within **Docker containers**, in compliance with modern security and isolation standards.

The project puts into practice essential concepts of infrastructure deployment: **each service (NGINX, WordPress, MariaDB) runs in its own container**, interconnected via a **dedicated Docker network**. The goal is to ensure **service isolation**, **data persistence via Docker volumes**, and a **single secure access point via TLS**.

Dockerfiles are **written manually** for each service, in adherence to PID 1 best practices, and with proper management of environment variables and sensitive secrets.

## Architecture

- <ins>**NGINX container**</ins>, configured as a single HTTPS entry point, ensuring that all traffic passes through TLSv1.2 or TLSv1.3.
- <ins>**WordPress container**</ins> running only with php-fpm, without an integrated web server, exposed behind NGINX.
- <ins>**MariaDB container**</ins> for storing data, with persistence on a Docker volume.

This approach provided an opportunity to learn the principles of containerization, Docker networking, service isolation, and the ability to build a complete and robust infrastructure from scratch, without relying on ready-made third-party images.

## Ressources

### 📖 <ins>**The Bible**</ins>

Docker full documentation [here](https://docs.docker.com/)

### :fr: <ins>**Highest quality training from the ultimate sensei** *(in french)*</ins>
Xavki's training on Docker : the Youtube playlist [here](https://youtube.com/playlist?list=PLn6POgpklwWq0iz59-px2z-qjDdZKEvWd&si=5xWFSy8wtv1hjlAe)
