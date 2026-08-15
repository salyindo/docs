<?php


class ClientRepository
{
    private PDO $pdo;

    public function __construct()
    {
        $this->pdo = Database::getInstance()->getConnection();
    }

    public function getAllClient(): array
    {
        $sql = "SELECT * FROM Client";

        $statement = $this->pdo->query($sql);

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getClientById(int $id):
{
   
    $sql = "SELECT * FROM Client WHERE id = :id";

    $stmt = $this->pdo->prepare($sql);

    $stmt->execute([
        ':id' => $id
    ]);

    return $stmt->fetch();
}



}