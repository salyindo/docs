<?php

class Utilisateur
{
    private int $id;
    private string $nom;
    private string $prenom;
    private string $email;
    private string $motDePasse;
    private Role $roleId;

   

    public function getId(): int
    {
        return $this->id;
    }

  
}