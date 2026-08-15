CREATE TABLE Role (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE Utilisateur (
    id SERIAL PRIMARY KEY,
    nomComplet VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    mot_passe INTEGER NOT NULL,
    adresse VARCHAR(255),
    tel VARCHAR(30),
    role_id INTEGER NOT NULL REFERENCES Role(id)
);

CREATE TABLE Client (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    tel VARCHAR(30),
    limiteCredit NUMERIC(12,2) NOT NULL
);

CREATE TABLE Produit (
    id SERIAL PRIMARY KEY,
    libelle VARCHAR(150) NOT NULL,
    prixVente NUMERIC(12,2) NOT NULL,
    stockInitial INTEGER NOT NULL
);

CREATE TABLE Fournisseur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    tel VARCHAR(30),
    adresse VARCHAR(255)
);

CREATE TABLE StatutAppro (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE ModePaiement (
    id SERIAL PRIMARY KEY,
    mode VARCHAR(100) NOT NULL
);

CREATE TABLE Commande (
    id SERIAL PRIMARY KEY,
    datCommande INTEGER NOT NULL,
    montantInitial INTEGER NOT NULL,
    avance NUMERIC(12,2) NOT NULL,
    client_id INTEGER NOT NULL REFERENCES Client(id),
    mode_paiement_id INTEGER NOT NULL REFERENCES ModePaiement(id),
    utilisateur_id INTEGER NOT NULL REFERENCES Utilisateur(id)
);

CREATE TABLE LigneCommande (
    id SERIAL PRIMARY KEY,
    qteCommande INTEGER NOT NULL,
    prixReel NUMERIC(12,2) NOT NULL,
    commande_id INTEGER NOT NULL REFERENCES Commande(id),
    produit_id INTEGER NOT NULL REFERENCES Produit(id)
);

CREATE TABLE Reglement (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    montant NUMERIC(12,2) NOT NULL,
    commande_id INTEGER NOT NULL REFERENCES Commande(id)
);

CREATE TABLE Appro (
    id SERIAL PRIMARY KEY,
    refBl VARCHAR(100) NOT NULL,
    dateAppro DATE NOT NULL,
    fournisseur_id INTEGER NOT NULL REFERENCES Fournisseur(id),
    statut_appro_id INTEGER NOT NULL REFERENCES StatutAppro(id),
    utilisateur_id INTEGER NOT NULL REFERENCES Utilisateur(id)
);

CREATE TABLE LigneAppro (
    id SERIAL PRIMARY KEY,
    qteAppro INTEGER NOT NULL,
    qteRecu INTEGER NOT NULL,
    prixReel NUMERIC(12,2) NOT NULL,
    appro_id INTEGER NOT NULL REFERENCES Appro(id),
    produit_id INTEGER NOT NULL REFERENCES Produit(id)
);

