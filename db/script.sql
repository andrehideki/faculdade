
CREATE TABLE IF NOT EXISTS aluno (
	ra INT IDENTITY PRIMARY KEY,
	cpf INT NOT NULL,
	nome VARCHAR(50) NOT NULL,
	sobrenome VARCHAR(50) NOT NULL,
	data_nascimento DATE NOT NULL,
	sexo CHAR(1) NOT NULL,
	ativo BOOLEAN NOT NULL,
	nome_pai VARCHAR(100) NOT NULL,
	nome_mae VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	whatsapp VARCHAR(15),
	curso_codigo INT NOT NULL,
	turma_codigo INT NOT NULL
);

CREATE TABLE IF NOT EXISTS aluno_endereco (
	codigo INT IDENTITY PRIMARY KEY,
	aluno_codigo INT NOT NULL,
	logradouro VARCHAR(100) NOT NULL,
	cep CHAR(8) NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	numero INT NOT NULL,
	estado CHAR(2)
);

CREATE TABLE IF NOT EXISTS aluno_telefone (
	codigo INT IDENTITY PRIMARY KEY,
	aluno_codigo INT NOT NULL,
	numero VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS aluno_disciplina (
	aluno_codigo INT NOT NULL,
	disciplina_codigo INT NOT NULL
);

CREATE TABLE IF NOT EXISTS professor (
	codigo INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	sobrenome VARCHAR(50) NOT NULL,
	status BOOLEAN NOT NULL,
	email VARCHAR(100) NOT NULL,
	whatsapp VARCHAR(15) NOT NULL,
	departamento_codigo INT NOT NULL
);

CREATE TABLE IF NOT EXISTS professor_disciplina (
	professor_codigo INT NOT NULL,
	disciplina_codigo INT NOT NULL,
	PRIMARY KEY(professor_codigo, disciplina_codigo)
);

CREATE TABLE IF NOT EXISTS disciplina (
	codigo INT IDENTITY PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	carga_horaria INT NOT NULL,
	obrigatoria BOOLEAN NOT NULL,
	codigo_disc_dep INT NOT NULL,
	codigo_departamento INT NOT NULL
);

CREATE TABLE IF NOT EXISTS disciplina_historico (
	disciplina_codigo INT,
	historico_codigo INT,
	nota DECIMAL,
	frequencia INT,
	PRIMARY KEY(disciplina_codigo, historico_codigo)
);

CREATE TABLE IF NOT EXISTS historico (
	codigo INT PRIMARY KEY,
	ra_aluno INT NOT NULL,
	data_inicio DATE NOT NULL,
	data_fim DATE
);

CREATE TABLE IF NOT EXISTS turma (
	codigo INT IDENTITY PRIMARY KEY,
	data_inicio DATE NOT NULL,
	data_fim DATE NOT NULL,
	n_alunos INT NOT NULL,
	periodo CHAR(1) NOT NULL,
	codigo_disciplina INT NOT NULL,
	codigo_curso INT NOT NULL
);

CREATE TABLE IF NOT EXISTS departamento (
	codigo INT IDENTITY PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS curso (
	codigo INT IDENTITY PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	departamento_codigo INT NOT NULL
);

CREATE TABLE IF NOT EXISTS curso_disciplina (
	codigo_curso INT NOT NULL,
	codigo_disciplina INT NOT NULL,
	PRIMARY KEY(codigo_curso, codigo_disciplina)
);

ALTER TABLE aluno ADD 
FOREIGN KEY(curso_codigo) REFERENCES curso(codigo);

ALTER TABLE aluno ADD 
FOREIGN KEY(turma_codigo) REFERENCES turma(codigo);

ALTER TABLE aluno_telefone ADD 
FOREIGN KEY(aluno_codigo) REFERENCES aluno(ra);

ALTER TABLE aluno_endereco ADD 
FOREIGN KEY(aluno_codigo) REFERENCES aluno(ra);

ALTER TABLE aluno_disciplina ADD 
FOREIGN KEY(aluno_codigo) REFERENCES aluno(ra);

ALTER TABLE aluno_disciplina ADD 
FOREIGN KEY(disciplina_codigo) REFERENCES disciplina(codigo);

ALTER TABLE professor ADD 
FOREIGN KEY(departamento_codigo) REFERENCES departamento(codigo);

ALTER TABLE professor_disciplina ADD 
FOREIGN KEY(professor_codigo) REFERENCES professor(codigo);

ALTER TABLE professor_disciplina ADD 
FOREIGN KEY(disciplina_codigo) REFERENCES disciplina(codigo);

ALTER TABLE disciplina ADD  
FOREIGN KEY(codigo_disc_dep) REFERENCES disciplina(codigo);

ALTER TABLE disciplina ADD 
FOREIGN KEY(codigo_departamento) REFERENCES departamento(codigo);

ALTER TABLE disciplina_historico ADD  
FOREIGN KEY(disciplina_codigo) REFERENCES disciplina(codigo);

ALTER TABLE disciplina_historico ADD  	
FOREIGN KEY(historico_codigo) REFERENCES historico(codigo);

ALTER TABLE historico ADD  	
FOREIGN KEY(ra_aluno) REFERENCES aluno(ra);

ALTER TABLE turma ADD  	
FOREIGN KEY(codigo_disciplina) REFERENCES disciplina(codigo);

ALTER TABLE turma ADD  	
FOREIGN KEY(codigo_curso) REFERENCES curso(codigo);

ALTER TABLE curso ADD  	
FOREIGN KEY(departamento_codigo) REFERENCES departamento(codigo);

ALTER TABLE curso_disciplina ADD  	
FOREIGN KEY(codigo_curso) REFERENCES curso(codigo);

ALTER TABLE curso_disciplina ADD  	
FOREIGN KEY(codigo_disciplina) REFERENCES disciplina(codigo);

