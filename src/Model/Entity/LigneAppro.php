<?php

class LigneAppro
{
    private int $id;
    private int $qteAppro;
    private int $qteRecu;
    private float $prixReel;

    public function __construct(
        int $id,
        int $qteAppro,
        int $qteRecu,
        float $prixReel
    ) {
        $this->id = $id;
        $this->qteAppro = $qteAppro;
        $this->qteRecu = $qteRecu;
        $this->prixReel = $prixReel;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getQteAppro(): int
    {
        return $this->qteAppro;
    }

    public function getQteRecu(): int
    {
        return $this->qteRecu;
    }

    public function getPrixReel(): float
    {
        return $this->prixReel;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setQteAppro(int $qteAppro): void
    {
        $this->qteAppro = $qteAppro;
    }

    public function setQteRecu(int $qteRecu): void
    {
        $this->qteRecu = $qteRecu;
    }

    public function setPrixReel(float $prixReel): void
    {
        $this->prixReel = $prixReel;
    }
}