CREATE DATABASE OrionDB;
USE OrionDB;


CREATE TABLE Usuario(
    IdUsuario INT AUTO_INCREMENT PRIMARY KEY ,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    SenhaHash VARCHAR(255) NOT NULL,
    CPF VARCHAR(100),
    Celular VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(100)
);

CREATE TABLE Planos(
    IdPlano INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR (255) NOT NULL,
    Valor DOUBLE NOT NULL,
    Descricao VARCHAR(255) NOT NULL,
    Status_p VARCHAR(255) NOT NULL, 
    Data_venc DATE 
);

/* ON DELETE CASCADE: quando um registro da tabela principal é excluído, 
todos os registros relacionados em tabelas dependentes são apagados automaticamente.
*/

CREATE TABLE Pagamento(
    IdPagamento INT AUTO_INCREMENT PRIMARY KEY,
    Forma_Pag VARCHAR(255) NOT NULL,
    IdUsuario INT,
    IdPlano INT,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE, 
    FOREIGN KEY (IdPlano) REFERENCES Planos(IdPlano)
);

CREATE TABLE Feedback(
    IdFeedback INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    Data_Post DATETIME,
    IdUsuario INT,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) 
);

CREATE TABLE Duvida(
    IdDuvida INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    Data_Post DATETIME,
    IdUsuario INT, 
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario)
);

CREATE TABLE Blog(
	IdBlog INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(250) NOT NULL,
    Autor VARCHAR(250),
    Conteudo TEXT,
    Data_Publicacao DATETIME
);

CREATE TABLE Autenticacao_Pag(
    IdAutenticacao INT AUTO_INCREMENT PRIMARY KEY,
    Id_Usuario INT,
    Id_Pagamento INT,
    Numero_Cart VARCHAR(255) NOT NULL UNIQUE,
    Cod_Seg INT NOT NULL UNIQUE,
    Validade VARCHAR(255) NOT NULL,
    Nome_Cart VARCHAR(255) NOT NULL,
    Debito BOOLEAN,
    Credito BOOLEAN,
    FOREIGN KEY (Id_Pagamento) REFERENCES Pagamento(IdPagamento),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE
);

CREATE TABLE Assinatura (
	IdAssinatura INT PRIMARY KEY AUTO_INCREMENT,
    IdUsuario INT, 
    IdPlano INT, 
    IdPagamento INT, 
    Data_Inicio DATE, 
    Data_Vencimento DATE, 
    Status_P VARCHAR(50) NOT NULL,
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario) ON DELETE CASCADE,
    FOREIGN KEY (IdPlano) REFERENCES Planos(IdPlano),
    FOREIGN KEY (IdPagamento) REFERENCES Pagamento(IdPagamento)
);
