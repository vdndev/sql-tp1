USE societe;

-- ---------------------------------------------------------
-- ECRIRE LES REQUETES QUI PERMETTRONT DE CREER DES ENREGISTREMENTS DANS CHACUNE DES TABLES
-- ---------------------------------------------------------
INSERT INTO droit(nom_droit) VALUES
('administrateur'),
('manager'),
('employe');

INSERT INTO typepf(nom_type_pf) VALUES
('Pain'),
('Viennoiserie'),
('Gateaux');

INSERT INTO utilisateur(login_util, mot_pass_util, id_droit) VALUES
('admin', 'a5b6c7', 1),
('mvdn', 'f001', 3);

INSERT INTO fournisseur(nom_fourn, tel_fourn, adr_num_fourn, adr_rue_fourn, adr_cp_fourn, adr_ville_fourn, adr_pays_fourn) VALUES
('Biocer', '0232678131', 240, 'chemin de la fôret', '27180', 'Le Plessis-Grohan', 'France'),
('Lactel', '0243594259', 10, 'rue Adolphe Beck', '53089', 'Laval', 'France');

INSERT INTO matprem(nom_mat, prix_achat, qte_stk) VALUES
('Farine T80', 0.90, 2000),
('Farine T100', 0.70, 2500),
('Lait', 0.25, 200),
('Beurre', 2.10, 400),
('Barre Chocolat', 0.30, 800);

INSERT INTO produitfinis(nom_pf, prix_vente_pf, qte_stk, id_type_pf) VALUES
('Baguette', 0.90, 60, 1),
('Flute', 1.10, 58, 1),
('Croissant', 0.75, 270, 2),
('Chocolatine', 0.85, 300, 2),
('Opera', 25.80, 30, 3),
('Tarte aux pommes', 16.70, 20, 3);

INSERT INTO commerciaux(nom_com, prenom_com, tel_com) VALUES
('Dupont', 'Gerard', '0011223344'),
('Durand', 'Patrick', '9988776655');

INSERT INTO client(nom_cli, tel_cli, adr_num_cli, adr_rue_cli, adr_cp_cli, adr_ville_cli, adr_pays_cli) VALUES
('E.Leclerc', '0562615610', 0, 'Lieu Dit Clarac', '32000', 'Auch', 'France');

INSERT INTO acheter(id_fourn, id_matprem) VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);

INSERT INTO fabriquer(id_pf, id_matprem) VALUES
(4, 1),
(4, 4),
(4, 5);

INSERT INTO vendre(id_client, id_pf) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6);

INSERT INTO fideliser(id_client, id_com, chiffre_affaire) VALUES
(1, 1, 10000.0);

INSERT INTO promouvoir(id_com, id_pf) VALUES
(1, 1),
(2, 4);
