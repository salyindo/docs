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
        $result=query($pdo,$sql,false);
        return $result;
       
    }

    public function getClientById(int $id): array|false
    {
        $sql = "SELECT * FROM Client WHERE id = :id";

        $stmt = $this->pdo->prepare($sql);

        $stmt->execute([
            ':id' => $id
        ]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}