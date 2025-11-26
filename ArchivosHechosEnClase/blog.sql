/* CREATE TABLE Usuario(
    idUsuario int Primary Key auto_increment,
    nombrePila VARCHAR(30) NOT NULL,
    apellidoPaterno VARCHAR(20) NOT NULL,
    apellidoMaterno VARCHAR(20),
    telefono CHAR(10),
    correoElectronico VARCHAR(30) NOT NULL UNIQUE,
    fechaNacimiento DATE NOT NULL
);

CREATE TABLE Comentario(
    idComentario int Primary Key auto_increment,
    contenido VARCHAR(75) NOT NULL
);

DROP TABLE Comenta;

ALTER TABLE comentario ADD idUsuario INT NOT NULL;

ALTER TABLE comentario DROP COLUMN fecha;

ALTER TABLE Comentario 
ADD CONSTRAINT usuarioComentarioFK
FOREIGN KEY (idUsuario) REFERENCES
Usuario(idUsuario);

CREATE TABLE Categoria(
    idCategoria int Primary Key auto_increment,
    nombre VARCHAR(20) NOT NULL
);
*/

CREATE TABLE Categoria(
    idCategoria int Primary Key auto_increment,
    nombre VARCHAR(20) NOT NULL
);

create table Post(
	idPost int Primary Key auto_increment,
    Contenido varchar(75) not null,
    Titulo varchar(25) not null,
    Fecha date not null,
    idUsuario int not null,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    idCategoria int not null,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

ALTER TABLE comentario ADD idPost INT NOT NULL;
ALTER TABLE Comentario 
ADD CONSTRAINT usuarioPostFK
FOREIGN KEY (idPost) REFERENCES Post(idPost);



ALTER TABLE Comentario 
ADD CONSTRAINT usuarioComentarioFK
FOREIGN KEY (idUsuario) REFERENCES
Usuario(idUsuario);

CREATE TABLE Etiqueta(
	IdEtiqueta int not null,
    nombre varchar(20) not null
);

ALTER TABLE Etiqueta DROP COLUMN IdEtiqueta;
ALTER TABLE Etiqueta ADD IdEtiqueta INT PRIMARY KEY AUTO_INCREMENT;

CREATE TABLE PostEtiqueta(
	idPost int not null,
    IdEtiqueta int not null,
    
    constraint fk_postEti_post
		foreign key (idPost) references Post(idPost),
	constraint fk_postEti_etiqueta
		foreign key (IdEtiqueta) references Etiqueta(IdEtiqueta)
);