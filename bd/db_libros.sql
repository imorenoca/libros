
CREATE DATABASE db_libro;
USE db_libro;
-- Tabla Autores
CREATE TABLE Autores (
    ID_Autor INT PRIMARY KEY AUTO_INCREMENT,
    Apellido1 VARCHAR(255) NOT NULL,
    Apellido2 VARCHAR(255),
    Nombre VARCHAR(255) NOT NULL
);

-- Tabla Generos
CREATE TABLE Generos (
    ID_Genero INT PRIMARY KEY AUTO_INCREMENT,
    Genero VARCHAR(255) NOT NULL
);

-- Tabla Editoriales
CREATE TABLE Editoriales (
    ID_Editorial INT PRIMARY KEY AUTO_INCREMENT,
    Editorial VARCHAR(255) NOT NULL
);

-- Tabla Idiomas
CREATE TABLE Idiomas (
    ID_Idioma INT PRIMARY KEY AUTO_INCREMENT,
    Idioma VARCHAR(255) NOT NULL
);

-- Tabla Libros
CREATE TABLE Libros (
    ID_Libro INT PRIMARY KEY AUTO_INCREMENT,
    ISBN VARCHAR(20),
    Titulo VARCHAR(255) NOT NULL,
    Subtitulo VARCHAR(255),
    NumPaginas INT,
    FechaPublicacion DATE,
    ID_Editorial INT,
    ID_Genero INT,
    ID_Idioma INT,
    FOREIGN KEY (ID_Editorial) REFERENCES Editoriales(ID_Editorial) ON DELETE SET NULL,
    FOREIGN KEY (ID_Genero) REFERENCES Generos(ID_Genero) ON DELETE SET NULL,
    FOREIGN KEY (ID_Idioma) REFERENCES Idiomas(ID_Idioma) ON DELETE SET NULL
);

-- Tabla LibroAutor (Tabla intermedia para la relación n:m entre Libros y Autores)
CREATE TABLE LibroAutor (
    ID_Libro INT,
    ID_Autor INT,
    PRIMARY KEY (ID_Libro, ID_Autor),
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro) ON DELETE CASCADE,
    FOREIGN KEY (ID_Autor) REFERENCES Autores(ID_Autor) ON DELETE CASCADE
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Usuario VARCHAR(255) NOT NULL,
    CorreoElectronico VARCHAR(255) NOT NULL,
    ContraseñaHash VARCHAR(60) NOT NULL
);

-- Tabla Roles
CREATE TABLE Roles (
    ID_Rol INT PRIMARY KEY AUTO_INCREMENT,
    Rol VARCHAR(255) NOT NULL
    
);

-- Tabla UsuarioRol (Tabla intermedia para la relación n:m entre Usuarios y Roles)
CREATE TABLE UsuarioRol (
    ID_Usuario INT,
    ID_Rol INT,
    PRIMARY KEY (ID_Usuario, ID_Rol),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario) ON DELETE CASCADE,
    FOREIGN KEY (ID_Rol) REFERENCES Roles(ID_Rol) ON DELETE CASCADE
);

-- Tabla Lecturas
CREATE TABLE Lecturas (
    ID_Lectura INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT,
    ID_Libro INT,
    FechaInicio DATE,
    FechaFin DATE,
    Valoracion INT,
    Comentario VARCHAR(1000),
    FOREIGN KEY (ID_Usuario) REFERENCES Usuarios(ID_Usuario) ON DELETE SET NULL,
    FOREIGN KEY (ID_Libro) REFERENCES Libros(ID_Libro) ON DELETE SET NULL
);


