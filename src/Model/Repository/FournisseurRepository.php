<?php


class FournisseurRepository{


    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::getInstance()->getConnection();
    }

    public function listerFournisseur(): array
    {
        $sql = "SELECT * FROM Fournisseur";
        $statement = $this->pdo->query($sql);

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getFournisseurtById(int $id): array|false
{
   
    $sql = "SELECT * FROM fournisseur WHERE id = :id";

    $stmt = $this->pdo->prepare($sql);

    $stmt->execute([
        ':id' => $id
    ]);

    return $stmt->fetch();
}


}