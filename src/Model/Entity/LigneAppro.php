<?php

class LigneApprovisionnement
{
    private int $id;
    private int $quantite;
    private float $prixAchat;
    private Approvisionnement $approvisionnementId;
    private Produit $produitId;

   
    public function getId(): int
    {
        return $this->id;
    }

}