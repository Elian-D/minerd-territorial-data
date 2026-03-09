-- Creación de la tabla regions
CREATE TABLE IF NOT EXISTS regions (
    id CHAR(2) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Creación de la tabla school_districts
CREATE TABLE IF NOT EXISTS school_districts (
    id CHAR(5) PRIMARY KEY,
    region_id CHAR(2) NOT NULL,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (region_id) REFERENCES regions(id) ON DELETE CASCADE ON UPDATE CASCADE
);