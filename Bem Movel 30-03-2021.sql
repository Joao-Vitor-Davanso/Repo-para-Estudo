CREATE TABLE tb_departamento( --Cria a tabela
SiglaDepto			VARCHAR,
NomeDepto			VARCHAR(60),
CONSTRAINT pk_tb_depto_SiglaDepto PRIMARY KEY(SiglaDepto) -- Cria a chame primária da tabela
);

SELECT *
FROM tb_departamento; -- mostra a tabela 

CREATE TABLE tb_setor(
SiglaSetor			VARCHAR,
SiglaDepto			VARCHAR,
NomeSetor			VARCHAR(40),
CONSTRAINT pk_tb_setor_SiglaSetor PRIMARY KEY (SiglaSetor),
CONSTRAINT fk_tb_setor_SiglaDepto FOREIGN KEY (SiglaDepto) -- Criando a chave estrangeira
	REFERENCES tb_departamento(SiglaDepto)
);

CREATE TABLE tb_bem_movel(
CodBem				INTEGER,
SiglaSetor			VARCHAR,
DescricaoBem		VARCHAR(60),
DataCompraBem		DATE,
VlrCompraBem		NUMERIC(7, 2),
CONSTRAINT pk_tb_bem_movel_CodBem PRIMARY KEY (CodBem),
CONSTRAINT fk_tb_bem_movel_SiglaSetor FOREIGN KEY (SiglaSetor)
	REFERENCES tb_setor(SiglaSetor)
);

CREATE TABLE tb_tipo_dano(
idTipo				INTEGER,
DescricaoTipo		VARCHAR(60),
CONSTRAINT pk_tb_tipo_dano_idTipo PRIMARY KEY (idTipo)
);

CREATE TABLE tb_ocorrencia(
NroOcorrencia		INTEGER,
idTipo				INTEGER,
CodBem				INTEGER,
SiglaSetor			VARCHAR,
DataOcorrencia		DATE,
CONSTRAINT pk_tb_ocorrencia_NroOcorrencia PRIMARY KEY (NroOcorrencia),
CONSTRAINT fk_tb_tb_ocorrencia_idTipo FOREIGN KEY (idTipo)
	REFERENCES tb_tipo_dano(idTipo),
CONSTRAINT fk_tb_ocorrencia_CodBem FOREIGN KEY (CodBem)
	REFERENCES tb_bem_movel(CodBem),
CONSTRAINT 	fk_tb_ocorrencia_SiglaSetor FOREIGN KEY (SiglaSetor)
	REFERENCES tb_setor(SiglaSetor)
);