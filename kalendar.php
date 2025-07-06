<html>

<head>
<title>Pravoslavný kalednář</title>
</head>

<body>

<?php

class Date {
	static $days_in_month = array(
		0 => 31,
		1 => 29,
		2 => 31,
		3 => 30,
		4 => 31,
		5 => 30,
		6 => 31,
		7 => 31,
		8 => 30,
		9 => 31,
		10 => 30,
		11 => 31,
	);
	
	static $month_names = array(
		1 => "leden",
		2 => "únor",
		3 => "březen",
		4 => "duben",
		5 => "květen",
		6 => "červen",
		7 => "červenec",
		8 => "srpen",
		9 => "září",
		10 => "říjen",
		11 => "listopad",
		12 => "prosinec"
	);
	
	static $day_names = array(
		0 => "středa",
		1 => "čtvrtek",
		2 => "pátek",
		3 => "sobota",
		4 => "neděle",
		5 => "pondělí",
		6 => "úterý",
	);
	
	public $civil_date = array();
	public $julian_date = array();
	
	function __construct() {
		// Date computation
		$d = getdate();
		
		$this->civil_date["day_id"] = Date::tuple_to_id($d["mon"], $d["mday"]);
		$this->julian_date["year"] = $this->civil_date["year"] = $d["year"];
		
		$this->julian_date["day_id"] = $this->civil_date["day_id"] - 13;
		
		// Underflow to last year
		if ($this->julian_date["day_id"] < 1) {
			$this->julian_date["year"] -= 1;
			$this->julian_date["day_id"] += 366;
		}
	}
	
	static function tuple_to_id($month, $day) {
		$day_count = 0;
		
		for ($i = 1; $i < $month; $i++) {
			$day_count += Date::$days_in_month[$i];
		}
		
		return $day_count + $day - 1;
	}
	
	static function id_to_tuple($date_id) {
		$day_id = $date_id["day_id"];
		
		for ($month = 0; $day_id >= Date::$days_in_month[$month]; $month += 1) {
			$day_id -= Date::$days_in_month[$month];
		}
		
		return array(
			"year" => $date_id["year"],
			"month" => $month + 1,
			"day" => $day_id + 1
		);
	}
	
	static function day_in_week($date_id) {
		// Anchor date - 1. 1. 1800 was wednesday
		$total_years = $date_id["year"] - 1800;
		
		$total_days = $total_years * 365;
		
		// Leap for current year is contained in day_id
		$total_years = max(0, $total_years - 1);
		$leaps = intdiv($total_years, 4) - intdiv($total_years, 100) + intdiv($total_years + 200, 400);
		
		$total_days += $leaps + $date_id["day_id"];
		
		// Fix skipped day in non leap year
		if (! Date::is_leap($date_id["year"]) && $date_id["day_id"] > 31 + 28) {
			$total_days -= 1;
		}
		
		return $total_days % 7;
	}
	
	static function is_leap($year) {
		return $year % 4 == 0 && ($year % 100 != 0 || $year % 400 == 0);
	}
	
	static function format_date($date_tuple) {
		return $date_tuple["day"] . ". " . Date::$month_names[$date_tuple["month"]] . " " . $date_tuple["year"];
	}
	
	function get_readable_civil() {
		return Date::id_to_tuple($this->civil_date);
	}
	
	function get_id_civil() {
		return $this->civil_date;
	}
	
	function get_readable_julian() {
		return Date::id_to_tuple($this->julian_date);
	}
	
	function get_id_julian() {
		return $this->julian_date;
	}
}

function read_saints_ohrid($day_id) {		
	// Saint according to Ohrid Prolog
	$fp = fopen("saints_ohrid_prolog.csv", "r");
	
	$saints = array();
	
	while (($line = fgetcsv($fp)) != false) {
		if ($line[0] == $day_id) {
			array_push($saints, $line[1]);
		}
	}
	
	return $saints;
}

// Date
$date = new Date;

//$date->civil_date = array("day_id" => 60, "year" => 1800);

echo "<p>" . Date::$day_names[Date::day_in_week($date->get_id_civil())] . "</p>";

echo "<i>day_id: " . $date->civil_date["day_id"] . "</i><br>";
echo "<i>day_id_old: " . $date->julian_date["day_id"] . "</i><br>";

echo "<p>" . Date::format_date($date->get_readable_civil()) . " podle občanského kalendáře</p>";

echo "<p>" . Date::format_date($date->get_readable_julian()) . " podle pravoslavného kalendáře</p>";

// Saints
echo "<p>Svatí pro dnešní den podle Ochridského prologu:</p>";

echo "<p>" . implode(", ", read_saints_ohrid($date->get_id_julian()["day_id"])) . "</p>";

echo "<p>Srdečné pozdravy konkurenci z <a href=\"http://www.dcteni.hys.cz\">dcteni.hys.cz</a>, <a href=\"http://www.pravoslavi.cz\">pravoslavi.cz</a> a <a href=\"https://kalendar.or.cz\">kalendar.or.cz</a></p>";

test();

function test() {
	$date = new Date;
	
	// 1. 1. 1800
	$date->civil_date = array("day_id" => 0, "year" => 1800);
	assert(Date::day_in_week($date->get_id_civil()) == 0);
	
	// 1. 3. 1800
	$date->civil_date = array("day_id" => 60, "year" => 1800);
	assert(Date::day_in_week($date->get_id_civil()) == 3);
	
	// 1. 1. 1804
	$date->civil_date = array("day_id" => 0, "year" => 1804);
	assert(Date::day_in_week($date->get_id_civil()) == 4);
	
	// 1. 1. 2000
	$date->civil_date = array("day_id" => 0, "year" => 2000);
	assert(Date::day_in_week($date->get_id_civil()) == 3);
	
	// 1. 3. 2000
	$date->civil_date = array("day_id" => 60, "year" => 2000);
	assert(Date::day_in_week($date->get_id_civil()) == 0);
	
	// 1. 1. 2001
	$date->civil_date = array("day_id" => 0, "year" => 2001);
	assert(Date::day_in_week($date->get_id_civil()) == 5);
}

?>

</body>

</html>