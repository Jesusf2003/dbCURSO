-- Borrar base de datos
DROP DATABASE IF EXISTS dbDIAGRAMA;

-- Crear base de datos
CREATE DATABASE dbDIAGRAMA;

-- Usar base de datos
USE dbDIAGRAMA;

-- Crear tabla persona
CREATE TABLE PERSONA(
	DNIPER		CHAR(8),
    NOMPER		VARCHAR(50),
    APEPER		VARCHAR(50),
    FECNACPER	DATE,
    CELPER		VARCHAR(9),
    EMAPER		VARCHAR(100),
    SEXPER		CHAR(1),
    TIPPER		CHAR(3),
    DISTPER		VARCHAR(80),
    FECREGPER	TIMESTAMP,
    PWSPER		VARCHAR(20),
    CONSTRAINT DNIPER PRIMARY KEY(DNIPER)
);

-- Usando INSERT INTO
INSERT INTO PERSONA (DNIPER, NOMPER, APEPER, FECNACPER, CELPER, EMAPER, SEXPER, TIPPER, DISTPER, FECREGPER, PWSPER)
VALUES 	('A001', 'J. Fernando', 'Canales Rodríguez', '2020/10/24', '123456', 'fernandocanales@gmail', 'M', 'CLi', 'Lima', '2020/12/23', 'Constraseña'),
		('A002', 'Fabiola', 'Ortega Rodríguez', '2020/10/24', '123456', 'fabiOrtega@gmail', 'M', 'CLi', 'Lima', '2020/12/23', 'Constraseña'),
        ('A003', 'José', 'Ramirez Pancho', '2020/10/24', '123456', 'JosePancho@gmail', 'M', 'CLi', 'Lima', '2020/12/23', 'Constraseña');

-- Mostrar detalles de la tabla Persona
DESCRIBE PERSONA;

-- Crear tabla histórico
CREATE TABLE HISTORICO(
	IDHIS		INT,
    DNIPER		CHAR(8),
    FECFINHIST	DATE,
    TIPHIS		CHAR(4),
    COMEHIST	VARCHAR(100),
    CONSTRAINT IDHIS PRIMARY KEY (IDHIS)
);

-- Usando INSERT INTO
INSERT INTO HISTORICO (IDHIS, FECFINHIST, TIPHIS, COMEHIST)
VALUES 	(1, '2020/10/30', 'CAMB', 'Es una aplicación regular'),
		(2, '2020/10/14', 'FIN', 'Es una aplicación regular'),
        (3, '2019/03/16', 'FIN', 'Es una aplicación regular');

-- Mostrar los detalles de la tabla Histórico

-- Crear tabla departamento
CREATE TABLE DEPARTAMENTO(
	IDDEP		INT,
    NOMDEP		VARCHAR(50),
    DNIPER		CHAR(8),
    SALJEFDEP	DECIMAL(8,2),
    CONSTRAINT IDDEP PRIMARY KEY (IDDEP)
);

-- Usando INSERT INTO
INSERT INTO DEPARTAMENTO (IDDEP, NOMDEP, DNIPER, SALJEFDEP)
VALUES 	(1, 'Lima', 'A001', 20.50),
		(2, 'Amazonas', 'A002', 50.90),
        (3, 'Arequipa', 'A003', 20.50);

-- Mostrar detalles de la tabla Departamento
DESCRIBE DEPARTAMENTO;

-- Crear tabla empleado
CREATE TABLE EMPLEADO(
	IDEMP		INT,
    DNIPER		CHAR(8),
    FECINGEMP	DATE,
    CARGEMP		VARCHAR(40),
    SALEMP		DECIMAL(6,2),
    IDDEP		INT,
    ESTEMP		CHAR(1),
    CONSTRAINT IDEMP PRIMARY KEY (IDEMP)
);

-- Usando INSERT INTO
INSERT INTO EMPLEADO (IDEMP, DNIPER, FECINGEMP, CARGEMP, SALEMP, IDDEP, ESTEMP)
VALUES 	(1, 'A001', '2013/08/23', 'Cargo actual', 645.54, null, 'A'),
		(2, 'A002', '2015/09/24', 'Cargo actual', 45.50, null, 'I'),
        (3, 'A003', '2013/08/23', 'Cargo actual', 65.40, null, 'A');

-- Mostrar detalles de la tabla Empleado
DESCRIBE EMPLEADO;

-- Crear tabla inscripción
CREATE TABLE INSCRIPCION(
	IDINSC		INT,
    DNIPER		CHAR(8),
    IDEMP		INT,
    IDOFER		INT,
    FECINS		DATE,
    EVALINSC	INT,
    CONSTRAINT IDINSC PRIMARY KEY (IDINSC)
);

-- Usando INSERT INTO
INSERT INTO INSCRIPCION (IDINSC, DNIPER, IDEMP, IDOFER, FECINS, EVALINSC)
VALUES 	(1, '87654321', 1, 4, '1995/02/17', 5),
		(2, '87654321', 4, 6, '1995/02/17', 3),
        (3, '87654321', 2, 3, '1975/07/23', 2);

-- Mostrar los detalles de la tabla Inscripción
DESCRIBE INSCRIPCION;

-- Crear tabla oferta
CREATE TABLE OFERTA(
	IDOFER		INT,
    CODCUR		CHAR(3),
    FECOFER		DATE,
    FECINICCUROFER	DATE,
    IDEMP		INT,
    CONSTRAINT IDOFER PRIMARY KEY (IDOFER)
);

-- Usando INSERT INTO
INSERT INTO OFERTA (IDOFER, CODCUR, FECOFER, FECINICCUROFER, IDEMP)
VALUES 	(1, 'MAT', '1999/11/25', '2010/08/16', 1),
		(2, 'FCC', '2015/11/15', '2010/08/16', 2),
        (3, 'CTA', '2030/10/13', '2010/08/16', 3);

-- Crear tabla curso
CREATE TABLE CURSO(
	CODCUR		CHAR(3),
    DESCUR		VARCHAR(30),
    CATCUR		CHAR(3),
    DURCUR		INT,
    CONSTRAINT CODCUR PRIMARY KEY (CODCUR)
);

-- Usando INSERT INTO
INSERT INTO CURSO (CODCUR, DESCUR, CATCUR, DURCUR)
VALUES	('C01', 'Este curso tratará estos temas', 'GEN', 30),
		('C02', 'Este curso tratará estos temas', 'DEV', 20),
        ('C03', 'Este curso tratará estos temas', 'ADS', 50);

-- Crear relación entre tablas

-- Relación entre las tablas HISTORICO - PERSONA
ALTER TABLE HISTORICO ADD CONSTRAINT historico_persona_DNIPER FOREIGN KEY (DNIPER) REFERENCES PERSONA (DNIPER);

-- Relación entre las tablas DEPARTAMENTO - PERSONA
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT departamento_persona_DNIPER FOREIGN KEY (DNIPER) REFERENCES PERSONA (DNIPER);

-- Relación entre las tablas EMPLEADO - DEPARTAMENTO
ALTER TABLE EMPLEADO ADD CONSTRAINT empleado_departamento_IDDEP FOREIGN KEY (IDDEP) REFERENCES DEPARTAMENTO (IDDEP);

-- Relación entre las tablas EMPLEADO - PERSONA
ALTER TABLE EMPLEADO ADD CONSTRAINT empleado_persona_IDDEP FOREIGN KEY (IDDEP) REFERENCES DEPARTAMENTO (IDDEP);

-- Relación entre las tablas INSCRIPCIÓN - PERSONA
ALTER TABLE INSCRIPCION ADD CONSTRAINT inscripcion_persona_DNIPER FOREIGN KEY (DNIPER) REFERENCES PERSONA (DNIPER);

-- Relación entre las tablas INSCRIPCIÓN - EMPLEADO
ALTER TABLE INSCRIPCION ADD CONSTRAINT inscripcion_empleado_IDEMP FOREIGN KEY (IDEMP) REFERENCES EMPLEADO (IDEMP);

-- Relación entre las tablas INSCRIPCIÓN - OFERTA
ALTER TABLE INSCRIPCION ADD CONSTRAINT inscripcion_oferta_IDOFER FOREIGN KEY (IDOFER) REFERENCES OFERTA (IDOFER);

-- Relación entre las tablas OFERTA - EMPLEADO
ALTER TABLE OFERTA ADD CONSTRAINT oferta_empleado_IDEMP FOREIGN KEY (IDEMP) REFERENCES EMPLEADO (IDEMP);

-- Relación entre las tablas OFERTA - CURSO
ALTER TABLE OFERTA ADD CONSTRAINT oferta_curso_CODCUR FOREIGN KEY (CODCUR) REFERENCES CURSO (CODCUR);