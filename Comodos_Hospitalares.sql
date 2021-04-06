CREATE TABLE tb_tipo_comodo(
idTipo				INTEGER,
DescricaoTipo		VARCHAR(40),
CONSTRAINT 	pk_tb_tipo_comodo_idTipo PRIMARY KEY(idTipo)
);

CREATE TABLE tb_comodo(
NroComodo			INTEGER,
idTipo				INTEGER,
SituacaoComodo		VARCHAR(40),
CONSTRAINT pk_tb_comodo_NroComodo PRIMARY KEY(NroComodo),
CONSTRAINT fk_tb_comodo_idTipo FOREIGN KEY(idTipo)
	REFERENCES tb_tipo_comodo(idTipo)
);

CREATE TABLE tb_leito(
NroLeito			INTEGER,
NroComodo			INTEGER,
SituacaoLeito		BOOLEAN,
CONSTRAINT pk_tb_leito_NroLeito PRIMARY KEY(NroLeito),
CONSTRAINT fk_tb_leito_NroComodo FOREIGN KEY(NroComodo)
	REFERENCES tb_comodo(NroComodo)
);

CREATE TABLE tb_funcionario(
MatriculaFunc		INTEGER,
NomeFunc			VARCHAR(60),
EnderecoFunc		VARCHAR(40),
CelularFunc			VARCHAR(15),
FoneFunc			VARCHAR(15),
CONSTRAINT pk_tb_funcionario_MatriculaFunc PRIMARY KEY (MatriculaFunc)
);

CREATE TABLE tb_enfermeiro(
MatriculaFunc		INTEGER,
COREN				INTEGER,
CONSTRAINT fk_tb_enfermeiro_MatriculaFunc FOREIGN KEY (MatriculaFunc)
	REFERENCES tb_funcionario(MatriculaFunc)
);

CREATE TABLE tb_medico(
MatriculaFunc		INTEGER,
CRM					INTEGER,
CONSTRAINT fk_tb_medico_MatriculaFunc FOREIGN KEY (MatriculaFunc)
	REFERENCES tb_funcionario(MatriculaFunc)
);

CREATE TABLE tb_alocacao_comodo_enfermeiro(
MatriculaFunc		INTEGER,
NroComodo			INTEGER,
CONSTRAINT fk_tb_alocacao_comodo_enfermeiro_MatriculaFunc FOREIGN KEY (MatriculaFunc)
	REFERENCES tb_funcionario(MatriculaFunc),
CONSTRAINT fk_tb_alocacao_comodo_enfermeiro_NroComodo FOREIGN KEY (NroComodo)
	REFERENCES tb_comodo(NroComodo)
);