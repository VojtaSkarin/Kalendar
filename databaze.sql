-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Ned 15. zář 2019, 21:02
-- Verze serveru: 10.4.6-MariaDB
-- Verze PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `databaze`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `denni_cteni`
--

CREATE TABLE `denni_cteni` (
  `id` int(11) NOT NULL,
  `den` int(11) DEFAULT NULL,
  `adresa` varchar(30) DEFAULT NULL,
  `text` varchar(1000) DEFAULT NULL,
  `bible` int(11) DEFAULT NULL,
  `cas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `denni_cteni`
--

INSERT INTO `denni_cteni` (`id`, `den`, `adresa`, `text`, `bible`, `cas`) VALUES
(1, 140, '1. Kor. XVI, 13-24.', '13Bděte, stůjte ve víře, buďte stateční, buďte silní. 14Všechno ať se mezi vámi děje v lásce.\r\n15Bratři, víte, že Štěpánova rodina je prvním ovocem Řecka a že se vydali službě svatým. Prosím vás tedy, 16abyste takové lidi následovali, a stejně tak i každého, kdo se podílí na tomto díle. 17Mám velikou radost, že dorazil Štěpán, Fortunát a Achaikos, protože mi vynahradili vaši nepřítomnost. 18Občerstvili mě na duchu a jistě i vás. Takových lidí si važte.\r\n19Pozdravují vás sbory v Asii. Velmi vás v Pánu pozdravuje Akvila s Priscillou i církev u nich v domě. 20Pozdravují vás všichni sourozenci. Pozdravte se navzájem svatým polibkem.\r\n21JÁ PAVEL PŘIDÁVÁM POZDRAV SVOU VLASTNÍ RUKOU.\r\n22Kdo nemá rád Pána, ať je proklet. Maranatha!\r\n23Milost Pána Ježíše s vámi.\r\n24Má láska je s vámi všemi v Kristu Ježíši.', 2, 1),
(2, 140, 'Mat. XXI, 33-42.', '33„Poslechněte si další podobenství: Jeden hospodář vysadil vinici, obehnal ji plotem, vykopal v ní lis a postavil věž. Pak ji pronajal vinařům a vydal se na cestu. 34Když se přiblížil čas vinobraní, poslal k vinařům své služebníky, aby převzali její úrodu. 35Vinaři se těch služebníků chopili a jednoho ztloukli, jiného zabili a dalšího kamenovali. 36Poslal tedy ještě jiné služebníky, více než předtím, a těm udělali totéž.\r\n37Nakonec k nim poslal svého syna. Řekl si: ‚Před mým synem se zastydí.‘ 38Když ale vinaři toho syna uviděli, řekli si: ‚Tohle je dědic. Pojďme ho zabít a zmocnit se dědictví!‘ 39Chopili se ho, vyvlekli z vinice ven a zabili. 40Co tedy pán vinice udělá s oněmi vinaři, až přijde?“\r\n41Odpověděli mu: „Ty zlosyny zle zahubí a vinici pronajme jiným vinařům, kteří mu budou odevzdávat ovoce v čas sklizně.“\r\n42Ježíš jim řekl: „Nikdy jste nečetli v Písmech?\r\n‚Kámen staviteli zavržený\r\nstal se kamenem úhelným.\r\nSám Hospodin to učinil\r\na v našich očích je to div.‘', 2, 1),
(3, 140, 'Mar. XVI, 1-8.', '1Když skončila sobota, Marie Magdaléna, Marie Jakubova a Salome nakoupily vonné masti, aby mohly jít a pomazat Ježíše. 2Za svítání prvního dne v týdnu, jakmile vyšlo slunce, šly k hrobu. 3Říkaly si: „Kdo nám odvalí kámen od vchodu?“\r\n4Když ale vzhlédly, spatřily, že kámen je odvalen (přestože byl velmi veliký). 5Vešly do hrobu, a když vpravo uviděly sedět mladíka oblečeného bílým rouchem, hrozně se vylekaly.\r\n6On jim však řekl: „Nelekejte se. Hledáte ukřižovaného Ježíše z Nazaretu. Vstal, není tu. Podívejte se, kam ho položili. 7Jděte a řekněte jeho učedníkům i Petrovi, že vás předchází do Galileje. Tam ho spatříte, jak vám řekl.“\r\n8A tak vyšly ven a utekly od hrobu strachy bez sebe. A nikomu nic neřekly, protože se bály.', 2, 0);

-- --------------------------------------------------------

--
-- Struktura tabulky `jmena_nedeli`
--

CREATE TABLE `jmena_nedeli` (
  `id` int(11) NOT NULL,
  `nazev` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Vypisuji data pro tabulku `jmena_nedeli`
--

INSERT INTO `jmena_nedeli` (`id`, `nazev`) VALUES
(21, 'O zlých vinařích');

-- --------------------------------------------------------

--
-- Struktura tabulky `tz`
--

CREATE TABLE `tz` (
  `id` int(11) NOT NULL,
  `text` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `tz`
--

INSERT INTO `tz` (`id`, `text`) VALUES
(140, '«Мария же избрала благую часть» (Лк. 10, 42). Успение Божией Матери представляет благий конец сего избрания. Сам Спаситель в успении ее принял в руки Свои ее душу. Того же сподоблялись и многие святые; тоже встречают в разных видах и степенях и все избиратели благой части. В час избрания упованием только прозревается этот конец, а в некоторой степени даже предощущается; но потом труды, борения и себя принуждения следуют одни за другими и мрачат избранный путь. Путеводною звездою остается благой конец благой части. Это тоже, что вдали светящийся огонек для путника, застигнутого темнотою. Упование – возбудитель энергии и поддержатель терпения и постоянства в начатом, а само оно крепко верою. По вере избирают, упованием бывают твердыми в избрании, а терпением достигают благого конца.');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `denni_cteni`
--
ALTER TABLE `denni_cteni`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `jmena_nedeli`
--
ALTER TABLE `jmena_nedeli`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `tz`
--
ALTER TABLE `tz`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `denni_cteni`
--
ALTER TABLE `denni_cteni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
