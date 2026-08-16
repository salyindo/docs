<?php

class ProduitRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::getInstance()->getConnection();
    }

    public function listerProduit(): array
    {
        $sql = "SELECT * FROM Produit";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProduitById(int $id): array|false
    {
        $sql = "SELECT * FROM Produit WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            ':id' => $id
        ]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function addProduit(Produit $produit): bool
    {
        $sql = "INSERT INTO Produit (
                    libelle,
                    prixVente,
                    stockInitial
                )
                VALUES (
                    :libelle,
                    :prixVente,
                    :stockInitial
                )";

        $stmt = $this->pdo->prepare($sql);

        return $stmt->execute([
            ':libelle' => $produit->getLibelle(),
            ':prixVente' => $produit->getPrixVente(),
            ':stockInitial' => $produit->getStockInitial()
        ]);
    }
}