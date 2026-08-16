<?php

require_once "src/Core/Database.php";

try {

    $pdo = Database::getInstance()->getConnection();

    echo "Connexion à la base réussie !<br>";

    $sql = "SELECT name FROM sqlite_master WHERE type='table'";

    $stmt = $pdo->query($sql);

    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);

    echo "<pre>";
    print_r($tables);
    echo "</pre>";

} catch (PDOException $e) {

    echo "Erreur : " . $e->getMessage();
}