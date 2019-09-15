<?php

/*
	Databáze "databaze"
		Relace "denni_cteni"
			"id" - int
				[primární klíč]
			"den" - int
				[den po Pasše]
			"adresa" - string
			"text" - string
			"bible" - int
				[překlad Bible]
				0 - Bible Kralická (1613)
				1 - ČEP
				2 - Bible 21 (Nová Bible Kralická)
				3 - Překlad Petrů
			"cas" - int
				[denní doba]
				0 - jitřní
				1 - liturgie
		Relace "jmena_nedeli"
			"id" - int
			"nazev" - string
		Relace "tz"
			"id" - int
			"text" - string
	
	
	ALTER TABLE databaze.tz ALTER COLUMN text VARCHAR (1000)

*/

class Dtb {
	function Dtb() {
		$this->dtb = NULL;
	}
	
	function pripojit() {
		$this->dtb = new mysqli("localhost", "root", "");
		if ($this->dtb->connect_error)
		{
			echo "Problém s připojením<br>";
		}
	}
	
	function odpojit() {
		$this->dtb->close();
	}
	
	function prikaz($prikaz, $debug=0) {
		if ($this->dtb->query($prikaz) === TRUE)
		{
			if ($debug) echo "Úspěšně provededno<br>";
		}
		else
		{
			echo $this->dtb->error, "<br>";
		}
	}
	
	function vytvor_databazi($nazev) {
		$this->prikaz("CREATE DATABASE IF NOT EXISTS $nazev");
	}
	
	function vytvor_relaci($databaze, $relace, $sloupce) {
		$this->prikaz("CREATE TABLE $databaze.$relace (
		$sloupce
		)");
	}
	
	function smaz_relaci($databaze, $relace) {
		$this->prikaz("DROP TABLE $databaze.$relace");
	}
	
	function vloz_data($databaze, $relace, $sloupce, $hodnoty, $debug=0) {
		$prikaz = "INSERT INTO $databaze.$relace
		($sloupce) VALUES
		($hodnoty)";
		if ($debug) echo $prikaz, "<br>";
		$this->prikaz($prikaz);
	}
}

function dtb_start() {
	$dtb = new Dtb();
	$dtb->pripojit();
	$dtb->prikaz("SET NAMES utf8");
	return $dtb;
}
?>
