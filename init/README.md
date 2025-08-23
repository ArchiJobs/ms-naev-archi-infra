# 🗄️ Database Initialization Structure

Esta carpeta contiene todos los scripts SQL organizados para la inicialización de la base de datos PostgreSQL del sistema JobSearch.

## 📁 Estructura Organizada

```
init/
├── 00-EJECUTOR-PRINCIPAL.sql          # Archivo de documentación y verificación
├── 01-DDL/                            # Data Definition Language (Esquemas y Tablas)
│   ├── auth-schema/
│   │   └── v01.sql                    # Esquema de autenticación
│   ├── profile-schema/
│   │   └── v01.sql                    # Esquema de perfiles
│   ├── job-schema/
│   │   └── v01.sql                    # Esquema de trabajos
│   ├── payment-schema/
│   │   └── v01.sql                    # Esquema de pagos
│   └── interaction-schema/
│       └── v01.sql                    # Esquema de interacciones
├── 02-DML/                            # Data Manipulation Language (Datos de Prueba)
│   ├── auth-schema/
│   │   └── v01.sql                    # Usuarios y roles de prueba
│   ├── profile-schema/
│   │   └── v01.sql                    # Perfiles profesionales y empresas
│   ├── job-schema/
│   │   └── v01.sql                    # Ofertas y postulaciones de prueba
│   ├── payment-schema/
│   │   └── v01.sql                    # Planes y transacciones de prueba
│   └── interaction-schema/
│       └── v01.sql                    # Notificaciones e historial
└── 03-ROLLBACK/                       # Scripts de Rollback (Eliminación)
    ├── auth-schema/
    │   └── v01.sql                    # Rollback del esquema auth
    ├── profile-schema/
    │   └── v01.sql                    # Rollback del esquema perfil
    ├── job-schema/
    │   └── v01.sql                    # Rollback del esquema job
    ├── payment-schema/
    │   └── v01.sql                    # Rollback del esquema pago
    └── interaction-schema/
        └── v01.sql                    # Rollback del esquema interaccion
```

## 🔄 Orden de Ejecución Automática

PostgreSQL ejecuta los archivos en orden alfabético automáticamente:

### 1️⃣ DDL (01-DDL/) - Definición de Estructuras
1. `auth-schema/v01.sql` - Esquema base de autenticación
2. `profile-schema/v01.sql` - Perfiles (depende de auth)
3. `job-schema/v01.sql` - Trabajos (depende de profile)
4. `payment-schema/v01.sql` - Pagos (depende de auth)
5. `interaction-schema/v01.sql` - Interacciones (depende de auth)

### 2️⃣ DML (02-DML/) - Datos de Prueba
1. `auth-schema/v01.sql` - Usuarios y roles base
2. `profile-schema/v01.sql` - Perfiles de prueba
3. `job-schema/v01.sql` - Ofertas y postulaciones
4. `payment-schema/v01.sql` - Planes y transacciones
5. `interaction-schema/v01.sql` - Notificaciones e historial

## 🔙 Rollback Manual

Para deshacer cambios, ejecutar en orden inverso:

```sql
-- Conectar a PostgreSQL y ejecutar:
\i 03-ROLLBACK/interaction-schema/v01.sql
\i 03-ROLLBACK/job-schema/v01.sql
\i 03-ROLLBACK/payment-schema/v01.sql
\i 03-ROLLBACK/profile-schema/v01.sql
\i 03-ROLLBACK/auth-schema/v01.sql
```

## 🏗️ Esquemas Creados

### 🔐 **auth** - Autenticación
- `usuario` - Usuarios del sistema
- `rol` - Roles (ADMIN, PROFESIONAL, EMPRESA)
- `usuario_rol` - Relación usuarios-roles

### 👤 **perfil** - Perfiles
- `profesional` - Perfiles de trabajadores
- `empresa` - Perfiles de empresas

### 💼 **job** - Trabajos
- `oferta` - Ofertas de trabajo
- `postulacion` - Postulaciones de candidatos

### 💳 **pago** - Facturación
- `plan` - Planes de suscripción
- `transaccion` - Historial de pagos

### 📊 **interaccion** - Comunicaciones
- `notificacion` - Notificaciones de usuarios
- `historial` - Historial de acciones
- `analitica` - Datos analíticos

## 🚀 Uso con Docker

Los scripts se ejecutan automáticamente cuando PostgreSQL se inicia por primera vez en Docker:

```yaml
# En docker-compose.yml
postgres:
  volumes:
    - ./init:/docker-entrypoint-initdb.d
```

## 📝 Datos de Prueba Incluidos

- **5 usuarios** de ejemplo (admin, profesionales, empresas)
- **3 roles** básicos
- **2 perfiles profesionales** y **2 empresas**
- **4 ofertas de trabajo** activas
- **2 postulaciones** de ejemplo
- **5 planes de pago** (básico, profesional, empresarial)
- **Transacciones** y **notificaciones** de prueba

## 🔧 Personalización

Para agregar nuevos esquemas o modificar existentes:

1. Crear nuevos archivos en `01-DDL/nuevo-schema/`
2. Agregar datos en `02-DML/nuevo-schema/`
3. Crear rollback en `03-ROLLBACK/nuevo-schema/`
4. Seguir la nomenclatura `v01.sql`, `v02.sql`, etc.

## ⚠️ Notas Importantes

- Los archivos se ejecutan **solo en la primera inicialización**
- Para re-ejecutar, eliminar el volumen Docker: `docker volume rm jobsearch_postgres_data`
- Las contraseñas de prueba están hasheadas con bcrypt
- Verificar dependencias entre esquemas antes de modificar
