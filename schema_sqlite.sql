CREATE TABLE Role (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE Utilisateur (
    id INTEGER PRIMARY KEY,
    nomComplet VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL,
    mot_passe INTEGER NOT NULL,
    adresse VARCHAR(255),
    tel VARCHAR(30),
    role_id INTEGER NOT NULL,
    FOREIGN KEY (role_id) REFERENCES Role(id)
);

CREATE TABLE Client (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    tel VARCHAR(30),
    limiteCredit NUMERIC(12,2) NOT NULL
);

CREATE TABLE Produit (
    id INTEGER PRIMARY KEY,
    libelle VARCHAR(150) NOT NULL,
    prixVente NUMERIC(12,2) NOT NULL,
    stockInitial INTEGER NOT NULL
);

CREATE TABLE Fournisseur (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150),
    tel VARCHAR(30),
    adresse VARCHAR(255)
);

CREATE TABLE StatutAppro (
    id INTEGER PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

CREATE TABLE ModePaiement (
    id INTEGER PRIMARY KEY,
    mode VARCHAR(100) NOT NULL
);

CREATE TABLE Commande (
    id INTEGER PRIMARY KEY,
    datCommande INTEGER NOT NULL,
    montantInitial INTEGER NOT NULL,
    avance NUMERIC(12,2) NOT NULL,
    client_id INTEGER NOT NULL,
    mode_paiement_id INTEGER NOT NULL,
    utilisateur_id INTEGER NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (mode_paiement_id) REFERENCES ModePaiement(id),
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateur(id)
);

CREATE TABLE LigneCommande (
    id INTEGER PRIMARY KEY,
    qteCommande INTEGER NOT NULL,
    prixReel NUMERIC(12,2) NOT NULL,
    commande_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    FOREIGN KEY (commande_id) REFERENCES Commande(id),
    FOREIGN KEY (produit_id) REFERENCES Produit(id)
);

CREATE TABLE Reglement (
    id INTEGER PRIMARY KEY,
    date DATE NOT NULL,
    montant NUMERIC(12,2) NOT NULL,
    commande_id INTEGER NOT NULL,
    FOREIGN KEY (commande_id) REFERENCES Commande(id)
);

CREATE TABLE Appro (
    id INTEGER PRIMARY KEY,
    refBl VARCHAR(100) NOT NULL,
    dateAppro DATE NOT NULL,
    fournisseur_id INTEGER NOT NULL,
    statut_appro_id INTEGER NOT NULL,
    utilisateur_id INTEGER NOT NULL,
    FOREIGN KEY (fournisseur_id) REFERENCES Fournisseur(id),
    FOREIGN KEY (statut_appro_id) REFERENCES StatutAppro(id),
    FOREIGN KEY (utilisateur_id) REFERENCES Utilisateur(id)
);

CREATE TABLE LigneAppro (
    id INTEGER PRIMARY KEY,
    qteAppro INTEGER NOT NULL,
    qteRecu INTEGER NOT NULL,
    prixReel NUMERIC(12,2) NOT NULL,
    appro_id INTEGER NOT NULL,
    produit_id INTEGER NOT NULL,
    FOREIGN KEY (appro_id) REFERENCES Appro(id),
    FOREIGN KEY (produit_id) REFERENCES Produit(id)
);
