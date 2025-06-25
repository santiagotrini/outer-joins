CREATE DATABASE joins;

USE joins;

CREATE TABLE personas(
  id       INT          AUTO_INCREMENT PRIMARY KEY,  
  nombre   VARCHAR(50)  NOT NULL,  
  apellido VARCHAR(50)  NOT NULL,
  edad     TINYINT,
  email    VARCHAR(100) NOT NULL       UNIQUE,
  auto     INT
);

CREATE TABLE autos(
  id       INT          AUTO_INCREMENT PRIMARY KEY,  
  marca    VARCHAR(50)  NOT NULL,
  modelo   VARCHAR(50)  NOT NULL,
  patente  VARCHAR(8)   NOT NULL       UNIQUE,
  year     INT          NOT NULL,
  persona  INT,       
  FOREIGN KEY (persona) REFERENCES personas(id)
);

ALTER TABLE personas ADD FOREIGN KEY (auto) REFERENCES autos(id);

INSERT INTO personas VALUES
  (NULL, 'Franco', 'Perez', 50, 'franco@mail.com', NULL),
  (NULL, 'Juan', 'Dominguez', 18, 'juan@mail.com', NULL),
  (NULL, 'Maria', 'Rodriguez', 22, 'maria@mail.com', NULL),
  (NULL, 'Pedro', 'Martinez', 6, 'pedro@mail.com', NULL),
  (NULL, 'Ana', 'Garcia', 3, 'ana@mail.com', NULL);

INSERT INTO autos VALUES
  (NULL, 'Ford', 'Mustang', 'ABC123', 1970, NULL),  
  (NULL, 'Peugeot', '504', 'ABA111', 1999, 2),  
  (NULL, 'Chevrolet', '400', 'CAB321', 1975, 1),  
  (NULL, 'Ford', 'Fiesta', 'KLM765', 2002, 3); 

UPDATE personas SET auto = 3 WHERE id = 1;   
UPDATE personas SET auto = 2 WHERE id = 2;   
UPDATE personas SET auto = 4 WHERE id = 3;   

-- INNER JOIN
SELECT *
FROM personas
  INNER JOIN autos ON auto = autos.id;
-- LEFT OUTER JOIN
SELECT *
FROM personas
  LEFT OUTER JOIN autos ON auto = autos.id;
-- RIGHT OUTER JOIN
SELECT *
FROM personas
  RIGHT OUTER JOIN autos ON auto = autos.id;  
