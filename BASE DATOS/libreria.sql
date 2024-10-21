CREATE TABLE AUTOR
(
  id_autor integer NOT NULL,
  nombre varchar(30) NOT NULL,
  apellidos varchar(60) NOT NULL,
  CONSTRAINT CP_id_autor PRIMARY KEY (id_autor)
);

CREATE TABLE EDITORIAL
(
  id_editorial integer NOT NULL,
  nombre varchar(50) NOT NULL,
  CONSTRAINT CP_id_editorial PRIMARY KEY (id_editorial)
);

CREATE TABLE LIBRO
(
  id_libro integer NOT NULL,
  num_paginas integer NOT NULL,
  precio float NOT NULL,
  titulo varchar(50) NOT NULL,
  cod_editorial integer NOT NULL,
  CONSTRAINT CP_id_libro PRIMARY KEY (id_libro)
);

CREATE TABLE LIBRO_AUTOR
(
  id_libro integer NOT NULL,
  id_autor integer NOT NULL,
  CONSTRAINT CP1_id_libro_CP2_id_autor PRIMARY KEY (id_libro, id_autor) COMMENT 'CLEVE PRIMARIA COMPUESTA'
);

CREATE TABLE SUCURSAL
(
  id_sucursal integer NOT NULL,
  nombre varchar(50) NOT NULL,
  direccion varchar(30) NOT NULL,
  telefono varchar(20),
  CONSTRAINT CP_id_sucursal PRIMARY KEY (id_sucursal)
);

CREATE TABLE SUCURSAL_LIBRO
(
  id_sucursal integer NOT NULL,
  id_libro integer NOT NULL,
  CONSTRAINT CP1_id_sucursal_CP2_id_libro PRIMARY KEY (id_sucursal, id_libro) COMMENT 'CLEVE PRIMARIA COMPUESTA'
);

CREATE TABLE TEMA
(
  id_tema integer NOT NULL,
  descripcion varchar(300),
  CONSTRAINT CP_id_tema PRIMARY KEY (id_tema)
);

CREATE TABLE TEMA_LIBRO
(
  id_libro integer NOT NULL,
  id_tema integer NOT NULL,
  CONSTRAINT CP1_id_tema_CP2_id_libro PRIMARY KEY (id_tema, id_libro) COMMENT 'CLAVE PRIMARIA COMPUETA'
);

ALTER TABLE LIBRO ADD CONSTRAINT CF1_EDITORIAL
  FOREIGN KEY (cod_editorial) REFERENCES EDITORIAL (id_editorial);

ALTER TABLE LIBRO_AUTOR ADD CONSTRAINT CF1_LIBRO
  FOREIGN KEY (id_libro) REFERENCES LIBRO (id_libro);

ALTER TABLE LIBRO_AUTOR ADD CONSTRAINT CF2_AUTOR
  FOREIGN KEY (id_autor) REFERENCES AUTOR (id_autor);

ALTER TABLE SUCURSAL_LIBRO ADD CONSTRAINT CF1_SUCURSAL
  FOREIGN KEY (id_sucursal) REFERENCES SUCURSAL (id_sucursal);

ALTER TABLE SUCURSAL_LIBRO ADD CONSTRAINT CF2_LIBRO
  FOREIGN KEY (id_libro) REFERENCES LIBRO (id_libro);

ALTER TABLE TEMA_LIBRO ADD CONSTRAINT CF1_TEMA
  FOREIGN KEY (id_tema) REFERENCES TEMA (id_tema);

ALTER TABLE TEMA_LIBRO ADD CONSTRAINT CF2__LIBRO
  FOREIGN KEY (id_libro) REFERENCES LIBRO (id_libro);
