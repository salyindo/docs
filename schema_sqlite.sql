

DROP TABLE IF EXISTS LigneApprovisionnement;
DROP TABLE IF EXISTS Approvisionnement;
DROP TABLE IF EXISTS Reglement;
DROP TABLE IF EXISTS Dette;
DROP TABLE IF EXISTS LigneCommande;
DROP TABLE IF EXISTS Commande;
DROP TABLE IF EXISTS ModePaiement;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Fournisseur;
DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS Utilisateur;
DROP TABLE IF EXISTS Role;


CREATE TABLE Role (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL
);


CREATE TABLE Utilisateur (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    mot_de_passe TEXT NOT NULL,
    role_id INTEGER NOT NULL,

    FOREIGN KEY (role_id)
        REFERENCES Role(id)
);


CREATE TABLE Client (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    prenom TEXT NOT NULL,
    email TEXT,
    tel TEXT,
    limite_credit NUMERIC NOT NULL DEFAULT 0,

    CHECK (limite_credit >= 0)
);


CREATE TABLE Fournisseur (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom TEXT NOT NULL,
    tel TEXT,
    adresse TEXT
);


CREATE TABLE Produit (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    libelle TEXT NOT NULL,
    prix_vente NUMERIC NOT NULL,
    stock_initial INTEGER NOT NULL DEFAULT 0,
    quantite_stock INTEGER NOT NULL DEFAULT 0,

    CHECK (prix_vente >= 0),
    CHECK (stock_initial >= 0),
    CHECK (quantite_stock >= 0)
);


CREATE TABLE ModePaiement (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    libelle TEXT NOT NULL UNIQUE
);


CREATE TABLE Commande (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    date_commande TEXT NOT NULL DEFAULT CURRENT_DATE,

    montant_total NUMERIC NOT NULL,

    avance NUMERIC NOT NULL DEFAULT 0,

    client_id INTEGER NOT NULL,

    mode_paiement_id INTEGER NOT NULL,

    utilisateur_id INTEGER NOT NULL,

    CHECK (montant_total >= 0),

    CHECK (
        avance >= 0
        AND avance <= montant_total
    ),

    FOREIGN KEY (client_id)
        REFERENCES Client(id),

    FOREIGN KEY (mode_paiement_id)
        REFERENCES ModePaiement(id),

    FOREIGN KEY (utilisateur_id)
        REFERENCES Utilisateur(id)
);


CREATE TABLE LigneCommande (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    quantite INTEGER NOT NULL,

    prix_unitaire NUMERIC NOT NULL,

    commande_id INTEGER NOT NULL,

    produit_id INTEGER NOT NULL,

    CHECK (quantite > 0),

    CHECK (prix_unitaire >= 0),

    FOREIGN KEY (commande_id)
        REFERENCES Commande(id)
        ON DELETE CASCADE,

    FOREIGN KEY (produit_id)
        REFERENCES Produit(id)
);


CREATE TABLE Dette (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    montant_initial NUMERIC NOT NULL,

    montant_restant NUMERIC NOT NULL,

    date_creation TEXT NOT NULL DEFAULT CURRENT_DATE,

    date_echeance TEXT,

    statut TEXT NOT NULL,

    commande_id INTEGER NOT NULL UNIQUE,

    CHECK (montant_initial >= 0),

    CHECK (montant_restant >= 0),

    CHECK (montant_restant <= montant_initial),

    FOREIGN KEY (commande_id)
        REFERENCES Commande(id)
        ON DELETE CASCADE
);


CREATE TABLE Reglement (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    montant NUMERIC NOT NULL,

    date_reglement TEXT NOT NULL DEFAULT CURRENT_DATE,

    dette_id INTEGER NOT NULL,

    CHECK (montant > 0),

    FOREIGN KEY (dette_id)
        REFERENCES Dette(id)
        ON DELETE CASCADE
);


CREATE TABLE Approvisionnement (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    date_approvisionnement TEXT NOT NULL DEFAULT CURRENT_DATE,

    fournisseur_id INTEGER NOT NULL,

    utilisateur_id INTEGER NOT NULL,

    FOREIGN KEY (fournisseur_id)
        REFERENCES Fournisseur(id),

    FOREIGN KEY (utilisateur_id)
        REFERENCES Utilisateur(id)
);


CREATE TABLE LigneApprovisionnement (
    id INTEGER PRIMARY KEY AUTOINCREMENT,

    quantite INTEGER NOT NULL,

    prix_achat NUMERIC NOT NULL,

    approvisionnement_id INTEGER NOT NULL,

    produit_id INTEGER NOT NULL,

    CHECK (quantite > 0),

    CHECK (prix_achat >= 0),

    FOREIGN KEY (approvisionnement_id)
        REFERENCES Approvisionnement(id)
        ON DELETE CASCADE,

    FOREIGN KEY (produit_id)
        REFERENCES Produit(id)
);