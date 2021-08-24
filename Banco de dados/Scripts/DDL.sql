CREATE DATABASE SPMED_GROUP
GO

USE SPMED_GROUP;
GO

--SITUACAO
CREATE TABLE Situacao(
	IdSituacao TINYINT PRIMARY KEY IDENTITY,
	Descricao VARCHAR(15) NOT NULL
);
GO

--TIPO DE USUARIO
CREATE TABLE TipoUsuario(
	IdTipoUsuario TINYINT PRIMARY KEY IDENTITY,
	TituloTipoUsuario VARCHAR(20) NOT NULL
);
GO

--USUARIO
CREATE TABLE Usuario(
	IdUsuario INT PRIMARY KEY IDENTITY,
	IdTipoUsuario TINYINT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario) NOT NULL,
	NomeUsuario VARCHAR(20) NOT NULL,
	Email VARCHAR(256) NOT NULL,
	Senha VARCHAR(9) NOT NULL
);
GO

--PACIENTE
CREATE TABLE Paciente(
	IdPaciente INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	Telefone VARCHAR(14),
	DataNascimento DATE NOT NULL,
	Endereco VARCHAR(150) NOT NULL,
	Rg VARCHAR(12) NOT NULL UNIQUE,
	Cpf VARCHAR(14) NOT NULL UNIQUE
);
GO

--CLINICA
CREATE TABLE Clinica(
	IdClinica SMALLINT PRIMARY KEY IDENTITY,
	NomeFantasia VARCHAR(20) NOT NULL,
	RazaoSocial VARCHAR(50) NOT NULL,
	Endereco VARCHAR(150) NOT NULL,
	Cnpj VARCHAR(18) NOT NULL UNIQUE,
	HorarioAbertura TIME NOT NULL,
	HorarioFechamento TIME NOT NULL
);
GO

--ESPECIALIDADE
CREATE TABLE Especialidade(
	IdEspecialidade SMALLINT PRIMARY KEY IDENTITY,
	Descricao VARCHAR(35) NOT NULL
);
GO

--MEDICO
CREATE TABLE Medico(
	IdMedico INT PRIMARY KEY IDENTITY,
	IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario) NOT NULL,
	IdClinica SMALLINT FOREIGN KEY REFERENCES Clinica(IdClinica) NOT NULL,
	IdEspecialidade SMALLINT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade) NOT NULL,
	Crmv VARCHAR(8) NOT NULL UNIQUE
);
GO

--CONSULTA
CREATE TABLE Consulta(
	IdConsulta INT PRIMARY KEY IDENTITY,
	IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico) NOT NULL,
	IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente) NOT NULL,
	IdSituacao TINYINT FOREIGN KEY REFERENCES Situacao(IdSituacao) DEFAULT(3),
	DataeHora DATETIME NOT NULL,
	Descricao VARCHAR(100)
);
GO