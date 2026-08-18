CREATE TABLE Role (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE Utilisateur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL,
    role_id INTEGER NOT NULL REFERENCES Role(id)
);

CREATE TABLE Client (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    tel VARCHAR(30),
    limite_credit NUMERIC(12,2) NOT NULL DEFAULT 0,

    CONSTRAINT chk_limite_credit
        CHECK (limite_credit >= 0)
);

CREATE TABLE Fournisseur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    tel VARCHAR(30),
    adresse VARCHAR(255)
);

CREATE TABLE Produit (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(150) NOT NULL,
    prix_vente NUMERIC(12,2) NOT NULL,
    stock_initial INTEGER NOT NULL DEFAULT 0,
    quantite_stock INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT chk_prix_vente
        CHECK (prix_vente >= 0),

    CONSTRAINT chk_stock_initial
        CHECK (stock_initial >= 0),

    CONSTRAINT chk_quantite_stock
        CHECK (quantite_stock >= 0)
);



CREATE TABLE ModePaiement (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE Commande (
    id SERIAL PRIMARY KEY,

    date_commande DATE NOT NULL DEFAULT CURRENT_DATE,

    montant_total NUMERIC(12,2) NOT NULL,

    avance NUMERIC(12,2) NOT NULL DEFAULT 0,

    client_id INTEGER NOT NULL
        REFERENCES Client(id),

    mode_paiement_id INTEGER NOT NULL
        REFERENCES ModePaiement(id),

    utilisateur_id INTEGER NOT NULL
        REFERENCES Utilisateur(id),

    CONSTRAINT chk_montant_total
        CHECK (montant_total >= 0),

    CONSTRAINT chk_montant_avance
        CHECK (avance >= 0 AND avance <= montant_total)
);




CREATE TABLE LigneCommande (
    id SERIAL PRIMARY KEY,

    quantite INTEGER NOT NULL,

    prix_unitaire NUMERIC(12,2) NOT NULL,

    commande_id INTEGER NOT NULL
        REFERENCES Commande(id)
        ON DELETE CASCADE,

    produit_id INTEGER NOT NULL
        REFERENCES Produit(id),

    CONSTRAINT chk_ligne_quantite
        CHECK (quantite > 0),

    CONSTRAINT chk_ligne_prix
        CHECK (prix_unitaire >= 0)
);
CREATE TABLE Dette (
    id SERIAL PRIMARY KEY,

    montant_initial NUMERIC(12,2) NOT NULL,

    montant_restant NUMERIC(12,2) NOT NULL,

    date_creation DATE NOT NULL DEFAULT CURRENT_DATE,

    date_echeance DATE,

    statut VARCHAR(30) NOT NULL,

    commande_id INTEGER NOT NULL UNIQUE
        REFERENCES Commande(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_dette_montant_initial
        CHECK (montant_initial >= 0),

    CONSTRAINT chk_dette_montant_restant
        CHECK (montant_restant >= 0),

    CONSTRAINT chk_dette_restant
        CHECK (montant_restant <= montant_initial)
);
CREATE TABLE Reglement (
    id SERIAL PRIMARY KEY,

    montant NUMERIC(12,2) NOT NULL,

    date_reglement DATE NOT NULL DEFAULT CURRENT_DATE,

    dette_id INTEGER NOT NULL
        REFERENCES Dette(id)
        ON DELETE CASCADE,

    CONSTRAINT chk_reglement_montant
        CHECK (montant > 0)
);
CREATE TABLE Approvisionnement (
    id SERIAL PRIMARY KEY,

    date_approvisionnement DATE NOT NULL DEFAULT CURRENT_DATE,

    fournisseur_id INTEGER NOT NULL
        REFERENCES Fournisseur(id),

    utilisateur_id INTEGER NOT NULL
        REFERENCES Utilisateur(id)
);
CREATE TABLE LigneApprovisionnement (
    id SERIAL PRIMARY KEY,

    quantite INTEGER NOT NULL,

    prix_achat NUMERIC(12,2) NOT NULL,

    approvisionnement_id INTEGER NOT NULL
        REFERENCES Approvisionnement(id)
        ON DELETE CASCADE,

    produit_id INTEGER NOT NULL
        REFERENCES Produit(id),

    CONSTRAINT chk_ligne_appro_quantite
        CHECK (quantite > 0),

    CONSTRAINT chk_ligne_prix_achat
        CHECK (prix_achat >= 0)
);








INSERT INTO Role (nom)
VALUES
('Admin'),
('Vente'),
('Stock'),
('Inventaire');


SELECT * FROM Role;





INSERT INTO Utilisateur
(nom, prenom, email, mot_de_passe, role_id)
VALUES
('Faye', 'Saly', 'admin@storemanager.com', '123456', 1),
('Diop', 'Moussa', 'vente@storemanager.com', '123456', 2),
('Ndiaye', 'Awa', 'stock@storemanager.com', '123456', 3),
('Fall', 'Oumar', 'inventaire@storemanager.com', '123456', 4);



INSERT INTO ModePaiement (libelle)
VALUES
('Especes'),
('Wave'),
('Orange Money'),
('Carte bancaire');



SELECT * FROM Utilisateur;
SELECT * FROM ModePaiement;
SELECT * FROM Produit ;
INSERT INTO Produit (libelle, prix_vente, stock_initial, quantite_stock)
VALUES
('Ordinateur portable HP', 450000.00, 10, 10),
('Souris sans fil', 15000.00, 30, 30),
('Clavier USB', 12000.00, 25, 25),
('Écran Samsung 24 pouces', 120000.00, 15, 15),
('Imprimante Canon', 95000.00, 8, 8);


INSERT INTO Commande (
    date_commande,
    montant_total,
    avance,
    client_id,
    mode_paiement_id,
    utilisateur_id
)
VALUES
('2026-08-10', 480000.00, 200000.00, 1, 1, 1),
('2026-08-11', 135000.00, 135000.00, 2, 2, 2),
('2026-08-12', 107000.00, 50000.00, 3, 1, 3),
('2026-08-13', 215000.00, 100000.00, 4, 3, 4),
('2026-08-14', 95000.00, 0.00, 5, 1, 3);


INSERT INTO Client (
    nom,
    prenom,
    email,
    tel,
    limite_credit
)
VALUES
('Diop', 'Moussa', 'moussa.diop@gmail.com', '771234567', 500000.00),
('Fall', 'Awa', 'awa.fall@gmail.com', '781234568', 300000.00),
('Ndiaye', 'Ibrahima', 'ibrahima.ndiaye@gmail.com', '761234569', 250000.00),
('Ba', 'Fatou', 'fatou.ba@gmail.com', '701234570', 400000.00),
('Sow', 'Oumar', 'oumar.sow@gmail.com', '751234571', 200000.00);
SELECT * FROM Client;
SELECT * FROM Commande;
SELECT * FROM Produit;


INSERT INTO Fournisseur (
    nom,
    adresse
)
VALUES
('Tech Distribution', '771112233', 'Dakar, Sénégal'),
('Senegal Informatique', '781223344', 'Parcelles Assainies, Dakar'),
('Global Office', '761334455', 'Pikine, Dakar'),
('Digital Supply', '701445566', 'Almadies, Dakar'),
('Africa Computer', '751556677', 'Plateau, Dakar');

SELECT * FROM Fournisseur;
SELECT * FROM Dette;


INSERT INTO LigneCommande (
    quantite,
    prix_unitaire,
    commande_id,
    produit_id
)
VALUES

(1, 450000.00, 1, 1),
(2, 15000.00, 2, 2),
(3, 12000.00, 3, 3);


SELECT
    commande_id,
    SUM(quantite * prix_unitaire) AS total_lignes
FROM LigneCommande
GROUP BY commande_id
ORDER BY commande_id;

SELECT id FROM Commande ORDER BY id;



INSERT INTO Dette (
    montant_initial,
    montant_restant,
    date_creation,
    date_echeance,
    statut,
    commande_id
)
VALUES
(
    280000.00,
    280000.00,
    '2026-08-10',
    '2026-09-10',
    'EN_COURS',
    1
),
(
    57000.00,
    57000.00,
    '2026-08-12',
    '2026-09-12',
    'EN_COURS',
    3
),
(
    115000.00,
    115000.00,
    '2026-08-13',
    '2026-09-13',
    'EN_COURS',
    4
);




INSERT INTO Reglement (
    montant,
    date_reglement,
    dette_id
)
VALUES
(20000.00, '2026-08-13', 1),
(25000.00, '2026-08-14', 2),
(50000.00, '2026-08-15', 3);


SELECT * FROM Dette ORDER BY id;

SELECT * FROM Reglement ORDER BY id;
INSERT INTO Approvisionnement (
    date_approvisionnement,
    fournisseur_id,
    utilisateur_id
)
VALUES
('2026-08-10', 1, 1),
('2026-08-12', 2, 2),
('2026-08-15', 3, 3);



INSERT INTO LigneApprovisionnement (
    quantite,
    prix_achat,
    approvisionnement_id,
    produit_id
)
VALUES
(20, 5000.00, 1, 1),
(15, 7500.00, 1, 2),
(30, 3000.00, 2, 3);


SELECT * FROM Reglement;

SELECT * FROM Approvisionnement;

SELECT * FROM LigneApprovisionnement;





SELECT
    c.id,
    c.date_commande,
    cl.nom,
    cl.prenom,
    c.montant_total,
    c.avance,
    mp.libelle AS mode_paiement,
    u.nom AS utilisateur
FROM Commande c
INNER JOIN Client cl
    ON c.client_id = cl.id
INNER JOIN ModePaiement mp
    ON c.mode_paiement_id = mp.id
INNER JOIN Utilisateur u
    ON c.utilisateur_id = u.id;


    SELECT
    d.id AS dette_id,
    d.montant_initial,
    d.montant_restant,
    d.date_creation,
    d.date_echeance,
    d.statut,
    c.id AS commande_id,
    c.montant_total,
    cl.nom,
    cl.prenom
FROM Dette d
INNER JOIN Commande c
    ON d.commande_id = c.id
INNER JOIN Client cl
    ON c.client_id = cl.id;



    SELECT
    r.id AS reglement_id,
    r.montant,
    r.date_reglement,
    d.id AS dette_id,
    d.montant_initial,
    d.montant_restant
FROM Reglement r
INNER JOIN Dette d
    ON r.dette_id = d.id;



    SELECT
    r.id AS reglement_id,
    r.montant AS montant_reglement,
    r.date_reglement,

    d.id AS dette_id,
    d.montant_initial,
    d.montant_restant,
    d.statut,

    c.id AS commande_id,
    c.montant_total,

    cl.nom,
    cl.prenom

FROM Reglement r

INNER JOIN Dette d
    ON r.dette_id = d.id

INNER JOIN Commande c
    ON d.commande_id = c.id

INNER JOIN Client cl
    ON c.client_id = cl.id

ORDER BY r.date_reglement;