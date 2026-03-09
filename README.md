# Data Territorial Educativa RD 🇩🇴

Este repositorio contiene el dataset completo y normalizado de las **18 Direcciones Regionales** y los **108 Distritos Educativos** del Ministerio de Educación de la República Dominicana (MINERD).

A diferencia de las divisiones políticas tradicionales (Provincias y Municipios), esta estructura es la que rige el sistema educativo dominicano, siendo esencial para proyectos de gestión escolar, geolocalización de centros educativos y sistemas de analítica académica.

---

## Tabla de Contenido

* [Estructura de Archivos](#estructura-de-archivos)
* [Formatos Disponibles](#formatos-disponibles)
  * [JSON](#json)
  * [MySQL](#mysql)
* [Relación de Datos](#relación-de-datos)
* [Ejemplos de Consulta (SQL)](#ejemplos-de-consulta-sql)
* [Contribuciones](#contribuciones)
* [Licencia](#licencia)

---

## Estructura de Archivos

```plaintext
/
├── json/
│   ├── regions.json             # Catálogo de las 18 regionales
│   └── school_districts.json   # Catálogo de los 108 distritos con su FK
├── mysql/
│   ├── schema.sql               # Definición de tablas y relaciones
│   └── inserts.sql              # Datos listos para importar
├── .gitignore
└── LICENSE
```

---

## Formatos Disponibles

### ![JSON](https://img.shields.io/badge/JSON-000000?style=flat&logo=json&logoColor=white) JSON

Ideal para aplicaciones NoSQL o para ser consumido directamente desde el frontend en selectores dependientes. Se han utilizado llaves en inglés para mayor compatibilidad con estándares de desarrollo.

**Regions (`regions.json`):**

```json
{
  "id": "16",
  "name": "Cotuí"
}
```

**School Districts (`school_districts.json`):**

```json
{
  "id": "16-04",
  "region_id": "16",
  "name": "Bonao"
}
```

---

### ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white) MySQL

El esquema incluye integridad referencial completa. Los distritos escolares están nombrados como `school_districts` para diferenciarlos claramente de los distritos municipales políticos.

* **Tablas:** `regions`, `school_districts`
* **Tipos de datos:** IDs optimizados como `CHAR` para mantener los ceros a la izquierda (ej: `01`)
* **Integridad:** `ON DELETE CASCADE` y `ON UPDATE CASCADE` configurados en las llaves foráneas

---

## Relación de Datos

| Entidad | Campo ID | Formato | Descripción |
| --- | --- | --- | --- |
| **Region** | `id` | `CHAR(2)` | Código oficial de la regional (01 al 18) |
| **School District** | `id` | `CHAR(5)` | Código compuesto (Regional-Distrito, ej: `16-04`) |
| **School District** | `region_id` | `CHAR(2)` | Llave foránea que apunta a la regional |

---

## Ejemplos de Consulta (SQL)

**Obtener todos los distritos pertenecientes a una regional específica:**

```sql
SELECT * FROM school_districts 
WHERE region_id = '16' 
ORDER BY name ASC;
```

**Listado completo de distritos con el nombre de su regional:**

```sql
SELECT 
    d.id   AS district_code, 
    d.name AS district_name, 
    r.name AS region_name
FROM school_districts d
JOIN regions r ON d.region_id = r.id
ORDER BY r.id ASC;
```

---

## Contribuciones

Si encuentras alguna actualización en la estructura del MINERD o deseas agregar otros formatos (como CSV o seeders para frameworks específicos):

1. Haz un **Fork** del proyecto.
2. Crea una rama para tu mejora: `git checkout -b feature/nuevo-formato`.
3. Realiza tus cambios siguiendo la convención de **Conventional Commits**.
4. Envía un **Pull Request**.

---

## Licencia

Este proyecto está bajo la **Licencia MIT**. Siéntete libre de usarlo en proyectos personales, académicos o comerciales.