-- Crear la base de datos
CREATE DATABASE Biblioteca;

-- Seleccionar la base de datos
USE Biblioteca;

-- Crear la tabla de publicaciones
CREATE TABLE Publicaciones (
    IdPublicacion INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Autor VARCHAR(100),
    Isbn VARCHAR(13),
    AnioPublicacion INT,
    TipoPublicacion VARCHAR(10) -- Libro, Revista, DVD
);

-- Crear la tabla de libros
CREATE TABLE Libros (
    IdLibro INT PRIMARY KEY,
    IdPublicacion INT,
    NumeroPaginas INT,
    FOREIGN KEY (IdPublicacion) REFERENCES Publicaciones(IdPublicacion)
);

-- Crear la tabla de revistas
CREATE TABLE Revistas (
    IdRevista INT PRIMARY KEY,
    IdPublicacion INT,
    NumeroVolúmenes INT,
    FOREIGN KEY (IdPublicacion) REFERENCES Publicaciones(IdPublicacion)
);

-- Crear la tabla de DVDs
CREATE TABLE DVDs (
    IdDVD INT PRIMARY KEY,
    IdPublicacion INT,
    Duración INT,
    FOREIGN KEY (IdPublicacion) REFERENCES Publicaciones(IdPublicacion)
);

-- Crear la tabla de usuarios
CREATE TABLE Usuarios (
    IdUsuario INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    NumeroSocio INT
);

-- Crear la tabla de préstamos
CREATE TABLE Prestamos (
    IdPrestamo INT PRIMARY KEY,
    IdPublicacion INT,
    IdUsuario INT,
    FechaInicio DATE,
    FechaDevolución DATE,
    FOREIGN KEY (IdPublicacion) REFERENCES Publicaciones(IdPublicacion),
    FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario)
);