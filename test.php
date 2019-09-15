<html>

<head>
<title>Pravoslavný kalendář</title>
<link rel = "icon" href = "icon.jpg">
</head>

<body>
<?php
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
	
	function vypsat() {
		echo $this->den, ". ", $this->mesic, ". ", $this->rok,
			" den: ", $this->den_v_tydnu, "<br>";
	}
}

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
	
class Den {
	function Den() {
		$this->s_den = 0;
		$this->s_mesic = 0;
		$this->s_rok = 0;
		$this->n_den = 0;
		$this->n_mesic = 0;
		$this->n_rok = 0;
		$this->den_v_tydnu = 0;
		$this->hlas = 0;
		$this->tyden = 0;
		$this->dpp = 0;
		$this->tk = array();
	}
	
	function dnesni_den($posun, $datum_paschy, $datum) {
		$this->n_den = $datum->den;
		$this->n_mesic = $this->s_mesic = $datum->mesic;
		if ($this->n_den >= 14)
		{
			$this->s_den = $this->n_den - $posun;
		}
		else
		{
			$this->s_mesic += ($this->s_mesic != 1) ? -1 : 11;
			$this->s_den = dvm($this->s_mesic, $this->s_rok) - $posun + $this->n_den;
		}
		$this->n_rok = $datum->rok;
		$this->s_rok = $this->n_rok + 5508 + (($this->n_mesic >= 8
			&& $this->n_den >= 14) ? 1 : 0);
		$this->den_v_tydnu = $datum->den_v_tydnu;
		$this->hlas_a_tyden($datum_paschy, $datum);
		//$this->nacist_tk(); --TODO
	}
	
	function nacist_tk() {
		$jmeno_souboru = sprintf("data/kk/%d.dat", $this->n_mesic);
		$soubor = fopen($jmeno_souboru, "r");
		$pole = explode("-", (explode("*", fread($soubor, filesize($jmeno_souboru)))[$this->n_den - 1]));
		
		for ($i = 1; $i < count($pole); $i++)
		{
			$svaty = new Svaty($pole[$i]);
			array_push($this->tk, $svaty);
		}
		
		fclose($soubor);
	}
	
	function vypsat() {
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
			echo "Světlý týden", "<br>";
		}
		if ($this->tyden > 1 && $this->tyden < 8)
		{
			echo $this->tyden, ". ", ($this->den_v_tydnu == 7) ? "neděle" : "týden", " po Pasše", "<br>";
		}
		if ($this->tyden >= 8)
		{
			$tyden = $this->tyden - (($this->den_v_tydnu == 7) ? 8 : 7);
			if ($tyden)
			{
				echo $tyden, ". ", ($this->den_v_tydnu == 7) ? "neděle" : "týden", " po Padesátnici", "<br>";
			}
			else
			{
				echo "8. neděle po Pasše", "<br>";
			}
		}
		// Konec týdnování
		
		if ($this->hlas)
		{
			echo "Hlas ", $this->hlas, ".<br>";
		}
		
		echo "DPP: ", $this->dpp, "<br>";
		echo "<br><br>";
		$this->vypsat_cteni();
		
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
	
	function hlas_a_tyden($datum_paschy, $dnesni_datum) {
		$this->dpp = rozdil_dnu($datum_paschy, $dnesni_datum);
		$this->tyden = podil($this->dpp) + (($this->den_v_tydnu == 7) ? 1 : 0);
		$this->hlas = (($this->tyden - 2) % 8) + 1;
	}
	
	function vypsat_cteni() {
		$jmeno_souboru = sprintf("data/e/%d.dat", intdiv($this->dpp, 7));
		$soubor = fopen($jmeno_souboru, "r");
		$text = explode("***", fread($soubor, filesize($jmeno_souboru)))[$this->dpp %7];
		echo $text, "<br>";
	}
}

function vratit_datum($den=0, $mesic=0, $rok=0) {
	$dnesni_datum = new Datum();
	$dnesni_datum->dnesni_datum();
	if (!$den)
	{
		return $dnesni_datum;
	}
	
	$datum = new Datum();
	$datum->nastavit($den, $mesic, $rok);
	
	$datum->den_v_tydnu = (($dnesni_datum->den_v_tydnu - rozdil_dnu($datum, $dnesni_datum) % 7) + 7) % 7;
	if (!$datum->den_v_tydnu)
	{
		$datum->den_v_tydnu = 7;
	}
	
	return $datum;
}

function rozdil_dnu($prvni, $druhy) {
	$zmena = porovnej($prvni, $druhy);
	
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
			$pocet_dni += dvm($i, $prvni->rok);
		}
		
		$pocet_dni += dvm($prvni->mesic, $prvni->rok) - $prvni->den;
		$pocet_dni += $druhy->den;
	}
	else
	{
		$pocet_dni += $druhy->den - $prvni->den;
	}
	
	if ($zmena)
	{
		$pocet_dni = -$pocet_dni;
	}
	
	return $pocet_dni;
}

function dvm($mesic, $rok) {
	return array(31, ($rok % 4 == 0) ? 29 : 28, 31,
			30, 31, 30, 31, 31, 30, 31, 30, 31)[$mesic - 1];
}

function podil($cislo) {
	$podil = intdiv($cislo, 7);
	if ($cislo % 7 != 0)
	{
		$podil++;
	}
	return $podil;
}

function porovnej($prvni, $druhy) {
	
	if ($prvni->rok > $druhy->rok)
	{
		return 1;
	}
	else if ($prvni->rok < $druhy->rok)
	{
		return 0;
	}
	
	if ($prvni->mesic > $druhy->mesic)
	{
		return 1;
	}
	else if ($prvni->mesic < $druhy->mesic)
	{
		return 0;
	}
	
	if ($prvni->den > $druhy->den)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

function main() {		
	$posun = 13;
	$datum_paschy = vratit_datum(28, 4, 2019);

	$den = new Den();
	$den->dnesni_den($posun, $datum_paschy, vratit_datum(9, 9, 2019));
	$den->vypsat();
}

main();
?>
</body>

</html>
