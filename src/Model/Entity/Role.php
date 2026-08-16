<?php

class Role
{
    private int $id;
    private string $nom;

 
    public function getNomRole(): int
    {
        return $this->nom;
    }

}