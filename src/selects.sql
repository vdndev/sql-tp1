USE sport;

SELECT id_equipe, nom_equipe, id_equipe1, id_equipe2 FROM equipes, participer WHERE id_equipe1 = id_equipe OR id_equipe2 = id_equipe;