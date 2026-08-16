<?php

class Fournisseur
{
    private int $id;
    private string $nom;
    private string $tel;
    private string $adresse;


    public function getNomFournisseur(): int
    {
        return $this->nom;
    }

    
}