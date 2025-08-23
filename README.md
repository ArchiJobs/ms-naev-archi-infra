# JobSearch Microservices Architecture

## 🏗️ Arquitectura de Microservicios

Esta aplicación está construida con una arquitectura de microservicios usando Spring Boot y NestJS.

### 🌸 Spring Boot Services

- **ms-archi-gateway** (Puerto 8080) - Spring Cloud Gateway
  - API Gateway principal que enruta todas las peticiones
  - Autenticación y autorización centralizada
  - Rate limiting y circuit breaker

- **ms-archi-auth-profile** (Puerto 8081) - Spring Security + JWT
  - Autenticación y autorización de usuarios
  - Gestión de perfiles de usuarios y empresas
  - Generación y validación de tokens JWT

### 🟢 NestJS Services

- **ms-archi-jobs-public** (Puerto 3002) - API pública de trabajos (sin auth)
  - Búsqueda pública de trabajos
  - Filtros y categorías
  - No requiere autenticación

- **ms-archi-job-seeker** (Puerto 3003) - Funcionalidades para trabajadores (con auth)
  - Gestión de CV y perfil profesional
  - Aplicaciones a trabajos
  - Seguimiento de aplicaciones
  - Notificaciones personalizadas

- **ms-archi-employer** (Puerto 3004) - Funcionalidades para empresas (con auth + suscripción)
  - Publicación de ofertas de trabajo
  - Gestión de candidatos
  - Panel de empresa
  - Funcionalidades premium por suscripción

- **ms-archi-notifications** (Puerto 3005) - Comunicaciones
  - Envío de emails
  - Notificaciones push
  - Plantillas de correo
  - Gestión de comunicaciones

- **ms-archi-payments** (Puerto 3006) - Facturación empresas
  - Procesamiento de pagos con Stripe
  - Gestión de suscripciones
  - Facturación automática
  - Webhooks de pago

### 🗄️ Base de Datos

- **PostgreSQL** (Puerto 5432) - Base de datos centralizada
  - Almacena todos los datos de los microservicios
  - Configuración con variables de entorno para seguridad

### 🌐 Frontend

- **frontend-naev-job-search** (Puerto 4200) - Angular Frontend
  - Interfaz de usuario principal
  - Conecta con todos los microservicios a través del API Gateway

## 🚀 Cómo ejecutar

1. **Configurar variables de entorno:**
   ```bash
   cp .env.example .env
   # Editar .env con tus configuraciones
   ```

2. **Construir y ejecutar todos los servicios:**
   ```bash
   docker-compose up --build
   ```

3. **Acceder a la aplicación:**
   - Frontend: http://localhost:4200
   - API Gateway: http://localhost:8080
   - Servicios individuales en sus puertos respectivos

## 📋 Variables de Entorno Requeridas

Ver `.env.example` para todas las variables necesarias:

- Configuración de base de datos PostgreSQL
- Configuración SMTP para notificaciones
- Claves de Stripe para pagos
- Secretos JWT para autenticación

## 🏛️ Estructura de Directorios

```
JobSearch/
├── ms-naev-archi-gateway/          # Spring Boot - API Gateway
├── ms-archi-auth/                  # Spring Boot - Auth & Profiles
├── backend-naev-job-search/        # NestJS - Jobs Public API
├── ms-archi-job-seeker/           # NestJS - Job Seeker Service (a crear)
├── ms-archi-employer/             # NestJS - Employer Service (a crear)
├── ms-archi-notifications/        # NestJS - Notifications Service (a crear)
├── ms-archi-payments/             # NestJS - Payments Service (a crear)
├── frontend-naev-job-search/      # Angular Frontend
├── docker-compose.yml             # Docker compose configuration
├── .env                          # Environment variables
└── .env.example                  # Environment variables template
```

## 🔧 Próximos Pasos

Para completar la implementación, necesitas crear los siguientes microservicios NestJS:

1. `ms-archi-job-seeker` - Funcionalidades para trabajadores
2. `ms-archi-employer` - Funcionalidades para empresas
3. `ms-archi-notifications` - Sistema de notificaciones
4. `ms-archi-payments` - Sistema de pagos

Cada servicio debe incluir:
- Dockerfile para containerización
- Configuración de base de datos
- Endpoints RESTful
- Integración con el sistema de autenticación
- Tests unitarios y de integración
