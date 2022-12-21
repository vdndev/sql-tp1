USE societe;

-- DANS LE TABLE CLIENT CREER DEUX CLIENTS QUI ONT LE MEME NOM
INSERT INTO clients(nom_cli, tel_cli, adr_num_cli, adr_rue_cli, adr_cp_cli, adr_ville_cli, adr_pays_cli) VALUES
('Lidl', '0562615610', 0, 'Lieu Dit Clarac', '32000', 'Auch', 'France'),
('Lidl', '0562615610', 0, 'Lieu Dit Clarac', '32000', 'Auch', 'France');

-- DANS LA TABLE COMMERCIAUX CREER DES COMMERCIAUX DONT LE NOM COMMENCE PAR A, C, L, M, P
INSERT INTO commerciaux(nom_com, prenom_com, tel_com) VALUES
('Carrera', 'Alain', '0307826454'),
('Lambert', 'Christophe', '0789326519'),
('Arcangel', 'Helena', '0678230918'),
('Miyagawa', 'Natsuki', '0587639825'),
('Porter', 'James', '0109832746');

-- DANS LA TABLE PRODUIT CREER DES PRODUITS SANS TYPE
-- INSERT INTO produitfinis(nom_pf, prix_vente_pf, qte_stk) VALUES ('Pain au cereales', 1.20, 50), ('Pain au raisins', 1.10, 80);
-- Erreur

-- CREER DEUX FOURNISSEURS QUI VIENNENT D’ARRIVER (L’ENTREPRISE LEUR AURA DONC RIEN ACHETE A CES FOURNISSEURS)
INSERT INTO fournisseur(nom_fourn, tel_fourn, adr_num_fourn, adr_rue_fourn, adr_cp_fourn, adr_ville_fourn, adr_pays_fourn) VALUES
('Sanofruit', '0475931131', 0, 'La Croix de Raspail', '07200', 'Lachapelle-sous-aubenas', 'France'),
('La baleine', '0175617800', 92, 'Boulevard Victor Hugo', '92115', 'Clichy', 'France');

-- CREER DEUX NOUVELLES MATIERES PREMIERES (L’ENTREPRISE N’EN A DONC JAMAIS ACHETE)
INSERT INTO matprem(nom_mat, prix_achat, qte_stk) VALUES
('Sel', 0.60, 0),
('Pomme', 0.80, 0);

-- CREER DEUX FOURNISSEURS A QUI NOUS AVONS DEJA ACHETE UNE MATIERE PREMIERE
INSERT INTO fournisseur(nom_fourn, tel_fourn, adr_num_fourn, adr_rue_fourn, adr_cp_fourn, adr_ville_fourn, adr_pays_fourn) VALUES
('Cemoi', '0557355300', 13, 'rue 2 Esteys', '33130', 'Bègles', 'France'),
('Tereos Sucre', '0256349867', 0, 'Route de Paris', '45410', 'Artenay', 'France');
INSERT INTO acheter(id_fourn, id_matprem) VALUES
(5, 5),
(6, 6);

-- CREER DEUX MATIERES PREMIERES QUI ONT DEJA ETE ACHETEES
INSERT INTO matprem(nom_mat, prix_achat, qte_stk) VALUES
('Pommes', 1.0, 250),
('Pepites de chocolat', 0.70, 500);
INSERT INTO acheter(id_fourn, id_matprem) VALUES
(3, 8),
(5, 9);

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS TYPEPF
DELETE FROM typepf
  WHERE nom_type_pf='Gateaux';

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS TYPEPF QUI EST UTILISE DANS PRODUITFINIS

-- ECRIRE UNE REQUETE QUI PERMETTRA DE SUPPRIMER UN ENREGISTREMENT DANS FIDELISER
DELETE FROM fideliser
  WHERE id_client = 1 AND id_com = 1;

-- ECRIRE UNE REQUETE QUI PERMETTRA DE CHANGER LE NOM D’UN CLIENT
UPDATE clients
  SET nom_cli = 'Edouard Leclerc'
  WHERE id_client = 1;

-- ECRIRE UNE REQUETE QUI PERMETTRA DE RAJOUTER 20000 AU CHIFFRE D ’AFFAIRE D ’UN COMMERCIAL POUR UN CLIENT (VOUS AVEZ LE CHOIX DU CLIENT ET COMMERCIAL)
UPDATE fideliser
  SET chiffre_affaire = chiffre_affaire + 20000
  WHERE id_client = 1
  AND id_com = 1;