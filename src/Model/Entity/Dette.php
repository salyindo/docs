<?php

class Dette
{
    private int $id;
    private float $montantInitial;
    private float $montantRestant;
    private Date $dateCreation;
    private Date $dateEcheance;
    private string $statut;
    private Commande $commandeId;

  

    public function getId(): int
    {
        return $this->id;
    }

   
}