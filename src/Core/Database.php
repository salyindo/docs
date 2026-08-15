<?php

class Database
{
    private static ?Database $instance = null;

    private PDO $pdo;

    private function __construct()
    {
        try {

            $this->pdo = new PDO(
                "pgsql:host=localhost;port=5432;dbname=store_manager",
                "postgres",
                "Marou2002?"
            );

            $this->pdo->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );

        } catch (PDOException $e) {

            $this->pdo = new PDO(
                "sqlite:" . dirname(__DIR__, 2) . "/erp.db"
            );

            $this->pdo->setAttribute(
                PDO::ATTR_ERRMODE,
                PDO::ERRMODE_EXCEPTION
            );
        }
    }
public function getConnection(): PDO
{
    return $this->pdo;
}
    public static function getInstance(): Database
    {
        if (self::$instance === null) {
            self::$instance = new Database();
        }

        return self::$instance;
    }
}
