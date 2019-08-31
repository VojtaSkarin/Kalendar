<html>

<head>
<title>Pravoslavný kalendář</title>
</head>

<body>
<?php
class Datum {
	function Datum($den, $mesic) {
		$this->den = $den;
		$this->mesic = $mesic;
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
		$this->n_den = 0;
		$this->n_mesic = 0;
		$this->den_v_tydnu = 0;
		$this->n_rok = 0;
		$this->s_rok = 0;
		$this->hlas = 0;
		$this->tk = array();
	}
	
	function nastavit_datum($posun, $datum_paschy) {	
		$amax = array(31, ($this->n_rok % 4 == 0) ? 29 : 28, 31,
			30, 31, 30, 31, 31, 30, 31, 30, 31);	
		
		$pole = explode(" ", date("d m o N"));
		$this->n_den = (int) $pole[0];
		$this->n_mesic = $this->s_mesic = (int) $pole[1];
		if ($this->n_den >= 14)
		{
			$this->s_den = $this->n_den - $posun;
		}
		else
		{
			$this->s_mesic += ($this->s_mesic != 1) ? -1 : 11;
			$this->s_den = amax[$this->s_mesic - 1] - posun + $this->n_den;
		}
		$this->n_rok = (int) $pole[2];
		$this->s_rok = $this->n_rok + 5508 + (($this->n_mesic >= 8
			&& $this->n_den >= 14) ? 1 : 0);
		$this->den_v_tydnu = (int) $pole[3];
		$this->vypocist_hlas($datum_paschy, $amax);
		$this->nacist_tk();
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
		echo "Starý styl:", $this->s_den, ". ", $mesic[$this->s_mesic - 1], "<br>";
		echo "Nový styl: ", $this->n_den, ". ", $mesic[$this->n_mesic - 1], "<br>";
		echo $this->s_rok, " let od stvoření světa", "<br>";
		echo $this->n_rok, " let od narození Krista", "<br>";
		echo "Hlas ", $this->hlas, ".<br>";
		echo "<br><br>";
		
		for ($i = 0; $i < count($this->tk); $i++)
		{
			$svaty = $this->tk[$i];
			echo $svaty->jmeno, "<br><br>";
			echo "Tropar: <br>", $svaty->tropar->text, "<br>", $svaty->tropar->hlas, ". hlas<br><br>";
			echo "Kondak: <br>", $svaty->kondak->text, "<br>", $svaty->kondak->hlas, ". hlas<br><br>";
		}
	}
	
	function vypocist_hlas($datum_paschy, $amax) {
		if ($this->n_mesic > $datum_paschy->mesic || ($this->n_mesic ==
			$datum_paschy->mesic && $this->n_den >= $datum_paschy->den))
		{
			$pocet_dni = 0;
			for ($i = $datum_paschy->mesic + 1; $i < $this->n_mesic; $i++)
			{
				$pocet_dni += $amax[$i - 1];
			}
			$pocet_dni += $amax[$datum_paschy->mesic - 1] - $datum_paschy->den
				+ $this->n_den;
			
			$this->hlas = intdiv($pocet_dni, 7) % 8 + (($this->den_v_tydnu == 0) ? 2 : 1);
		}
		else
		{
			
		}
	}
}
$posun = 13;
$datum_paschy = new Datum(28, 4);

$den = new Den();
$den->nastavit_datum($posun, $datum_paschy);
$den->vypsat();
?>
</body>

</html>