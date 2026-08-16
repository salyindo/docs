<?php

class LigneCommande
{
    private int $id;
    private int $quantite;
    private float $prixUnitaire;
    private Commande $commandeId;
    private Produit $produitId;

   
    public function getId(): int
    {
        return $this->id;
    }

   }