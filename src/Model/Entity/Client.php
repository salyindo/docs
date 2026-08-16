<?php

class Client
{
    private int $id;
    private string $nom;
    private string $prenom;
    private string $email;
    private string $tel;
    private float $limiteCredit;

   

    public function getId(): int
    {
        return $this->id;
    }

 
}