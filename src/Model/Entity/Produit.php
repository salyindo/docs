<?php

class Produit
{
    private int $id;
    private string $libelle;
    private float $prixVente;
    private int $stockInitial;

    public function __construct(
        int $id,
        string $libelle,
        float $prixVente,
        int $stockInitial
    ) {
        $this->id = $id;
        $this->libelle = $libelle;
        $this->prixVente = $prixVente;
        $this->stockInitial = $stockInitial;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getLibelle(): string
    {
        return $this->libelle;
    }

    public function getPrixVente(): float
    {
        return $this->prixVente;
    }

    public function getStockInitial(): int
    {
        return $this->stockInitial;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setLibelle(string $libelle): void
    {
        $this->libelle = $libelle;
    }

    public function setPrixVente(float $prixVente): void
    {
        $this->prixVente = $prixVente;
    }

    public function setStockInitial(int $stockInitial): void
    {
        $this->stockInitial = $stockInitial;
    }
}
  
   