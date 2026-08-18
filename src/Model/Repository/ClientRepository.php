<?php
class ClientRepository
{
    private static PDO $pdo;

    public static function init(): void
    {
        self::$pdo = Database::getInstance()->getConnection();
    }

    public static function getAllClient(): array
    {
        $sql = "SELECT * FROM Client";

        $statement = self::$pdo->query($sql);

        return $statement->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getClientById(int $id): array|false
    {
        $sql = "SELECT * FROM Client WHERE id = :id";

        $stmt = self::$pdo->prepare($sql);

        $stmt->execute([
            ':id' => $id
        ]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}