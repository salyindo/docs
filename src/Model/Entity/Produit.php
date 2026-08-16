<?php

class Produit
{
    private int $id;
    private string $libelle;
    private float $prixVente;
    private int $stockInitial;
    private int $quantiteStock;

 

    public function getProduitById(): int
    {
        return $this->id;
    }

  
}