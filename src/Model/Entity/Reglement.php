<?php

class Reglement
{
    private int $id;
    private float $montant;
    private Date $dateReglement;
    private Dette $detteId;


    public function getId(): int
    {
        return $this->id;
    }

  
 
}