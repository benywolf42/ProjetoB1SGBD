-- Criar Database/Schema
CREATE SCHEMA IF NOT EXISTS `AutoEscola` DEFAULT CHARACTER SET utf8 ;
USE `AutoEscola` ;

-- TABELAS:
CREATE TABLE IF NOT EXISTS `AutoEscola`.`Aluno` (
  `idAluno` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  `rg` VARCHAR(20) NOT NULL,
  `email` VARCHAR(45) NULL,
  `dataNascimento` DATE NOT NULL,
  `dataRegistro` DATETIME NOT NULL,
  PRIMARY KEY (`idAluno`));

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Telefone` (
  `idTelefone` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(25) NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  PRIMARY KEY (`idTelefone`),
  INDEX `fk_Telefone_Aluno1_idx` (`Aluno_idAluno` ),
  CONSTRAINT `fk_Telefone_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `AutoEscola`.`Aluno` (`idAluno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(45) NOT NULL,
  `numero` INT NULL,
  `complemento` VARCHAR(15) NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `uf` CHAR(2) NOT NULL,
  `cep` CHAR(9) NOT NULL,
  `Aluno_idAluno` INT NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Aluno1_idx` (`Aluno_idAluno` ),
  CONSTRAINT `fk_Endereco_Aluno1`
    FOREIGN KEY (`Aluno_idAluno`)
    REFERENCES `AutoEscola`.`Aluno` (`idAluno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT,
  `tipoCnh` ENUM('A', 'B', 'AB', 'C', 'D') NOT NULL,
  `statusExameMedico` TINYINT(1) NOT NULL DEFAULT 0,
  `statusExameCfc` TINYINT(1) NOT NULL DEFAULT 0,
  `statusMatricula` TINYINT(1) NOT NULL DEFAULT 0,
  `statusAulas` TINYINT(1) NOT NULL DEFAULT 0,
  `dataRegistro` DATE NOT NULL,
  `id_Aluno` INT NOT NULL,
  `valorMonetario` FLOAT NOT NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `id_Aluno_idx` (`id_Aluno` ),
  CONSTRAINT `id_Aluno`
    FOREIGN KEY (`id_Aluno`)
    REFERENCES `AutoEscola`.`Aluno` (`idAluno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `salario` FLOAT NOT NULL,
  PRIMARY KEY (`idFuncionario`));

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Instrutor` (
  `idInstrutor` INT NOT NULL AUTO_INCREMENT,
  `registroInstrutor` VARCHAR(20) NOT NULL,
  `tipoCnh` ENUM('A', 'B', 'AB', 'C', 'D') NOT NULL,
  `id_Funcionario` INT NOT NULL,
  PRIMARY KEY (`idInstrutor`),
  INDEX `id_Funcionario_idx` (`id_Funcionario` ),
  CONSTRAINT `id_Funcionario_Instrutor`
    FOREIGN KEY (`id_Funcionario`)
    REFERENCES `AutoEscola`.`Funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `registroCfc` VARCHAR(20) NULL,
  `id_Funcionario` INT NOT NULL,
  PRIMARY KEY (`idProfessor`),
  INDEX `id_Funcionario_idx` (`id_Funcionario` ),
  CONSTRAINT `id_Funcionario_Professor`
    FOREIGN KEY (`id_Funcionario`)
    REFERENCES `AutoEscola`.`Funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Veiculo` (
  `idVeiculo` INT NOT NULL AUTO_INCREMENT,
  `tipoVeiculo` ENUM('A', 'B', 'C', 'D') NOT NULL,
  `chassi` VARCHAR(45) NOT NULL,
  `placa` CHAR(8) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `ano` CHAR(4) NOT NULL,
  PRIMARY KEY (`idVeiculo`));

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Aula` (
  `idAula` INT NOT NULL AUTO_INCREMENT,
  `inicioAula` DATETIME NOT NULL,
  `fimAula` DATETIME NOT NULL,
  `id_Matricula` INT NOT NULL,
  PRIMARY KEY (`idAula`),
  INDEX `id_Matricula_idx` (`id_Matricula` ),
  CONSTRAINT `id_Matricula`
    FOREIGN KEY (`id_Matricula`)
    REFERENCES `AutoEscola`.`Matricula` (`idMatricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `AutoEscola`.`AulaTeorica` (
  `idAulaTeorica` INT NOT NULL AUTO_INCREMENT,
  `id_Professor` INT NOT NULL,
  `id_Aula` INT NOT NULL,
  PRIMARY KEY (`idAulaTeorica`),
  INDEX `id_Professor_idx` (`id_Professor` ),
  INDEX `id_Aula_idx` (`id_Aula` ),
  CONSTRAINT `id_Professor_AT`
    FOREIGN KEY (`id_Professor`)
    REFERENCES `AutoEscola`.`Professor` (`idProfessor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_Aula_Teorica`
    FOREIGN KEY (`id_Aula`)
    REFERENCES `AutoEscola`.`Aula` (`idAula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AutoEscola`.`AulaPratica` (
  `idAulaPratica` INT NOT NULL AUTO_INCREMENT,
  `id_Instrutor` INT NOT NULL,
  `id_Aula` INT NOT NULL,  
  `Veiculo_idVeiculo` INT NOT NULL,
  PRIMARY KEY (`idAulaPratica`),
  INDEX `id_Aula_idx` (`id_Aula` ),
  INDEX `id_Professor_idx` (`id_Instrutor` ),  
  INDEX `fk_Aula_Veiculo1_idx` (`Veiculo_idVeiculo` ),
  CONSTRAINT `id_Aula_Pratica`
    FOREIGN KEY (`id_Aula`)
    REFERENCES `AutoEscola`.`Aula` (`idAula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `id_Professor_AP`
    FOREIGN KEY (`id_Instrutor`)
    REFERENCES `AutoEscola`.`Instrutor` (`idInstrutor`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,  
  CONSTRAINT `fk_Aula_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo`)
    REFERENCES `AutoEscola`.`Veiculo` (`idVeiculo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Turno` (
  `idTurno` INT NOT NULL AUTO_INCREMENT,
  `segunda` TINYINT(1) NOT NULL,
  `terca` TINYINT(1) NOT NULL,
  `quarta` TINYINT(1) NOT NULL,
  `quinta` TINYINT(1) NOT NULL,
  `sexta` TINYINT(1) NOT NULL,
  `sabado` TINYINT(1) NOT NULL,
  `iniDisp` TIME NOT NULL,
  `fimDisp` TIME NOT NULL,
  `iniValidade` DATE NOT NULL,
  `fimValidade` DATE NOT NULL,
  PRIMARY KEY (`idTurno`));

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Funcionario_has_Turno` (
  `Turno_idTurno` INT NOT NULL,
  `id_Funcionario_has_turno` INT NOT NULL AUTO_INCREMENT,
  `Funcionario_idFuncionario` INT NOT NULL,
  INDEX `fk_Funcionario_has_Turno_Turno1_idx` (`Turno_idTurno`),
  PRIMARY KEY (`id_Funcionario_has_turno`),
  INDEX `fk_Funcionario_has_Turno_Funcionario1_idx` (`Funcionario_idFuncionario`),
  CONSTRAINT `fk_Funcionario_has_Turno_Turno1`
    FOREIGN KEY (`Turno_idTurno`)
    REFERENCES `AutoEscola`.`Turno` (`idTurno`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Funcionario_has_Turno_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `AutoEscola`.`Funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `AutoEscola`.`Salarios` (
  `id_Gasto` INT NOT NULL AUTO_INCREMENT,
  `Valor` FLOAT NOT NULL,
  `id_Funcionario` INT NOT NULL,  
  `statusPagamento` TINYINT(1) NOT NULL DEFAULT 1,
  `pagamentoReferenteA` DATE NOT NULL,
  `dataPagamento` DATE DEFAULT NULL,
  INDEX `fk_id_Funcionario_idx` (`id_Funcionario`),
  PRIMARY KEY (`id_Gasto`),
  CONSTRAINT `fk_id_Funcionario`
    FOREIGN KEY (`id_Funcionario`)
    REFERENCES `AutoEscola`.`Funcionario` (`idFuncionario`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
    
CREATE TABLE IF NOT EXISTS `AutoEscola`.`DinheiroEntrar` (
  `id_Entrada` INT NOT NULL AUTO_INCREMENT,
  `Valor` FLOAT NOT NULL,
  `Descricao` VARCHAR(100) NOT NULL,
  `id_Matricula` INT NOT NULL,  
  `statusPagamento` TINYINT(1) NOT NULL DEFAULT 1,
  `dataPagamento` DATE DEFAULT NULL,
  INDEX `fk_id_Funcionario_idx` (`id_Matricula`),
  PRIMARY KEY (`id_Entrada`),
  CONSTRAINT `fk_id_Matricula`
    FOREIGN KEY (`id_Matricula`)
    REFERENCES `AutoEscola`.`Matricula` (`idMatricula`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `autoescola`.`FLuxoDeCaixaMensalHistorico` (
  `id_FLuxoDeCaixaHistoricoco` INT NOT NULL AUTO_INCREMENT,
  `mesReferente` DATE NOT NULL,
  `entrada` FLOAT NOT NULL,
  `saida` FLOAT NOT NULL,
  PRIMARY KEY (`id_FLuxoDeCaixaHistoricoco`));