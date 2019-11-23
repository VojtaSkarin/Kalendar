<?php

class ADen {
	function Den() {
		$this->rozhrani = null;
		$this->n_den = null;
		$this->n_mesic = null;
		$this->n_rok = null;
		$this->den_v_tydnu = null;
		$this->s_rok = null;
		$this->s_den = null;
		$this->s_mesic = null;
		$this->hlas = 0;
		$this->dpp = 0;
		$this->tyden = 0;
		$this->tz = null;
		$this->nazev = null;
		$this->velky_svatek = null;
		$this->svati = null;
		$this->dcteni_p = null;
		$this->dcteni_k = null;
		$this->tk = null;
		$this->jmeno_databaze = null;
	}
}

class Rok {
	function Rok() {
		$this->mesice = array();
	}
}

class Mesic {
	function Mesic() {
		$this->dny = array();
	}
}

class C {
	function C() {
		$this->roky = array();
		$this->test = "ahoj";
	}
}

############################
####	23. 11. 2019	####
############################
$den_23_11_2019 = new Den();
$den_23_11_2019->n_den = 23;
$den_23_11_2019->n_mesic = 11;
$den_23_11_2019->n_rok = 2019;
$den_23_11_2019->den_v_tydnu = 6;
$den_23_11_2019->s_den = 10;
$den_23_11_2019->s_mesic = 11;
$den_23_11_2019->s_rok = 7528;
$den_23_11_2019->hlas = 5;
$den_23_11_2019->dpp = 209;
$den_23_11_2019->tyden = 30;
$den_23_11_2019->nazev = null;
$den_23_11_2019->velky_svatek = null;
$den_23_11_2019->svati = array("Svatí apoštolé ze 70-ti: Erast, Olympos, Rodion, Sosipater, Kuart (Kvart) a Tertios",
							  "Svatý mučedník Orest, léčitel (+304)");
############################
####	24. 11. 2019	####
############################
$den_24_11_2019 = new Den();
$den_24_11_2019->n_den = 24;
$den_24_11_2019->n_mesic = 11;
$den_24_11_2019->n_rok = 2019;
$den_24_11_2019->den_v_tydnu = 7;
$den_24_11_2019->s_den = 11;
$den_24_11_2019->s_mesic = 11;
$den_24_11_2019->s_rok = 7528;
$den_24_11_2019->hlas = 6;
$den_24_11_2019->dpp = 210;
$den_24_11_2019->tyden = 31;
$den_24_11_2019->nazev = "Převrácenost fariseův";
$den_24_11_2019->velky_svatek = null;
$den_24_11_2019->svati = array("Svatý velkomučedník Min (+304) a svatí mučedníci Viktor a Stefanid (+ ok. 161-180) a Vikentios (+304) a ctihodný Feodor Studit, kajícník (+826)",
							   "Blažený Maxim, blázen pro Krista, Moskevský divotvorce (+1434)",
							   "Ctihodný Martirij Zelenecký, Velikolukský (+1603)",
							   "Svatý oddaný král Srbský, velikomučedník Stefan Děčanský (+ ok. 1336)");
##########################################
$mesic_11 = new Mesic();
$mesic_11->dny[23] = $den_23_11_2019;
$mesic_11->dny[24] = $den_24_11_2019;
############################################
$rok_2019 = new Rok();
$rok_2019->mesice[11] = $mesic_11;
######################################
$roky = array(2019 => $rok_2019);
?>