# Creación de base de datos
CREATE DATABASE blog;

# Seleccionar base de datos
USE blog;

# Creación de tablas 
## Usuario
CREATE TABLE Usuario(
    idUsuario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombrePila VARCHAR(30) NOT NULL,
    apellidoPaterno VARCHAR(20) NOT NULL,
    apellidoMaterno VARCHAR(20),
    telefono CHAR(10),
    correoElectronico VARCHAR(30) NOT NULL UNIQUE,
    fechaNacimiento DATE NOT NULL,
    fechaDeInsercion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    fechaDeActualizacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
);

## Categoria
CREATE TABLE Categoria(
    idCategoria INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL
);

## Post
create table Post(
	idPost INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    contenido text NOT NULL,
    titulo varchar(25) not null,
    fecha date not null,
    idUsuario INT UNSIGNED NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    idCategoria INT UNSIGNED NOT NULL,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

## Comentario
CREATE TABLE Comentario(
    idComentario INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    contenido TEXT NOT NULL,
    fecha DATE NOT NULL,
    idUsuario INT UNSIGNED NOT NULL,
    idPost INT UNSIGNED NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idPost) REFERENCES Post(idPost)
);

/*
CREATE TABLE Comentario(
    idComentario INT PRIMARY KEY AUTO_INCREMENT,
    contenido TEXT NOT NULL,
    fecha DATE NOT NULL
);
ALTER TABLE Comentario ADD idUsuario INT NOT NULL;
ALTER TABLE Comentario ADD idPost INT NOT NULL;
ALTER TABLE Comentario 
ADD CONSTRAINT usuarioPostFK
	FOREIGN KEY (idPost) REFERENCES Post(idPost);
ALTER TABLE Comentario
ADD CONSTRAINT usuarioComentarioFK
	FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario);
*/

## Etiqueta
CREATE TABLE Etiqueta(
	IdEtiqueta INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL
);

## PostEtiqueta
CREATE TABLE PostEtiqueta(
    idPost INT UNSIGNED NOT NULL,
    idEtiqueta INT UNSIGNED NOT NULL,
    PRIMARY KEY (idPost, idEtiqueta),
    FOREIGN KEY (idPost) REFERENCES Post(idPost),
    FOREIGN KEY (idEtiqueta) REFERENCES Etiqueta(idEtiqueta)
);

/*
CREATE TABLE PostEtiqueta(
    idPostEtiqueta INT PRIMARY KEY AUTO_INCREMENT,
    idPost INT NOT NULL,
    IdEtiqueta INT NOT NULL,
    CONSTRAINT fk_postEti_post
        FOREIGN KEY (idPost) REFERENCES Post(idPost),
    CONSTRAINT fk_postEti_etiqueta
        FOREIGN KEY (IdEtiqueta) REFERENCES Etiqueta(IdEtiqueta)
);
*/