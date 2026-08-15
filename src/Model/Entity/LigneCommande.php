<?php

class LigneCommande
{
    private int $id;
    private int $qteCommande;
    private float $prixReel;

    public function __construct(
        int $id,
        int $qteCommande,
        float $prixReel
    ) {
        $this->id = $id;
        $this->qteCommande = $qteCommande;
        $this->prixReel = $prixReel;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getQteCommande(): int
    {
        return $this->qteCommande;
    }

    public function getPrixReel(): float
    {
        return $this->prixReel;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setQteCommande(int $qteCommande): void
    {
        $this->qteCommande = $qteCommande;
    }

    public function setPrixReel(float $prixReel): void
    {
        $this->prixReel = $prixReel;
    }
}