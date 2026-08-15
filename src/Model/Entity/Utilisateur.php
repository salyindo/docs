<?php

class Utilisateur
{
    private int $id;
    private string $nomComplet;
    private string $email;
    private int $mot_passe;
    private string $adresse;
    private string $tel;

    public function __construct(
        int $id,
        string $nomComplet,
        string $email,
        int $mot_passe,
        string $adresse,
        string $tel
    ) {
        $this->id = $id;
        $this->nomComplet = $nomComplet;
        $this->email = $email;
        $this->mot_passe = $mot_passe;
        $this->adresse = $adresse;
        $this->tel = $tel;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getNomComplet(): string
    {
        return $this->nomComplet;
    }

    public function getEmail(): string
    {
        return $this->email;
    }

    public function getMotPasse(): int
    {
        return $this->mot_passe;
    }

    public function getAdresse(): string
    {
        return $this->adresse;
    }

    public function getTel(): string
    {
        return $this->tel;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setNomComplet(string $nomComplet): void
    {
        $this->nomComplet = $nomComplet;
    }

    public function setEmail(string $email): void
    {
        $this->email = $email;
    }

    public function setMotPasse(int $mot_passe): void
    {
        $this->mot_passe = $mot_passe;
    }

    public function setAdresse(string $adresse): void
    {
        $this->adresse = $adresse;
    }

    public function setTel(string $tel): void
    {
        $this->tel = $tel;
    }
}