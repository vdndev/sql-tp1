CREATE DATABASE societe;
USE societe;

-- ------------------------
-- Creation des tables
-- ------------------------
CREATE TABLE droit(
id_droit INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_droit VARCHAR(50) UNIQUE NOT NULL
)Engine=InnoDB;

CREATE TABLE utilisateur(
id_util INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
login_util VARCHAR(50) UNIQUE NOT NULL,
mot_pass_util VARCHAR(100) NOT NULL,
id_droit INT NOT NULL
)Engine=InnoDB;

CREATE TABLE typepf(
id_type_pf INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_type_pf VARCHAR(50) UNIQUE NOT NULL
)Engine=InnoDB;

CREATE TABLE fournisseur(
id_fourn INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_fourn VARCHAR(50) NOT NULL,
tel_fourn VARCHAR(10) NOT NULL,
adr_num_fourn INT NOT NULL,
adr_rue_fourn VARCHAR(50) NOT NULL,
adr_cp_fourn VARCHAR(5) NOT NULL,
adr_ville_fourn VARCHAR(50) NOT NULL,
adr_pays_fourn VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE matprem(
id_matprem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_mat VARCHAR(50) NOT NULL,
prix_achat FLOAT NOT NULL,
qte_stk FLOAT NOT NULL
)Engine=InnoDB;

CREATE TABLE clients(
id_client INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_cli VARCHAR(50) NOT NULL,
tel_cli VARCHAR(10) NOT NULL,
adr_num_cli INT NOT NULL,
adr_rue_cli VARCHAR(50) NOT NULL,
adr_cp_cli VARCHAR(5) NOT NULL,
adr_ville_cli VARCHAR(50) NOT NULL,
adr_pays_cli VARCHAR(50) NOT NULL
)Engine=InnoDB;

CREATE TABLE commerciaux(
id_com INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_com VARCHAR(50) NOT NULL,
prenom_com VARCHAR(50) NOT NULL,
tel_com VARCHAR(10) NOT NULL
)Engine=InnoDB;

CREATE TABLE produitfinis(
id_pf INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nom_pf VARCHAR(50) NOT NULL,
prix_vente_pf FLOAT NOT NULL,
qte_stk FLOAT NOT NULL,
id_type_pf INT NOT NULL
)Engine=InnoDB;

CREATE TABLE acheter(
id_fourn INT NOT NULL,
id_matprem INT NOT NULL,
PRIMARY KEY(id_fourn, id_matprem)
)Engine=InnoDB;

CREATE TABLE fabriquer(
id_matprem INT NOT NULL,
id_pf INT NOT NULL,
PRIMARY KEY(id_matprem, id_pf)
)Engine=InnoDB;

CREATE TABLE vendre(
id_client INT NOT NULL,
id_pf INT NOT NULL,
PRIMARY KEY(id_client, id_pf)
)Engine=InnoDB;

CREATE TABLE fideliser(
id_client INT NOT NULL,
id_com INT NOT NULL,
chiffre_affaire FLOAT NOT NULL,
PRIMARY KEY(id_client, id_com)
)Engine=InnoDB;

CREATE TABLE promouvoir(
id_pf INT NOT NULL,
id_com INT NOT NULL,
PRIMARY KEY(id_pf,id_com)
)Engine=InnoDB;

-- ------------------------
-- Creation des relations
-- ------------------------
-- utilisateur
ALTER TABLE utilisateur
  ADD CONSTRAINT fk_attribuer_droit
  FOREIGN KEY(id_droit)
  REFERENCES droit(id_droit);
  
-- produitfini
ALTER TABLE produitfinis
  ADD CONSTRAINT fk_posseder_type_pf
  FOREIGN KEY(id_type_pf)
  REFERENCES typepf(id_type_pf);

-- acheter
ALTER TABLE acheter
  ADD CONSTRAINT fk_acheter_fournisseur
  FOREIGN KEY(id_fourn)
  REFERENCES fournisseur(id_fourn);
ALTER TABLE acheter
  ADD CONSTRAINT fk_acheter_matprem
  FOREIGN KEY(id_matprem)
  REFERENCES matprem(id_matprem);
  
-- fabriquer
ALTER TABLE fabriquer
  ADD CONSTRAINT fk_fabriquer_produitfinis
  FOREIGN KEY(id_pf)
  REFERENCES produitfinis(id_pf);
ALTER TABLE fabriquer
  ADD CONSTRAINT fk_fabriquer_matprem
  FOREIGN KEY(id_matprem)
  REFERENCES matprem(id_matprem);

-- vendre
ALTER TABLE vendre
  ADD CONSTRAINT fk_vendre_produitfinis
  FOREIGN KEY(id_pf)
  REFERENCES produitfinis(id_pf);
ALTER TABLE vendre
  ADD CONSTRAINT fk_vendre_clients
  FOREIGN KEY(id_client)
  REFERENCES clients(id_client);
  
-- fideliser
ALTER TABLE fideliser
  ADD CONSTRAINT fk_fideliser_clients
  FOREIGN KEY(id_client)
  REFERENCES clients(id_client);
ALTER TABLE fideliser
  ADD CONSTRAINT fk_fideliser_commerciaux
  FOREIGN KEY(id_com)
  REFERENCES commerciaux(id_com);

-- promouvoir
ALTER TABLE promouvoir
  ADD CONSTRAINT fk_promouvoir_commerciaux
  FOREIGN KEY(id_com)
  REFERENCES commerciaux(id_com);
ALTER TABLE promouvoir
  ADD CONSTRAINT fk_promouvoir_produitfinis
  FOREIGN KEY(id_pf)
  REFERENCES produitfinis(id_pf);
