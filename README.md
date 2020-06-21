# [Vive Store](https://vive-store.herokuapp.com)

Prueba técnica para optar al puesto de desarrollador Backend en Vive Travel

## Instalación

Clone el proyecto en su computador local:
```bash
git clone https://github.com/mariajosecg/vive_store.git
```

## Uso

Crear la base de datos:

```
rake db:create
```

Migrar la base de datos:

```
rake db:migrate
```

Instalar dependencias:

```
bundle install
```

una vez hecho esto, proceda a levantar el entorno de desarrollo para probar la aplicación:

```
rails server
```

iniciciar servidor de [sidekiq](https://github.com/mperham/sidekiq) para ejecutar procesos en segundo plano:

```
bundle exec sidekiq
```

iniciar servidor de redis:

```
redis-server
```

# Nota: Si aún no tiene redis instalado en su entorno local, puede hacerlo siguiendo  los pasos del siguiente [enlace](https://www.comoinstalarlinux.com/como-instalar-redis-en-ubuntu-16-04/)

si todo ha salido bien, debería ver la interfaz dónde se listaran los productos cargados a través del API

![Home](https://i.ibb.co/80yj97Q/image.png)

Vive Store provee un [dashboard](http://vive-store.herokuapp.com/admin/dashboard) para observar la cantidad de productos que han sido solicitados para cargar a través del API y cuántos de ellos han sido cargados exitosamente y cuántos no.

![Dashboard](https://i.ibb.co/YLF5pMs/image.png)

## API

Vive Store provee un endpoint para la carga de los productos:

```
BASE_URL=https://vive-store.herokuapp.com/api/v1/
ENDPOINT=products
```
El endpoint espera recibir la siguiente estructura de datos:

```
[
   {
        "name": "",
        "description": "",
        "variants": [
            { "name": "", "price": "" },
            { "name": "", "price": "" },
        ]
    },
    {
        "name": "",
        "description": "",
        "variants": [
            { "name": "", "price": "" },
            { "name": "", "price": "" }
        ]
    },
    { ... },
    { ... },
    { ... }
]
```

Dónde para los productos, los campos `name` y `description` son obligatorios, y deben tener al menos una variante.

Y en las variantes, los campos `name` y `price` son obligatorios, y `price` debe ser mayor a `0`


## Arquitectura
- Ruby 2.7.1
- Rails 6.0.3.2
