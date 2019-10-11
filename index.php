<html>

<head>
<meta charset="UTF-8">
<title>Pravoslavný kalendář</title>
</head>

<body>
<?php

/*
	Dny v týdnu
		1 - Pondělí
		2 - Úterý
		3 - Středa
		4 - Čtvrtek
		5 - Pátek
		6 - Sobota
		7 - Neděle
*/

/*
	Databáze "databaze"
		Relace "denni_cteni_p"
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
				2 - nedefinováno
				3 - mineje
			"typ" - int
				0 - apoštol
				1 - evangelista
		Relace "jmena_nedeli"
			"id" - int
			"nazev" - string
		Relace "tz"
			"id" - int
			"text" - string
	
	
	Zvýšení maximální kapacity stringu
		ALTER TABLE table MODIFY COLUMN column VARCHAR (délka) NOT NULL
*/

/*
	Objekty
		Rozhraní
			dtb - přístup k databázi
				objekt Dtb
			datum - kalendářní data
				objekt Skupina_dat
			den - údaje konkrétního dne, které se na stránce vypisují
				objekt Den	
		Skupina_dat
			datum_serveru
				objekt Datum
			datum_dne
				objekt Datum
			datum_paschy
				objekt Datum
		Datum
			den
			mesic
			rok
			den_v_tydnu
			
			vypsat - vrátí formátovaný řetězec
*/

/*
	Týdnování
		Pascha je v neděli. Týden následující pondělím po Pasše se nazývá "Světlý týden"
		a trvá do soboty včetně. Následující neděle, která je první nedělí po Pasše se
		nazývá "Druhá neděle po Pasše" a v ní, jako v prvním dni začíná panovat první hlas.
		Také jí začíná druhý týden po Pasše, který končí nejbližší sobotou. Následující
		neděle, která je druhou nedělí po Pasše se nazývá "Třetí neděle po Pasše" a s ní
		začíná třetí týden po Pasše. Tento pořádek trvá až do sedmého týdne po Pasše.
		Následující neděle, která je sedmou nedělí po Pasše a měla by být nazvána osmou
		nedělí po Pasše se nazývá "Padesátnice". Následujícím pondělím začíná "První týden
		po Padesátnici", který končí nedělí, která by byla nazvána devátá neděle po Pasše,
		ale nazývá se "První neděle po Padesátnici". Následujícím pondělím začíná "Druhý
		týden po Padesátnici. Tento pořádek se již nemění.
*/

###################################################################################################

class Rozhrani {
	function Rozhrani() {
		$this->dtb = null;
		$this->datum = null;
		$this->den = null;
	}
	
	function dtb_start() {
		include '.prihlasovaci_udaje.php';
		$this->dtb = new Dtb($adresa, $jmeno, $heslo, $jmeno_dtb);
		$this->dtb->prikaz("SET NAMES utf8");
	}
	
	function nastav_datum($datum_dne) {
		$this->datum = new Skupina_dat($datum_dne);
	}
	
	function nastav_udaje($posun) {
		$this->den = new Den($this, $posun);
	}
}


###################################################################################################

class Dtb {
	function Dtb($adresa, $jmeno, $heslo, $jmeno_dtb) {
		$this->dtb = new mysqli($adresa, $jmeno, $heslo);
		if ($this->dtb->connect_error) echo "Problém s připojením<br>";
		$this->jmeno_dtb = $jmeno_dtb;
	}
	
	function odpojit() {
		$this->dtb->close();
	}
	
	function prikaz($prikaz, $debug=0) {
		if ($this->dtb->query($prikaz) === TRUE) { if ($debug) echo "Úspěšně provededno<br>"; }
		else echo $this->dtb->error, "<br>";
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


###################################################################################################

class Skupina_dat {
	function Skupina_dat ($datum_dne) {		
		$this->datum_serveru = new Datum();
		$this->datum_serveru->dnesni_datum();
		
		$this->datum_paschy = new Datum();
		$this->datum_paschy->datum_paschy($this->datum_serveru);
		
		$this->datum_dne = $datum_dne;
		$this->datum_dne->nastav_den_v_tydnu($this->datum_serveru);
	}
}


###################################################################################################

class Datum {
	function Datum() {
		$this->den = 0;
		$this->mesic = 0;
		$this->rok = 0;
		$this->den_v_tydnu = 0;
	}
	
	function nastavit($den, $mesic, $rok) {
		$this->den = $den;
		$this->mesic = $mesic;
		$this->rok = $rok;
	}
	
	function dnesni_datum() {
		$pole = explode(" ", date("d m o N"));
		$this->nastavit((int) $pole[0], (int) $pole[1], (int) $pole[2]);
		$this->den_v_tydnu = (int) $pole[3];
	}
	
	function datum_paschy($datum_serveru) {
		$data = array(2019 => array(28, 4));		
		
		$this->nastavit($data[$datum_serveru->rok][0], $data[$datum_serveru->rok][1], $datum_serveru->rok);		
		if (Datum::porovnej($this, $datum_serveru))
		{
			$this->nastavit($data[$datum_serveru->rok - 1][0], $data[$datum_serveru->rok - 1][1], $datum_serveru->rok);
		}
		
		$this->nastav_den_v_tydnu($datum_serveru);
	}
	
	function nastav_den_v_tydnu($datum_serveru) {
		$this->den_v_tydnu = ((($datum_serveru->den_v_tydnu - 1 - Datum::rozdil_dnu($this, $datum_serveru)) % 7 + 7) % 7) + 1;
	}
	
	function vypsat() {
		echo $this->den, ". ", $this->mesic, ". ", $this->rok,
			" den: ", $this->den_v_tydnu, "<br>";
	}
	
	// První je novější, než druhý => 1, jinak 0
	public static function porovnej($prvni, $druhy) {
		if ($prvni->rok > $druhy->rok) return 1;
		else if ($prvni->rok < $druhy->rok) return 0;
		
		if ($prvni->mesic > $druhy->mesic) return 1;
		else if ($prvni->mesic < $druhy->mesic) return 0;
		
		if ($prvni->den > $druhy->den)return 1;
		else return 0;
	}
	
	public static function rozdil_dnu($prvni, $druhy) {
		$zmena = Datum::porovnej($prvni, $druhy);
		if ($zmena)
		{
			$zaloha = $prvni;
			$prvni = $druhy;
			$druhy = $zaloha;
		}

		$pocet_dni = 0;
		
		if ($prvni->mesic != $druhy->mesic)
		{
			for ($i = $prvni->mesic + 1; $i < $druhy->mesic; $i++)
			{
				$pocet_dni += Datum::dvm($i, $prvni->rok);
			}
			
			$pocet_dni += Datum::dvm($prvni->mesic, $prvni->rok) - $prvni->den;
			$pocet_dni += $druhy->den;
		}
		else $pocet_dni += $druhy->den - $prvni->den;
		
		if ($zmena) $pocet_dni = -$pocet_dni;
		return $pocet_dni;
	}
	
	public static function vratit_datum($den=0, $mesic=0, $rok=0) {
		$datum = new Datum();
		
		if ($den) $datum->nastavit($den, $mesic, $rok);
		else $datum->dnesni_datum();
		
		return $datum;
	}
	
	public static function dvm($mesic, $rok) {
		return array(31, ($rok % 4 == 0) ? 29 : 28, 31,	30, 31, 30, 31, 31, 30, 31, 30, 31)[$mesic - 1];
	}
}


###################################################################################################

class Svaty {
	function Svaty($retezec) {
		$pole = explode("@", $retezec);
		$this->jmeno = $pole[0];
		$this->tropar = new Tk($pole[1]);
		$this->kondak = new Tk($pole[2]);
	}
}
class Tk {
	function Tk($retezec) {
		$pole = explode("|", $retezec);
		$this->text = $pole[0];
		$this->hlas = $pole[1];
	}
}


###################################################################################################

class Den {
	function Den($rozhrani, $posun) {
		$this->rozhrani = $rozhrani;
		// Nový styl
		$this->n_den = $this->rozhrani->datum->datum_dne->den;
		$this->n_mesic = $this->rozhrani->datum->datum_dne->mesic;
		$this->n_rok = $this->rozhrani->datum->datum_dne->rok;
		$this->den_v_tydnu = $this->rozhrani->datum->datum_dne->den_v_tydnu;
		// Starý styl
		$this->s_rok = $this->n_rok + 5508 + (($this->n_mesic > 9 || ($this->n_mesic == 9 && $this->n_den >= 14)) ? 1 : 0);
		$this->s_den = 0;
		$this->s_mesic = $this->n_mesic;
		if ($this->n_den >= $posun + 1) $this->s_den = $this->n_den - $posun;
		else
		{
			$this->s_mesic += ($this->s_mesic != 1) ? -1 : 11;
			$this->s_den = Datum::dvm($this->s_mesic, $this->s_rok) - $posun + $this->n_den;
		}
		// Hlas a týden		
		$this->hlas = 0;
		$this->dpp = 0;
		$this->tyden = 0;
		$this->nacist_hlas_a_tyden();
		// Teofan Zatvornik
		$this->tz = null;
		$this->nacist_tz();
		// Ostatni
		$this->nazev = "";
		$this->velky_svatek = "";
		$this->svati = array();
		$this->dcteni_p = array();
		$this->dcteni_k = array();		
		$this->tk = array();
		$this->jmeno_databaze = NULL;
		// SQL
		$this->nacist_velky_svatek();
		$this->nacist_svate();
		$this->nacist_cteni();
		if ($this->den_v_tydnu == 7) $this->nacist_nazev_nedele();
		// Tropary a kondaky
		//$this->nacist_tk(); --TODO
	}
	
	function nacist_hlas_a_tyden() {
		$this->dpp = Datum::rozdil_dnu($this->rozhrani->datum->datum_paschy, $this->rozhrani->datum->datum_dne);
		$this->tyden = Den::podil($this->dpp) + (($this->den_v_tydnu == 7) ? 1 : 0);
		$this->hlas = (($this->tyden - 2) % 8) + 1;
	}
	
	function nacist_tz() {
		$dny = array(1 => "Понедельник", 2 => "Вторник", 3 => "Среда", 4 => "Четверг", 5 => "Пятница", 6 => "Суббота");
		$cesta = "./tz/index_split_".sprintf("%03d", $this->tyden + 15).".xhtml";
		
		$soubor = fopen($cesta, "r") or die("Nepodařilo se otevřít soubor");
		$text = fread($soubor, filesize($cesta));
		$text = strstr($text, "<div class=\"paragraph\"><b class=\"calibre10\">".$dny[$this->den_v_tydnu]);
		$text = strstr($text, "<p class=\"calibre9\" style=\"margin:0pt; border:0pt; height:1em\">", true);
		
		$this->tz = $text;
	}
	
	function nacist_velky_svatek() {
		$this->velky_svatek = ($this->rozhrani->dtb->dtb->query("SELECT nazev FROM {$this->rozhrani->dtb->jmeno_dtb}.velke_svatky WHERE den='$this->s_den' AND mesic='$this->s_mesic'"))->fetch_array()[0];
	}
	
	function nacist_svate() {
		$x = $this->rozhrani->dtb->dtb->query("SELECT jmeno FROM {$this->rozhrani->dtb->jmeno_dtb}.svati_dne WHERE den='$this->s_den' AND mesic='$this->s_mesic'");
		while ($y = $x->fetch_array()[0]) array_push($this->svati, $y);
	}
	
	function nacist_nazev_nedele() {
		$this->nazev = ($this->dtb->dtb->query("SELECT nazev FROM $this->jmeno_databaze.jmena_nedeli WHERE id='$this->tyden'"))->fetch_assoc()["nazev"];
	}
	
	function nacist_tk() {
		
	}
	
	function vypsat() {
		// Základní info
		$den_v_tydnu = array("Pondělí", "Úterý", "Středa",
			"Čtvrtek", "Pátek", "Sobota", "Neděle");
		$mesic = array("leden", "únor", "březen", "duben",
			"květen", "červen", "červenec", "srpen", "září",
			"říjen", "listopad", "prosinec");
		
		echo $den_v_tydnu[$this->den_v_tydnu - 1], "<br>";
		echo "Starý styl: ", $this->s_den, ". ", $mesic[$this->s_mesic - 1], "<br>";
		echo "Nový styl: ", $this->n_den, ". ", $mesic[$this->n_mesic - 1], "<br>";
		echo $this->s_rok, " let od stvoření světa", "<br>";
		echo $this->n_rok, " let od narození Krista", "<br>";
		
		// Týdnování
		if ($this->tyden == 1 && $this->den_v_tydnu != 7)
		{
			echo "Světlý týden";
		}
		if ($this->tyden > 1 && $this->tyden < 8)
		{
			echo $this->tyden, ". ", ($this->den_v_tydnu == 7) ? "neděle" : "týden", " po Pasše";
		}
		if ($this->tyden >= 8)
		{
			$tyden = $this->tyden - (($this->den_v_tydnu == 7) ? 8 : 7);
			if ($tyden)
			{
				echo $tyden, ". ", ($this->den_v_tydnu == 7) ? "neděle" : "týden", " po Padesátnici";
			}
			else
			{
				echo "8. neděle po Pasše";
			}
		}
		
		// Jméno neděle
		echo (($this->den_v_tydnu == 7) ? " - " : "").$this->nazev."<br>";
		
		// Hlas
		if ($this->hlas)
		{
			echo "Hlas ", $this->hlas, ".<br>";
		}
		
		// Debug info
		echo "[T: ", $this->tyden, "]<br>";
		echo "[DPP: ", $this->dpp, "]<br>";
		echo "<br><br>";
		
		// Velké svátky
		echo "Velký svátek: ".(($this->velky_svatek == "") ? "<i>Není velký svátek</i>" : $this->velky_svatek)."<br>";
		
		// Svatí podle mineje
		echo "Svatí z mineje: ";
		for ($i = 0; $i < count($this->svati); $i++)
		{
			echo $this->svati[$i].(($i != count($this->svati) - 1) ? "; " : "");
		}
		echo "<br><br>";
		
		// Životy svatých
		echo "Životy svatých na dnešní den z Ochridského prologu <a href='./op/$this->s_mesic/$this->s_den.pdf'
			target='_blank'>zde</a>.<br>";
		echo "Životy svatých na dnešní den z Minejí <a>zde</a>. --TODO<br><br>"; // --TODO
		
		// Denní čtení
		//$this->vypsat_cteni();
		
		// Teofan Zatvornik
		echo "Poučení na každý den roku od sv. Teofana Zatvornika<br>";
		echo $this->tz."<br>";
		
		// Jména svatých, tropary a kondaky - TODO
		/*
		for ($i = 0; $i < count($this->tk); $i++)
		{
			$svaty = $this->tk[$i];
			echo $svaty->jmeno, "<br><br>";
			echo "Tropar: <br>", $svaty->tropar->text, "<br>", $svaty->tropar->hlas, ". hlas<br><br>";
			echo "Kondak: <br>", $svaty->kondak->text, "<br>", $svaty->kondak->hlas, ". hlas<br><br>";
		}
		*/
	}
	
	function nacist_cteni() {
		// Paschální kruh
		$denni_cteni_p = $this->rozhrani->dtb->dtb->query("SELECT * FROM {$this->rozhrani->dtb->jmeno_dtb}.denni_cteni_p WHERE den='$this->dpp'");
		while ($pole = $denni_cteni_p->fetch_assoc())
		{
			array_push($this->dcteni_p, $pole);
		}
		
		// Kalendářní kruh
		$denni_cteni_k = $this->rozhrani->dtb->dtb->query("SELECT * FROM {$this->rozhrani->dtb->jmeno_dtb}.denni_cteni_k WHERE den='$this->s_den' AND mesic='$this->s_mesic'");
		while ($pole = $denni_cteni_k->fetch_assoc())
		{
			array_push($this->dcteni_k, $pole);
		}
	}
	
	function vypsat_cteni() {
		
		$cas = array(0=>"Jitřní", 1=>"Liturgie", 2=>"Večerní", 3=>"Nedefinováno");
		
		for ($i = 0; $i < count($this->dcteni_k); $i++)
		{
			if (obsahuje("".$this->den_v_tydnu, $this->dcteni_k[$i]["den_v_tydnu"]))
			{
				echo $cas[$this->dcteni_k[$i]["cas"]], "<br>";
				$id = $this->dcteni_k[$i]["id_svateho"];
				$jmeno = $this->dtb->dtb->query("SELECT treti_pad FROM $this->jmeno_databaze.svati_dne WHERE id='$id'");
				echo "Služba k ".$jmeno->fetch_array()[0]."<br>";
				echo "[".$this->dcteni_k[$i]["zacalo"]."] ";
				echo $this->dcteni_k[$i]["adresa"], "<br>";
				echo $this->dcteni_k[$i]["text"], "<br><br>";
			}
		}
		if ($this->velky_svatek == "")
		{
			for ($i = 0; $i < count($this->dcteni_p); $i++)
			{
				echo "Řadové čtení<br>";
				echo "[".$this->dcteni_p[$i]["zacalo"]."] ";
				echo $this->dcteni_p[$i]["adresa"], "<br>";
				echo $this->dcteni_p[$i]["text"], "<br><br>";
			}
		}
	}
	
	public static function podil($cislo) {
		$podil = intdiv($cislo, 7);
		if ($cislo % 7 != 0) $podil++;
		return $podil;
	}
}


###################################################################################################

function obsahuje($a, $b) {
	if ($b == "0") return True;
	for ($i = 0; $i < strlen($b); $i++)
	{
		if ($a == $b[$i]) return True;
	}
	return False;
}


###################################################################################################

class Main {
	public static function f_main() {
		$rozhrani = new Rozhrani();
		
		$posun = 13;
		
		$rozhrani->dtb_start();
		$rozhrani->nastav_datum(Datum::vratit_datum());
		$rozhrani->nastav_udaje($posun);
		$rozhrani->den->vypsat();		
		$rozhrani->dtb->odpojit();
	}
}

Main::f_main();
?>

</body>

</html>
