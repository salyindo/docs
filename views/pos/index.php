<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Caisse POS</title>
</head>
<body>

<h1>Caisse POS</h1>

<h2>Produits</h2>

<?php foreach ($produits as $produit): ?>

    <div>
        <strong><?= htmlspecialchars($produit['libelle']) ?></strong>
        <span><?= $produit['prix_vente'] ?> FCFA</span>
        <span>Stock : <?= $produit['quantite_stock'] ?></span>
    </div>

<?php endforeach; ?>

</body>
</html>