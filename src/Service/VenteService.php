<?php

require_once dirname(__DIR__) . "/Core/Database.php";
require_once dirname(__DIR__) . "/Model/Repository/ProduitRepository.php";
require_once dirname(__DIR__) . "/Model/Repository/ClientRepository.php";

class VenteService
{
    private PDO $connexion;
    private ProduitRepository $produitRepository;
    private ClientRepository $clientRepository;

    public function __construct()
    {
        $this->connexion = Database::getInstance()->getConnection();
        $this->produitRepository = new ProduitRepository();
        $this->clientRepository = new ClientRepository();
    }

    public function enregistrerCommande(
        int $clientId,
        array $lignesCommande,
        string $modeReglement
    ) {
        try {

            $this->connexion->beginTransaction();

            $client = $this->clientRepository->getClientById($clientId);

            if (!$client) {
                throw new Exception("Ce client n'existe pas");
            }

            $total = 0;

            foreach ($lignesCommande as $ligne) {

                $produit = $this->produitRepository->getProduitById(
                    $ligne['produit_id']
                );

                if (!$produit) {
                    throw new Exception("Produit introuvable");
                }

                if ($ligne['quantite'] <= 0) {
                    throw new Exception(
                        "La quantité doit être supérieure à 0"
                    );
                }

                if ($produit->getQuantiteStock() < $ligne['quantite']) {
                    throw new Exception("Stock insuffisant");
                }

                $total += $produit->getPrixVente()
                    * $ligne['quantite'];
            }

        } catch (Exception $e) {

            if ($this->connexion->inTransaction()) {
                $this->connexion->rollBack();
            }

            throw $e;
        }
    }
}