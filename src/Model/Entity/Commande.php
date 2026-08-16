<?php

class Commande
{
    private int $id;
    private Date $dateCommande;
    private float $montantTotal;
    private float $avance;
    private Client $clientId;
    private ModePaiement $modePaiementId;
    private Utilisateur $utilisateurId;

   
    public function getId(): int
    {
        return $this->id;
    }

   

  
}