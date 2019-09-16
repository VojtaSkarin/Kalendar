-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Pon 16. zář 2019, 23:10
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
  `text` varchar(1500) NOT NULL,
  `bible` int(11) DEFAULT NULL,
  `cas` int(11) DEFAULT NULL,
  `typ` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `denni_cteni`
--

INSERT INTO `denni_cteni` (`id`, `den`, `adresa`, `text`, `bible`, `cas`, `typ`) VALUES
(1, 140, '1. Kor. XVI, 13-24.', '13Bděte, stůjte ve víře, buďte stateční, buďte silní. 14Všechno ať se mezi vámi děje v lásce.\r\n15Bratři, víte, že Štěpánova rodina je prvním ovocem Řecka a že se vydali službě svatým. Prosím vás tedy, 16abyste takové lidi následovali, a stejně tak i každého, kdo se podílí na tomto díle. 17Mám velikou radost, že dorazil Štěpán, Fortunát a Achaikos, protože mi vynahradili vaši nepřítomnost. 18Občerstvili mě na duchu a jistě i vás. Takových lidí si važte.\r\n19Pozdravují vás sbory v Asii. Velmi vás v Pánu pozdravuje Akvila s Priscillou i církev u nich v domě. 20Pozdravují vás všichni sourozenci. Pozdravte se navzájem svatým polibkem.\r\n21JÁ PAVEL PŘIDÁVÁM POZDRAV SVOU VLASTNÍ RUKOU.\r\n22Kdo nemá rád Pána, ať je proklet. Maranatha!\r\n23Milost Pána Ježíše s vámi.\r\n24Má láska je s vámi všemi v Kristu Ježíši.', 2, 1, 0),
(2, 140, 'Mat. XXI, 33-42.', '33„Poslechněte si další podobenství: Jeden hospodář vysadil vinici, obehnal ji plotem, vykopal v ní lis a postavil věž. Pak ji pronajal vinařům a vydal se na cestu. 34Když se přiblížil čas vinobraní, poslal k vinařům své služebníky, aby převzali její úrodu. 35Vinaři se těch služebníků chopili a jednoho ztloukli, jiného zabili a dalšího kamenovali. 36Poslal tedy ještě jiné služebníky, více než předtím, a těm udělali totéž.\r\n37Nakonec k nim poslal svého syna. Řekl si: ‚Před mým synem se zastydí.‘ 38Když ale vinaři toho syna uviděli, řekli si: ‚Tohle je dědic. Pojďme ho zabít a zmocnit se dědictví!‘ 39Chopili se ho, vyvlekli z vinice ven a zabili. 40Co tedy pán vinice udělá s oněmi vinaři, až přijde?“\r\n41Odpověděli mu: „Ty zlosyny zle zahubí a vinici pronajme jiným vinařům, kteří mu budou odevzdávat ovoce v čas sklizně.“\r\n42Ježíš jim řekl: „Nikdy jste nečetli v Písmech?\r\n‚Kámen staviteli zavržený\r\nstal se kamenem úhelným.\r\nSám Hospodin to učinil\r\na v našich očích je to div.‘', 2, 1, 1),
(3, 140, 'Mar. XVI, 1-8.', '1Když skončila sobota, Marie Magdaléna, Marie Jakubova a Salome nakoupily vonné masti, aby mohly jít a pomazat Ježíše. 2Za svítání prvního dne v týdnu, jakmile vyšlo slunce, šly k hrobu. 3Říkaly si: „Kdo nám odvalí kámen od vchodu?“\r\n4Když ale vzhlédly, spatřily, že kámen je odvalen (přestože byl velmi veliký). 5Vešly do hrobu, a když vpravo uviděly sedět mladíka oblečeného bílým rouchem, hrozně se vylekaly.\r\n6On jim však řekl: „Nelekejte se. Hledáte ukřižovaného Ježíše z Nazaretu. Vstal, není tu. Podívejte se, kam ho položili. 7Jděte a řekněte jeho učedníkům i Petrovi, že vás předchází do Galileje. Tam ho spatříte, jak vám řekl.“\r\n8A tak vyšly ven a utekly od hrobu strachy bez sebe. A nikomu nic neřekly, protože se bály.', 2, 0, 1),
(4, 141, '2. Kor. XII, 10-19.', '10S radostí snáším slabosti, příkoří, strádání, pronásledování a úzkosti pro Krista – vždyť má síla je v mé slabosti!\r\nZáleží mi na vás\r\n11Dělám tu ze sebe blázna, ale vy jste mě k tomu donutili. Mohli jste mě přece chválit sami – i když nic neznamenám, s těmi veleapoštoly si v ničem nezadám. 12Důkazů o mém apoštolství jste dostali dost. Vzpomeňte na všechno, co jsem vydržel, na všechna znamení, divy a zázraky. 13O co jste přišli oproti jiným církvím? Jen o to, že jsem vám nebyl na obtíž – odpusťte mi tu křivdu!\r\n14Právě se k vám chystám už potřetí a ani tentokrát vám nebudu na obtíž. Nestojím o vaše peníze, ale o vás! Děti přece nemají vydržovat rodiče, ale rodiče děti. 15Pokud jde o mě, milerád se vydám z posledního, i sám sebe vydám za vaše životy, i když čím více vás miluji, tím méně jsem milován.\r\n16Budiž, nikdy jsem vás nezatěžoval. Jako chytrák jsem vás prý ale obelstil! 17Jak asi? Podvedl jsem vás skrze někoho, koho jsem k vám poslal? 18Požádal jsem o pomoc Tita a poslal jsem s ním jednoho bratra. Že by vás podvedl Titus? Nejednali jsme ve stejném duchu? Nešli jsme ve stejných šlépějích?\r\n19Myslíte, že se před vámi celou dobu hájíme? Milovaní, my mluvíme před Boží tváří v Kristu, a to všechno pro vaši posilu.', 2, 2, 0),
(6, 141, 'Mar. IV, 10-23.', '10Jakmile byl o samotě, ti, kdo byli s ním, se ho spolu s Dvanácti ptali na ta podobenství. 11„Vám je svěřeno tajemství Božího království,“ odpověděl jim, „ale těm, kdo jsou vně, se to všechno děje v podobenstvích, 12aby\r\n‚hleděli a hleděli, ale nechápali,\r\nposlouchali a slyšeli, ale nerozuměli,\r\naby se snad neobrátili\r\na nebylo jim odpuštěno.‘“\r\n\r\n13Tehdy jim řekl: „Vy to podobenství nechápete? A jak porozumíte všem ostatním podobenstvím? 14Rozsévač rozsévá Slovo. 15Ti, kterým se rozsévá Slovo podél cesty, jsou tito: Jakmile uslyší, ihned přichází satan a bere Slovo, které do nich bylo zaseto. 16Ti, kterým se seje na skalnatou půdu, jsou pak tito: Jakmile uslyší Slovo, hned je s radostí přijímají, 17ale nemají v sobě kořen a jsou nestálí. Když potom kvůli Slovu nastane soužení nebo pronásledování, hned odpadají. 18Další jsou ti, kterým se seje do trní: To jsou ti, kteří slyší Slovo, 19ale pak přicházejí starosti tohoto světa, oklamání bohatstvím a chtivost po dalších věcech a dusí Slovo, takže se stává neplodným. 20A pak jsou ti, u kterých se seje na dobré půdě: Slyší Slovo, přijímají je a přinášejí úrodu – jeden třicetinásobnou, jiný šedesátinásobnou a jiný stonásobnou.“\r\nJiná podobenství o Království\r\n21Dále jim řekl: „Přináší se snad lampa, aby ji postavili pod vědro nebo pod postel? Nemá se postavit na svícen? 22Není totiž nic skrytého, co by nemělo být zjeveno, ani nic tak utajeného, aby to nevyšlo najevo. 23Má-li kdo uši k slyšení, slyš!“', 2, 2, 1);

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
  `text` varchar(1300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `tz`
--

INSERT INTO `tz` (`id`, `text`) VALUES
(140, '(1Кор. 16, 13–24; Мф.21, 33–42). “Мария же избрала благую часть” (Лк. 10, 42). Успение Божией Матери представляет благий конец сего избрания. Сам Спаситель в успении ее принял в руки Свои ее душу. Того же сподоблялись и многие святые; тоже встречают в разных видах и степенях и все избиратели благой части. В час избрания упованием только прозревается этот конец, а в некоторой степени даже предощущается; но потом труды, борения и себя принуждения следуют одни за другими и мрачат избранный путь. Путеводною звездою остается благой конец благой части. Это тоже, что вдали светящийся огонек для путника, застигнутого темнотою. Упование — возбудитель энергии и поддержатель терпения и постоянства в начатом, а само оно крепко верою. По вере избирают, упованием бывают твердыми в избрании, а терпением достигают благого конца,'),
(141, 'Понедельник. (2Кор. 12, 10–19; Мк.4, 10–23). Вдунул Бог дыхание жизни, и стал человек по образу Божию. То же и в возрождении: дуновением Духа Божия, который неведомо откуда и как приходит, полагаются начала новой жизни и восстановляется образ. Это — точка отправления; отсюда начинается труд возведения образа в совершенное подобие. Возрожденный по образу Создавшего Господним Духом преобразуется от славы в славу, но не без нас; наш труд и старание, а созидает и возрождении: дуновением Духа Божия, Который неведомо откуда. Вот идеал и способ осуществления в себе образа и подобия Божия! А сколько пишут и толкуют о воспитании! Между тем, в слове Божием все оно определено несколькими словами. Возьмись только осуществить предписанное, и воспитание само собою пойдет успешно к цели. Это Божий путь; но он не исключает путей человеческих, напротив, дает им направление и венчает успех. Когда же остается одно человеческое, тогда воспитание обыкновенно бывает недостаточно, с ущербом, а нередко и совсем извращает воспитываемых; затем дальше и жизнь вся идет криво. Где умножаются криво воспитанные, там и все общество более и более начинает кривиться, и в жизни, и в воззрениях своих. Конец — всеобщее искривление: кто гнет в одну сторону, кто в другую.');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
