USE sport;

INSERT INTO postes(nom_poste) VALUES
('Meneur'),
('Arriere'),
('Ailier'),
('Ailier Fort'),
('Pivot');

INSERT INTO phases(nom_phase) VALUES
('Quart de Finale'),
('Demi Finale'),
('Finale');

INSERT INTO stades(nom_stade, num_rue_stade, nom_rue_stade, cp_stade, ville_stade) VALUES
('Salle de la Mailleraie', 0, 'Av Marcel Prat', 49300, 'Cholet'),
('Halle Carpentier', 1, 'Bld Masséna', 75013, 'Paris'),
('Le Chaudron', 1, 'Rue Charles Lamarre', 62480, 'Le Portel');

INSERT INTO competitions(nom_competition, date_competition) VALUES
('Espoirs Elites', '2022-07-01'),
('Pro B', '2024-07-22'),
('Pro', '2022-06-08');

INSERT INTO equipes(nom_equipe) VALUES
('Cholet Basket'),
('Paris Basketball'),
('Boulogne levallois metropolitans 92'),
('SASP JDA Dijon Basket');

INSERT INTO joueurs(nom_joueur, prenom_joueur, age_joueur, id_poste, id_equipe) VALUES
('Tony', 'Parker', 35, 1, 2),
('Kim', 'Tillie', 33, 4, 1),
('Boris', 'Dallo', 28, 2, 1);

INSERT INTO matches(date_match, id_competition, id_stade, id_phase) VALUES
('2022-12-17', 1, 1, 1),
('2022-12-17', 1, 2, 2),
('2022-10-29', 1, 2, 3);

INSERT INTO participer(id_equipe1, id_equipe2, id_match, score_equipe1, score_equipe2) VALUES
(1, 4, 1, 75, 69),
(2, 3, 2, 92, 86),
(2, 1, 3, 65, 118);
