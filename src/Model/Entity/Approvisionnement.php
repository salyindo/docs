<?php

class Approviosionnement

{
    private int $id;
    private DateTime $dateApprovisionnement;
    private Fournisseur $fournisseurId;
    private Utilisateur $utilisateurId;


    public function getId(): int
    {
        return $this->id;
    }
}

 