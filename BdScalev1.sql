CREATE TABLE empresas_cadastro(
	id_empresas INT AUTO_INCREMENT NULL,
	nome_fantasia VARCHAR(200) NULL,
    cnpj CHAR(19) NULL,
	razao_social VARCHAR(200) NULL,
	pais VARCHAR (50) NULL,
    uf VARCHAR(45) NULL,
    cidade VARCHAR(50) NULL,
    CEP CHAR(9) NULL,
    endereco VARCHAR(200),
    bairro VARCHAR(45) NULL,
    numero_endereco VARCHAR(45) NULL,
    criado_em DATE NULL,
	PRIMARY KEY(id_empresas)
);

select * from empresas_cadastro;
drop table empresas_cadastro;
    
-- tabela boards

CREATE TABLE  Boards (
  nome_do_board INT NOT NULL,
  Board VARCHAR(3) NOT NULL,
  Ultima_modificação DATETIME NULL,
  PRIMARY KEY (Nome_do_board));
  

--  tabela turmas
CREATE TABLE  Turmas (
  nome_do_board INT NOT NULL,
  nome_da_turma INT NOT NULL,
  Stat VARCHAR(15) NULL,
  Data_abertura DATE NOT NULL,
  Data_fechamento DATE NULL,
  Ultima_modificação DATETIME NULL,
  id_turmas INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id_turmas),
  CONSTRAINT nome_do_board
    FOREIGN KEY (nome_do_board)
    REFERENCES Boards (nome_do_board)
   );
   
   
-- Table membros_perfil

CREATE TABLE membros_perfil (
    id_turma INT NOT NULL,
    nome_empresas VARCHAR(60) NOT NULL,
    nome_credencial VARCHAR(100) NULL,
    nome_do_board INT NOT NULL,
    cpf CHAR(13) NOT NULL,
    id_membros_perfil INT NOT NULL AUTO_INCREMENT,
    foto_perfil VARCHAR(200) NULL,
    linkedin VARCHAR(200) NULL,
    instagram VARCHAR(200) NULL,
    link_whatsapp VARCHAR(200) NULL,
    produtos_adquiridos VARCHAR(200) NOT NULL,
    idiomas VARCHAR(100),
    marcado_de_atuacao VARCHAR(45) NULL,
    status_onboarding_scale VARCHAR(45) NULL,
    status_onboarding_club VARCHAR(45) NULL,
    data_onboarding DATE NULL,
    como_conheceu_g4 VARCHAR(200),
    PRIMARY KEY (id_membros_perfil)
);

-- Table membros_cadastro

CREATE TABLE  membros_cadastro (
	id_membro_cadastro INT NULL AUTO_INCREMENT,
    nome_completo VARCHAR(100) NULL,
    CPF CHAR(14) NOT NULL,
    data_nascimento DATE NULL,
	genero VARCHAR(50) NULL,
	email VARCHAR(45) NULL,
	telefone CHAR(13) NULL,
	uf VARCHAR(45) NULL,
	cidade VARCHAR(45) NULL,
    endereco VARCHAR(200) NULL,
	bairro VARCHAR(45) NULL,
	numero_endereco VARCHAR(45) NULL,
	complemento VARCHAR(45) NULL,
	CEP CHAR(9) NULL,
	data_inclusao DATE NULL,
	PRIMARY KEY (id_membro_cadastro)
);

	select * from membros_cadastro;
    drop table membros_cadastro;
    
 -- tabela leads_convidados
 
CREATE TABLE leads_convidados (
    Nome VARCHAR(50) NOT NULL,
    Empresa VARCHAR(45) NULL,
    Telefone_Principal VARCHAR(45) NULL,
    email VARCHAR(80) NULL,
    status VARCHAR(50) NULL,
    origem_lead VARCHAR(45) NULL,
    compareceu VARCHAR(5) NULL,
    leads_convidadoscol VARCHAR(45) NULL,
    id_convidado INT NULL AUTO_INCREMENT,
    PRIMARY KEY (id_convidado)
);
 -- tabela eventos
CREATE TABLE  eventos (
  id_evento INT NOT NULL AUTO_INCREMENT,
  leads_convidados VARCHAR(5) NOT NULL,
  nome_credencial VARCHAR(100) NOT NULL,
  nome_da_turma INT NOT NULL,
  nome_do_evento VARCHAR(45) NOT NULL,
  Tipo VARCHAR(45) NULL,
  Formato VARCHAR(20) NULL,
  Data_evento DATE NULL,
  Convidado_talks VARCHAR(50) NULL,
  tema_talks VARCHAR(100) NULL,
  Ultima_modificação DATETIME NULL,
  Ordem_de_inscrição TINYINT NULL,
  Nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NULL,
  tipo_de_ingresso VARCHAR(45) NULL,
  valor TINYINT NULL,
  data_da_compra DATETIME NULL,
  n_pedido VARCHAR(45) NULL,
  Estado_de_pagamento VARCHAR(45) NULL,
  Check_in VARCHAR(10) NOT NULL,
  Data_checkin DATETIME NULL,
  telefone CHAR(15) NULL,
  empresa VARCHAR(60) NULL,
  eventoscol VARCHAR(45) NULL,
  PRIMARY KEY (id_evento)
  );
  
 -- Table Presença_eventos
 
CREATE TABLE presenca_eventos(
  id_membro INT,
  id_evento INT NULL
);
--------------------
-- estrangeiras do membros cadastros
--------------------
ALTER TABLE membros_cadastro 
 ADD CONSTRAINT fk_empresas_cadastros FOREIGN KEY (id_empresa) REFERENCES id_empresas_cadastros (id_empresa);
ALTER TABLE membros_cadastro 
 ADD CONSTRAINT fk_empresas_cnpj FOREIGN KEY(cnpj_empresa) REFERENCES empresas_perfil(empresa_cnpj);
--------------------
-- estrangeiras do membros perfil
--------------------
ALTER TABLE membros_perfil
 ADD CONSTRAINT fk_cnpj_membros_perfil FOREIGN KEY(cnpj_empresa) REFERENCES empresas_perfil(Nome);
ALTER TABLE membros_perfil
	ADD CONSTRAINT fk_id_turma_membros_perfil FOREIGN KEY (id_turma) REFERENCES turmas(id_turmas);
ALTER TABLE membros_perfil 
	ADD CONSTRAINT fk_boards_membros_perfil FOREIGN KEY (nome_do_board) REFERENCES boards(Nome_do_board);
--------------------
-- estrangeiras do presença eventos
--------------------
ALTER TABLE presenca_eventos
	ADD CONSTRAINT fk_id_membros_perfil_presenca_eventos FOREIGN KEY(id_membro) REFERENCES membros_perfil(id_membros_perfil);
ALTER TABLE presenca_eventos
	ADD CONSTRAINT fk_id_eventos_perfil_presenca_eventos FOREIGN KEY(id_evento) REFERENCES eventos(id_evento);
--------------------
-- estrangeiras do Boards
--------------------
ALTER TABLE boards
ADD id_boards INT AUTO_INCREMENT;
--------------------
-- estrangeiras do Turmas
--------------------
ALTER TABLE turmas
	ADD id_boards INT(11) ;
ALTER TABLE turmas 
	ADD CONSTRAINT fk_id_boards_turmas FOREIGN KEY(id_boards) REFERENCES boards(id_boards);
    
--------------------
-- estrangeiras do eventos
--------------------
ALTER TABLE eventos 
	ADD CONSTRAINT fk_id_convidado_eventos FOREIGN KEY(id_convidado) REFERENCES leads_convidados(id_convidado);
ALTER TABLE eventos
	ADD CONSTRAINT fk_id_membros_perfil FOREIGN KEY (id_membros_perfil) REFERENCES membros_perfil(id_membros_perfil);
ALTER TABLE eventos 
	ADD CONSTRAINT fk_id_turmas_eventos FOREIGN KEY (id_turmas) REFERENCES  turmas(id_turmas);
--------------------
-- estrangeiras do empresas_perfil
--------------------
ALTER TABLE empresas_perfil
	ADD CONSTRAINT fk_id_empresas_cadastro_empresas_perfil FOREIGN KEY(id_empresas_cadastro) REFERENCES empresas_cadastro(id_empresas); 

SELECT * FROM empresas_cadastro;

DROP table empresas_cadastro;



    
	