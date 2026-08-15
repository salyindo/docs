<?php

class Reglement
{
    private int $id;
    private DateTime $date;
    private float $montant;

    public function __construct(
        int $id,
        DateTime $date,
        float $montant
    ) {
        $this->id = $id;
        $this->date = $date;
        $this->montant = $montant;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getDate(): DateTime
    {
        return $this->date;
    }

    public function getMontant(): float
    {
        return $this->montant;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setDate(DateTime $date): void
    {
        $this->date = $date;
    }

    public function setMontant(float $montant): void
    {
        $this->montant = $montant;
    }
}