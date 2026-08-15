<?php

class Commande
{
    private int $id;
    private int $datCommande;
    private int $montantInitial;
    private float $avance;

    public function __construct(
        int $id,
        int $datCommande,
        int $montantInitial,
        float $avance
    ) {
        $this->id = $id;
        $this->datCommande = $datCommande;
        $this->montantInitial = $montantInitial;
        $this->avance = $avance;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getDatCommande(): int
    {
        return $this->datCommande;
    }

    public function getMontantInitial(): int
    {
        return $this->montantInitial;
    }

    public function getAvance(): float
    {
        return $this->avance;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setDatCommande(int $datCommande): void
    {
        $this->datCommande = $datCommande;
    }

    public function setMontantInitial(int $montantInitial): void
    {
        $this->montantInitial = $montantInitial;
    }

    public function setAvance(float $avance): void
    {
        $this->avance = $avance;
    }
}