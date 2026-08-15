# 📓 Journal de Développement (DEVLOG)
**Nom & Prénom** : Saly Faye
**Projet** : StoreManager Pro (ERP PHP/POO) 




## 1. Suivi Chronologique des Phases

### 🌃 [Vendredi - Phase 1] : Conception & BDD Fallback
- **Heure de réalisation** :  (19h00 - 20h30)
- **Ce qui a été fait** : determiner les Usecases principale et secondaire puis  donner les relations on a fait de memes pour les diagramme de classe
- **Difficultés / Obstacles** : 





### 📌 Step 1.2 — Schéma BDD

- **Heure de réalisation** : 20h30 - 22h00

- **Ce qui a été fait** :
  Création des fichiers `schema.sql` pour PostgreSQL et
  `schema_sqlite.sql` pour SQLite.

  Les deux scripts contiennent les tables du projet :
  `Role`, `Utilisateur`, `Client`, `Produit`, `Fournisseur`,
  `StatutAppro`, `ModePaiement`, `Commande`, `LigneCommande`,
  `Reglement`, `Appro` et `LigneAppro`.

  Les relations entre les tables ont été définies avec des clés
  étrangères (FK).

  Le fichier `schema.sql` a été testé avec PostgreSQL et le fichier
  `schema_sqlite.sql` a été testé avec SQLite. Les tables ont été
  créées correctement dans les deux systèmes.

- **Difficultés / Obstacles** :
  Au début, je ne comprenais pas bien le concept des deux fichiers
  `schema.sql` et `schema_sqlite.sql`, ni la différence entre
  PostgreSQL et SQLite. 
  Pour SQLite, la commande `sqlite3` n'était pas installée au
  départ. Je l'ai installée avant de tester le script.




  ### Step 1.3 — Database Singleton & Fallback

- **Heure de réalisation** : [22h 23h]

- **Ce qui a été fait** :
  Création de la classe `Database` dans `src/Core/Database.php`.
  Mise en place du pattern Singleton afin d'avoir une seule instance
  de la classe `Database`.


- **Difficultés / Obstacles** :
Au début, je n'avais pas bien compris le principe du Single.




### ☀️ Step 2.1 — Entités POO

- **Heure de réalisation** : [9h 11h]


- **Ce qui a été fait** :

J'ai créé les différentes classes du dossier `src/Model/Entity` à partir du diagramme de classes UML.

Chaque classe contient :
- des attributs `private` pour protéger les données ;
- un constructeur pour initialiser les attributs ;
- des getters pour lire les attributs ;
- des setters pour modifier les attributs.

J'ai également compris que les getters et setters sont des méthodes permettant de contrôler l'accès aux attributs privés d'un objet.

Classes créées :
- Produit
- Client
- Commande
- LigneCommande
- Fournisseur
- Appro
- LigneAppro
- Reglement
- Utilisateur
- Role
- StatutAppro
- ModePaiement


- **Difficultés / Obstacles** :
Au début, j'avais déclaré les attributs des classes en `public`.
Cela permettait d'accéder directement aux données depuis l'extérieur
de la classe.

En étudiant le principe d'encapsulation, j'ai compris que cette
approche n'était pas adaptée à la conception POO demandée.

J'ai donc remplacé les attributs `public` par des attributs `private`
afin de protéger les données de l'objet.




#### 📌 Step 2.2 (11h00 - 13h00) : Repositories & SQL Sécurisé
- **Livrable** : `ProduitRepository.php`, `ClientRepository.php`, `FournisseurRepository.php`.
- **Commit Git à exécuter** :
  ```bash
  git commit -m "feat(repository): mise en place des classes Repository avec requetes preparees PDO"