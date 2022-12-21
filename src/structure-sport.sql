CREATE DATABASE sport;
USE sport;

-- --------------------------------
-- Creation des tables
-- --------------------------------
CREATE TABLE postes(
id_poste INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_poste VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE phases(
id_phase INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_phase VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE competitions(
id_competition INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_competition VARCHAR(50) NOT NULL,
date_competition DATE NOT NULL
)Engine=InnoDB;

CREATE TABLE stades(
id_stade INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_stade VARCHAR(50) NOT NULL,
num_rue_stade INT NOT NULL,
nom_rue_stade VARCHAR(50) NOT NULL,
cp_stade INT NOT NULL,
ville_stade VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE equipes(
id_equipe INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_equipe VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE joueurs(
id_joueur INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_joueur VARCHAR(50) NOT NULL,
prenom_joueur VARCHAR(50) NOT NULL,
age_joueur INT NOT NULL,
id_poste INT NOT NULL,
id_equipe INT NOT NULL
)Engine=InnoDB;

CREATE TABLE matches(
id_match INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
date_match DATE NOT NULL,
id_competition INT NOT NULL,
id_stade INT NOT NULL,
id_phase INT NOT NULL
)Engine=InnoDB;

CREATE TABLE participer(
id_equipe1 INT NOT NULL,
id_equipe2 INT NOT NULL,
id_match INT NOT NULL,
PRIMARY KEY(id_match, id_equipe1, id_equipe2),
score_equipe1 INT NOT NULL,
score_equipe2 INT NOT NULL
)Engine=InnoDB;

-- --------------------------
-- Creation des relations
-- --------------------------
-- Joueur
ALTER TABLE joueurs
  ADD CONSTRAINT fk_qualifier_poste
  FOREIGN KEY(id_poste)
  REFERENCES postes(id_poste);
ALTER TABLE joueurs
  ADD CONSTRAINT fk_integrer_equipe
  FOREIGN KEY(id_equipe)
  REFERENCES equipes(id_equipe);

-- Match
ALTER TABLE matches
  ADD CONSTRAINT fk_contenir_competition
  FOREIGN KEY(id_competition)
  REFERENCES competitions(id_competition);
ALTER TABLE matches
  ADD CONSTRAINT fk_localiser_stade
  FOREIGN KEY(id_stade)
  REFERENCES stades(id_stade);
ALTER TABLE matches
  ADD CONSTRAINT fk_completer_phase
  FOREIGN KEY(id_phase)
  REFERENCES phases(id_phase);

-- Participer
ALTER TABLE participer
  ADD CONSTRAINT fk_participer_match
  FOREIGN KEY(id_match)
  REFERENCES matches(id_match);
ALTER TABLE participer
  ADD CONSTRAINT fk_participer_equipe1
  FOREIGN KEY(id_equipe1)
  REFERENCES equipes(id_equipe);
ALTER TABLE participer
  ADD CONSTRAINT fk_participer_equipe2
  FOREIGN KEY(id_equipe2)
  REFERENCES equipes(id_equipe);

