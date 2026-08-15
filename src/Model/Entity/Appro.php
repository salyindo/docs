<?php

class Appro
{
    private int $id;
    private string $refBl;
    private DateTime $dateAppro;

    public function __construct(
        int $id,
        string $refBl,
        DateTime $dateAppro
    ) {
        $this->id = $id;
        $this->refBl = $refBl;
        $this->dateAppro = $dateAppro;
    }

    public function getId(): int
    {
        return $this->id;
    }

    public function getRefBl(): string
    {
        return $this->refBl;
    }

    public function getDateAppro(): DateTime
    {
        return $this->dateAppro;
    }

    public function setId(int $id): void
    {
        $this->id = $id;
    }

    public function setRefBl(string $refBl): void
    {
        $this->refBl = $refBl;
    }

    public function setDateAppro(DateTime $dateAppro): void
    {
        $this->dateAppro = $dateAppro;
    }
}