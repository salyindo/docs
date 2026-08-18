<?php

class FournisseurRepository
{
    private static PDO $pdo;

    public static function init(): void
    {
        self::$pdo = Database::getInstance()->getConnection();
    }

    public static function listerFournisseur(): array
    {
        $sql = "SELECT * FROM Fournisseur";

        $stmt = self::$pdo->prepare($sql);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public static function getFournisseurById(int $id): array|false
    {
        $sql = "SELECT * FROM Fournisseur WHERE id = :id";

        $stmt = self::$pdo->prepare($sql);

        $stmt->execute([
            ':id' => $id
        ]);

        return $stmt->fetch(PDO::FETCH_ASSOC);
    }
}