-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Čtv 19. zář 2019, 15:27
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
-- Struktura tabulky `denni_cteni_k`
--

CREATE TABLE `denni_cteni_k` (
  `id` int(11) NOT NULL,
  `den` int(11) NOT NULL,
  `mesic` int(11) NOT NULL,
  `adresa` varchar(30) NOT NULL,
  `text` varchar(1500) NOT NULL,
  `bible` int(11) NOT NULL,
  `cas` int(11) NOT NULL,
  `typ` int(11) NOT NULL,
  `zacalo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `denni_cteni_k`
--

INSERT INTO `denni_cteni_k` (`id`, `den`, `mesic`, `adresa`, `text`, `bible`, `cas`, `typ`, `zacalo`) VALUES
(1, 5, 9, 'Žid VI, 13-20.', '13Když totiž Bůh dával zaslíbení Abrahamovi, neměl, při kom větším by přísahal, a tak přísahal sám při sobě:\\r\\n14„Jistě ti nesmírně požehnám\\r\\na nesmírně tě rozmnožím.“\\r\\n\\r\\n15Abraham pak díky trpělivosti dosáhl zaslíbení.\\r\\n16Lidé vždy přísahají při někom vyšším a přísaha je pro ně potvrzením, o němž nemůže být spor. 17Bůh ovšem chtěl dědicům zaslíbení přesvědčivě ukázat nezvratnost svého rozhodnutí, a tak svůj slib stvrdil přísahou. 18A protože je nemožné, aby Bůh lhal, stávají se tyto dvě nezvratné věci mocným povzbuzením pro nás, kdo jsme našli útočiště v nabídnuté naději.\\r\\n19Tuto naději máme jako kotvu duše, bezpečnou, pevnou a sahající až dovnitř za oponu, 20kam za nás vstoupil náš předchůdce Ježíš, který se na věky stal veleknězem podle Melchisedechova řádu.', 2, 3, 0, 314),
(2, 5, 9, 'Mat. XXIII, 29-39.', '28(29)Běda vám, znalci Písma a farizeové! Pokrytci, stavíte hroby prorokům, zdobíte náhrobky spravedlivých 29a(30) říkáte: ‚Kdybychom žili za dnů našich otců, neprolévali bychom s nimi krev proroků.‘ 30(31)Tím sami sebe usvědčujete jako syny těch, kdo vraždili proroky. 31(32)Dovršte tedy dílo svých otců! 32(33)Hadi! Plemeno zmijí! Jak byste mohli uniknout pekelnému trestu?\r\n33(34)Pohleďte, proto k vám posílám proroky, mudrce a učitele Písma. Vy některé zabijete a ukřižujete, jiné budete bičovat ve svých shromážděních a pronásledovat je od města k městu. 34(35)Tak na vás padne veškerá spravedlivá krev prolitá na zemi – od krve spravedlivého Ábela až po krev Zachariáše, syna Berechiášova, kterého jste zavraždili mezi svatyní a oltářem. 35(36)Amen, říkám vám, že to všechno padne na toto pokolení!\r\n36(37)Jeruzaléme, Jeruzaléme, který zabíjíš proroky a kamenuješ ty, kdo jsou k tobě posíláni! Kolikrát jsem chtěl shromáždit tvé děti, jako slepice shromažďuje svá kuřata pod křídla, ale nechtěli jste. 37(38)Hle, váš dům vám teď zůstane pustý. 38(39)Říkám vám, že od této chvíle mě neuvidíte, dokud neřeknete: ‚Požehnaný, jenž přichází v Hospodinově jménu!‘“', 2, 3, 1, 96),
(3, 6, 9, 'Žid II, 2-10.', '2Jestliže už slovo, které zvěstovali andělé, bylo závazné, takže každý přestupek a každou neposlušnost stihl spravedlivý trest, 3jak bychom tedy unikli my, kdybychom opomíjeli takovéto spasení? Na počátku je zvěstoval sám Pán a nám je potvrdili ti, kteří jej slýchali, 4což Bůh podle své vůle zároveň dosvědčoval znameními a divy, různými zázraky a udílením Ducha svatého.\r\n5Ten budoucí svět, o němž mluvíme, Bůh nesvěřil andělům. 6Písmo na jednom místě prohlašuje:\r\n„Co je člověk, že na něj pamatuješ,\r\nco je lidský tvor, že tě zajímá?\r\n7O málo nižším než anděly jsi jej stvořil,\r\nslávou a ctí jsi korunoval jej,\r\n8k jeho nohám jsi složil vše.“\r\n\r\nKdyž tedy vše položil do jeho moci, nezbylo nic, co by mu nepoddal. Teď ovšem ještě nevidíme, že by vše bylo v jeho moci. 9Vidíme ale Ježíše – který se stal o málo nižším než andělé – jak je nyní pro utrpení smrti korunován slávou a ctí, neboť z Boží milosti zakusil smrt za nás za všechny.\r\nKristovi sourozenci\r\n10Ten, pro něhož a skrze něhož je všechno, se totiž rozhodl přivést mnoho synů do slávy, a tak považoval za vhodné přivést původce jejich spasení k cíli skrze utrpení.', 2, 3, 0, 305),
(4, 6, 9, 'Luk. X, 16-22.', '16Kdo vám naslouchá, naslouchá mně. Kdo vás odmítá, odmítá mě. Kdo odmítá mě, odmítá Toho, který mě poslal.“\r\nVaše jména jsou v nebesích\r\n17Když se těch dvaasedmdesát vrátilo, radostně mu říkali: „Pane, i démoni se nám poddávají ve tvém jménu!“\r\n18Odpověděl jim: „Viděl jsem, jak satan spadl z nebe jako blesk. 19Hle, uděluji vám moc šlapat po hadech a štírech i po veškeré síle nepřítele a vůbec nic vám neublíží. 20Neradujte se ale z toho, že se vám poddávají duchové; radujte se, že vaše jména jsou zapsána v nebesích.“\r\n21V tu chvíli se Ježíš rozveselil v Duchu svatém a řekl: „Chválím tě, Otče, Pane nebe i země, že jsi tyto věci skryl před moudrými a rozumnými a zjevil jsi je nemluvňatům. Jistě, Otče, neboť tak se ti zalíbilo.\r\n22Všechno je mi dáno od mého Otce a nikdo neví, kdo je Syn, jedině Otec, a kdo je Otec, jedině Syn a ten, komu by ho Syn chtěl zjevit.“', 2, 3, 1, 51);

-- --------------------------------------------------------

--
-- Struktura tabulky `denni_cteni_p`
--

CREATE TABLE `denni_cteni_p` (
  `id` int(11) NOT NULL,
  `den` int(11) DEFAULT NULL,
  `adresa` varchar(30) DEFAULT NULL,
  `text` varchar(2000) NOT NULL,
  `bible` int(11) DEFAULT NULL,
  `cas` int(11) DEFAULT NULL,
  `typ` int(11) DEFAULT NULL,
  `zacalo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `denni_cteni_p`
--

INSERT INTO `denni_cteni_p` (`id`, `den`, `adresa`, `text`, `bible`, `cas`, `typ`, `zacalo`) VALUES
(1, 140, '1. Kor. XVI, 13-24.', '13Bděte, stůjte ve víře, buďte stateční, buďte silní. 14Všechno ať se mezi vámi děje v lásce.\r\n15Bratři, víte, že Štěpánova rodina je prvním ovocem Řecka a že se vydali službě svatým. Prosím vás tedy, 16abyste takové lidi následovali, a stejně tak i každého, kdo se podílí na tomto díle. 17Mám velikou radost, že dorazil Štěpán, Fortunát a Achaikos, protože mi vynahradili vaši nepřítomnost. 18Občerstvili mě na duchu a jistě i vás. Takových lidí si važte.\r\n19Pozdravují vás sbory v Asii. Velmi vás v Pánu pozdravuje Akvila s Priscillou i církev u nich v domě. 20Pozdravují vás všichni sourozenci. Pozdravte se navzájem svatým polibkem.\r\n21JÁ PAVEL PŘIDÁVÁM POZDRAV SVOU VLASTNÍ RUKOU.\r\n22Kdo nemá rád Pána, ať je proklet. Maranatha!\r\n23Milost Pána Ježíše s vámi.\r\n24Má láska je s vámi všemi v Kristu Ježíši.', 2, 1, 0, 166),
(2, 140, 'Mat. XXI, 33-42.', '33„Poslechněte si další podobenství: Jeden hospodář vysadil vinici, obehnal ji plotem, vykopal v ní lis a postavil věž. Pak ji pronajal vinařům a vydal se na cestu. 34Když se přiblížil čas vinobraní, poslal k vinařům své služebníky, aby převzali její úrodu. 35Vinaři se těch služebníků chopili a jednoho ztloukli, jiného zabili a dalšího kamenovali. 36Poslal tedy ještě jiné služebníky, více než předtím, a těm udělali totéž.\r\n37Nakonec k nim poslal svého syna. Řekl si: ‚Před mým synem se zastydí.‘ 38Když ale vinaři toho syna uviděli, řekli si: ‚Tohle je dědic. Pojďme ho zabít a zmocnit se dědictví!‘ 39Chopili se ho, vyvlekli z vinice ven a zabili. 40Co tedy pán vinice udělá s oněmi vinaři, až přijde?“\r\n41Odpověděli mu: „Ty zlosyny zle zahubí a vinici pronajme jiným vinařům, kteří mu budou odevzdávat ovoce v čas sklizně.“\r\n42Ježíš jim řekl: „Nikdy jste nečetli v Písmech?\r\n‚Kámen staviteli zavržený\r\nstal se kamenem úhelným.\r\nSám Hospodin to učinil\r\na v našich očích je to div.‘', 2, 1, 1, 87),
(3, 140, 'Mar. XVI, 1-8.', '1Když skončila sobota, Marie Magdaléna, Marie Jakubova a Salome nakoupily vonné masti, aby mohly jít a pomazat Ježíše. 2Za svítání prvního dne v týdnu, jakmile vyšlo slunce, šly k hrobu. 3Říkaly si: „Kdo nám odvalí kámen od vchodu?“\r\n4Když ale vzhlédly, spatřily, že kámen je odvalen (přestože byl velmi veliký). 5Vešly do hrobu, a když vpravo uviděly sedět mladíka oblečeného bílým rouchem, hrozně se vylekaly.\r\n6On jim však řekl: „Nelekejte se. Hledáte ukřižovaného Ježíše z Nazaretu. Vstal, není tu. Podívejte se, kam ho položili. 7Jděte a řekněte jeho učedníkům i Petrovi, že vás předchází do Galileje. Tam ho spatříte, jak vám řekl.“\r\n8A tak vyšly ven a utekly od hrobu strachy bez sebe. A nikomu nic neřekly, protože se bály.', 2, 0, 1, 70),
(4, 141, '2. Kor. XII, 10-19.', '10S radostí snáším slabosti, příkoří, strádání, pronásledování a úzkosti pro Krista – vždyť má síla je v mé slabosti!\r\nZáleží mi na vás\r\n11Dělám tu ze sebe blázna, ale vy jste mě k tomu donutili. Mohli jste mě přece chválit sami – i když nic neznamenám, s těmi veleapoštoly si v ničem nezadám. 12Důkazů o mém apoštolství jste dostali dost. Vzpomeňte na všechno, co jsem vydržel, na všechna znamení, divy a zázraky. 13O co jste přišli oproti jiným církvím? Jen o to, že jsem vám nebyl na obtíž – odpusťte mi tu křivdu!\r\n14Právě se k vám chystám už potřetí a ani tentokrát vám nebudu na obtíž. Nestojím o vaše peníze, ale o vás! Děti přece nemají vydržovat rodiče, ale rodiče děti. 15Pokud jde o mě, milerád se vydám z posledního, i sám sebe vydám za vaše životy, i když čím více vás miluji, tím méně jsem milován.\r\n16Budiž, nikdy jsem vás nezatěžoval. Jako chytrák jsem vás prý ale obelstil! 17Jak asi? Podvedl jsem vás skrze někoho, koho jsem k vám poslal? 18Požádal jsem o pomoc Tita a poslal jsem s ním jednoho bratra. Že by vás podvedl Titus? Nejednali jsme ve stejném duchu? Nešli jsme ve stejných šlépějích?\r\n19Myslíte, že se před vámi celou dobu hájíme? Milovaní, my mluvíme před Boží tváří v Kristu, a to všechno pro vaši posilu.', 2, 2, 0, 195),
(6, 141, 'Mar. IV, 10-23.', '10Jakmile byl o samotě, ti, kdo byli s ním, se ho spolu s Dvanácti ptali na ta podobenství. 11„Vám je svěřeno tajemství Božího království,“ odpověděl jim, „ale těm, kdo jsou vně, se to všechno děje v podobenstvích, 12aby\r\n‚hleděli a hleděli, ale nechápali,\r\nposlouchali a slyšeli, ale nerozuměli,\r\naby se snad neobrátili\r\na nebylo jim odpuštěno.‘“\r\n\r\n13Tehdy jim řekl: „Vy to podobenství nechápete? A jak porozumíte všem ostatním podobenstvím? 14Rozsévač rozsévá Slovo. 15Ti, kterým se rozsévá Slovo podél cesty, jsou tito: Jakmile uslyší, ihned přichází satan a bere Slovo, které do nich bylo zaseto. 16Ti, kterým se seje na skalnatou půdu, jsou pak tito: Jakmile uslyší Slovo, hned je s radostí přijímají, 17ale nemají v sobě kořen a jsou nestálí. Když potom kvůli Slovu nastane soužení nebo pronásledování, hned odpadají. 18Další jsou ti, kterým se seje do trní: To jsou ti, kteří slyší Slovo, 19ale pak přicházejí starosti tohoto světa, oklamání bohatstvím a chtivost po dalších věcech a dusí Slovo, takže se stává neplodným. 20A pak jsou ti, u kterých se seje na dobré půdě: Slyší Slovo, přijímají je a přinášejí úrodu – jeden třicetinásobnou, jiný šedesátinásobnou a jiný stonásobnou.“\r\nJiná podobenství o Království\r\n21Dále jim řekl: „Přináší se snad lampa, aby ji postavili pod vědro nebo pod postel? Nemá se postavit na svícen? 22Není totiž nic skrytého, co by nemělo být zjeveno, ani nic tak utajeného, aby to nevyšlo najevo. 23Má-li kdo uši k slyšení, slyš!“', 2, 2, 1, 16),
(7, 142, '2. Kor. XII, 20-XIII, 2.', '20Bojím se totiž, abych z vás, až přijdu, nebyl zklamaný a také vy abyste nebyli zklamaní ze mě. Bojím se svárů, nevraživosti, zloby, soupeření, urážek, pomluv, zpupnosti a zmatků. 21Bojím se, aby mě můj Bůh, až přijdu, před vámi znovu neponížil, kdybych musel truchlit nad tolika dřívějšími hříšníky, kteří nečinili pokání z nečistoty, smilstva a nestydatosti, kterou páchali.\r\n13\r\nSpějte k dokonalosti\r\n1Toto bude má třetí návštěva u vás. „Každé slovo potvrdí výpověď dvou nebo tří svědků.“ 2Co jsem řekl, když jsem byl u vás podruhé, to teď opakuji, když jsem pryč: Až se k vám vrátím, nebudu brát ohled na ty, kdo zůstali v hříchu, ani na nikoho jiného.', 2, 2, 0, 196),
(8, 142, 'Mar. IV, 24-34.', '24Řekl jim také: „Dávejte pozor na to, co posloucháte. Jakou mírou měříte, takovou vám bude odměřeno a ještě vám bude přidáno. 25Tomu, kdo má, bude dáno, ale tomu, kdo nemá, bude vzato i to, co má.“\r\n26Potom řekl: „Boží království působí, jako když člověk hodí zrno na zem. 27Spí a vstává ve dne i v noci a to zrno klíčí a roste, a on ani neví jak. 28Země totiž plodí úrodu sama od sebe – nejdříve stéblo, potom klas a potom zralé obilí v klasu. 29A když úroda dozraje, ihned se chopí srpu, protože nastala žeň.“\r\n30Řekl také: „K čemu přirovnáme Boží království? Jakým podobenstvím ho představíme? 31Je jako zrnko hořčice, které když je zaseto do země, je nejmenší ze všech semen na zemi. 32Jakmile je však zaseto, roste, až je větší než všechny byliny, a vypouští mohutné větve, takže i ptáci mohou hnízdit v jeho stínu.“\r\n33Přinášel jim Slovo v mnoha takových podobenstvích, nakolik byli schopni rozumět. 34Nemluvil k nim jinak než v podobenstvích, ale svým učedníkům všechno v soukromí vysvětloval.', 2, 2, 1, 17),
(9, 143, '2. Kor. XIII, 3-13.', '3Žádáte přece důkaz, že ve mně mluví Kristus. Ten vůči vám není slabý – naopak je mezi vámi mocný! 4Byl sice ukřižován jako slabý, ale teď žije Boží mocí; i my jsme v něm slabí, ale pro vás s ním budeme žít Boží mocí.\r\n5Sami sebe prověřujte, přesvědčujte se, zda jste sami ve víře. Nepoznáváte sami na sobě, že je ve vás Ježíš Kristus? Pokud ne, pak jste ovšem selhali. 6Doufám, že poznáte, že my jsme neselhali.\r\n7Modlím se k Bohu, abyste se nezachovali špatně. Nejde mi o to, aby se ukázal náš vlastní úspěch – budu raději, když se budete chovat správně a my budeme jako ti, kdo selhali. 8Nemůžeme přece stát proti pravdě, jedině za pravdou. 9Rádi budeme slabí, jen když vy budete silní; proto se modlíme za vaši nápravu. 10Toto vám píšu, zatímco jsem pryč, abych až budu u vás, nemusel přísně užít té pravomoci, kterou mi Pán dal k budování, a ne k boření.\r\n11Závěrem, bratři, buďte zdrávi. Spějte k dokonalosti, povzbuzujte se, buďte svorní, žijte v pokoji, a Bůh lásky a pokoje bude s vámi.\r\n12(12a)Pozdravte se navzájem svatým polibkem. 13(12b)Pozdravují vás všichni svatí. 14(13)Milost Pána Ježíše Krista, Boží láska a společenství Ducha svatého s vámi všemi.', 2, 2, 0, 197),
(10, 143, 'Mar. IV, 35-41.', '35Večer onoho dne jim řekl: „Přeplavme se na druhou stranu.“ 36Opustili tedy zástup a vzali ho, jak byl, na loďku. Byly s ním i jiné loďky. 37Tehdy se strhla veliká větrná bouře. Vlny se valily na loď a ta se už naplňovala vodou.\r\n38On ale spal na polštáři na lodní zádi. Vzbudili ho tedy: „Mistře, nezajímá tě, že umíráme?“\r\n39Když se probudil, okřikl vítr a přikázal vlnám: „Tiše, klid!“ Vítr se utišil a nastal naprostý klid.\r\n40„Proč se tak bojíte?“ řekl jim pak. „Ještě pořád nemáte víru?“\r\n41Byli z toho úplně vyděšení. „Kdo to vůbec je?“ ptali se jeden druhého. „Vždyť ho poslouchá i vítr a vlny!“', 2, 2, 1, 18),
(12, 144, 'Gal. I, 1-10, 20-II, 5.', '1Pavel, apoštol (poslaný ne od lidí ani skrze člověka, ale skrze Ježíše Krista a Boha Otce, který ho vzkřísil z mrtvých), 2a všichni bratři, kteří jsou se mnou,\\r\\ncírkvím v Galacii: 3Milost vám a pokoj od Boha, našeho Otce, a od Pána Ježíše Krista, 4který dal sám sebe za naše hříchy, aby nás vysvobodil z nynějšího zlého věku podle vůle našeho Boha a Otce, 5jemuž buď sláva na věky věků. Amen.\\r\\nŽádné jiné evangelium\\r\\n6Žasnu, jak rychle se uchylujete od Toho, který vás povolal Kristovou milostí, k jinému evangeliu. 7Žádné jiné evangelium ale není; to se vás jen snaží zmást ti, kdo chtějí převrátit evangelium Kristovo. 8Kdyby vám kdokoli – ať už my sami nebo třeba anděl z nebe – kázal jiné evangelium než to, které jsme vám kázali, ať je proklet! 9Znovu opakuji, co jsme už řekli: Pokud vám někdo káže jiné evangelium než to, které jste přijali, ať je proklet!\\r\\n10Chci si teď naklonit lidi, nebo Boha? Copak mi jde o lidskou přízeň? Kdybych se ještě snažil zalíbit lidem, nebyl bych Kristův služebník! 20Bůh je mi svědek, že vám nepíšu žádnou lež!\\r\\n21Poté jsem odešel do Sýrie a Kilikie. 22V judských církvích, které jsou v Kristu, mě osobně vůbec neznali. 23Slyšeli jen, že „náš dřívější pronásledovatel teď káže víru, kterou předtím potíral,“ 24a oslavovali kvůli mně Boha.\\r\\n2\\r\\nBůh nikomu nestraní\\r\\n1Po čtrnácti letech jsem se pak vrátil do Jeruzaléma s Barnabášem a vzal jsem s sebou i Tita. 2Přišel jsem tehdy na základě zjevení. Sešel jsem se soukromě s váženými vůdci a seznámil je s evangeliem, které kážu mezi pohany, aby snad můj dosavadní ani další běh nebyl zbytečný. 3Žádnou obřízku tehdy nikdo nevnucoval ani mému řeckému společníku Titovi. 4To jen ti vetřelci, ti falešní bratři se mezi nás vloudili, aby vyslídili svobodu, kterou máme v Kristu Ježíši, a aby nás zotročili. 5Ani na chvíli jsme jim neustoupili a nepoddali se, aby pro vás byla zachována pravda evangelia.', 2, 2, 0, 198),
(13, 144, 'Mar. V, 1-20.', '1Tehdy se přeplavili přes jezero do gerasenského kraje. 2Jakmile vystoupil z lodi, ihned proti němu z hrobů vyšel člověk posedlý nečistým duchem. 3Bydlel v hrobech a nikdo ho už nemohl ani svázat řetězem. 4Předtím býval často spoután okovy a řetězy, ale on ty řetězy vždy roztrhal a okovy rozlámal, takže ho nikdo nemohl zkrotit. 5Pořád, ve dne i v noci, byl v hrobkách a na horách, křičel a tloukl se kamením.\r\n6Jakmile z dálky uviděl Ježíše, přiběhl a padl před ním na kolena. 7Hlasitě vykřikl: „Co je ti do mě, Ježíši, Synu Nejvyššího Boha? Pro Boha tě zapřísahám, netrýzni mě!“ 8(Ježíš mu totiž řekl: „Vyjdi z toho člověka, nečistý duchu!“)\r\n9„Jak se jmenuješ?“ ptal se ho Ježíš.\r\n„Mé jméno je Legie,“ odpověděl. „Je nás totiž hodně.“ 10A velice ho prosil, ať je nevyhání z toho kraje.\r\n11Na úbočí hory se tam páslo veliké stádo prasat. 12Démoni ho proto prosili: „Pusť nás do těch prasat, ať vejdeme do nich!“ 13Ježíš jim to povolil, a tak ti nečistí duchové vyšli a vstoupili do prasat. Asi dvoutisícové stádo se jich pak rozběhlo ze srázu dolů do jezera, kde utonulo.\r\n14Pasáci tehdy utekli a rozhlásili to ve městě i na venkově. Lidé se šli podívat, co se to stalo. 15Když přišli k Ježíšovi a viděli toho, který býval posedlý tou Legií, jak tam sedí oblečen a při zdravém rozumu, dostali strach. 16Jakmile jim očití svědkové vylíčili, jak to bylo s tím posedlým a s těmi prasaty, 17začali ho prosit, ať opustí jejich kraj.\r\n18Když pak nastupoval na loď, žádal ho ten, který býval posedlý, aby s ním mohl zůstat. 19On mu to ale nedovolil. Řekl mu: „Jdi domů ke svým a vypravuj jim, jak veliké věci pro tebe udělal Pán a jak se nad tebou slitoval.“ 20Odešel tedy a začal v Dekapoli rozhlašovat, co všechno pro něj Ježíš udělal. Všichni byli ohromeni.', 2, 2, 1, 19);

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
-- Struktura tabulky `svati_dne`
--

CREATE TABLE `svati_dne` (
  `id` int(11) NOT NULL,
  `jmeno` varchar(150) NOT NULL,
  `den` int(10) UNSIGNED NOT NULL,
  `mesic` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `svati_dne`
--

INSERT INTO `svati_dne` (`id`, `jmeno`, `den`, `mesic`) VALUES
(1, 'Svatý prorok Zachariáš a svatá spravedlivá Elizabeta', 5, 9),
(2, 'Svatý ctihodný Afanasij, igumen Brestský', 5, 9),
(3, 'Svatý oddaný kníže Gleb, pokřtěný David, jeho pokrevní bratr Boris, pokřtěný Roman, synové knížete Vladimíra Kyjevského, pokřtěného Vasilije', 5, 9),
(4, 'Vzpomínka starého zázraku v Kolosách, který byl v Chonech, od Arcistratéga Michaela', 6, 9),
(5, 'Svatý mučedník Evdoksij a s ním trpící Zinon a Makarij', 6, 9),
(6, 'Náš ctihodný otec Archip', 6, 9);

-- --------------------------------------------------------

--
-- Struktura tabulky `tz`
--

CREATE TABLE `tz` (
  `id` int(11) NOT NULL,
  `text` varchar(1700) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Vypisuji data pro tabulku `tz`
--

INSERT INTO `tz` (`id`, `text`) VALUES
(140, '(1Кор. 16, 13–24; Мф.21, 33–42). “Мария же избрала благую часть” (Лк. 10, 42). Успение Божией Матери представляет благий конец сего избрания. Сам Спаситель в успении ее принял в руки Свои ее душу. Того же сподоблялись и многие святые; тоже встречают в разных видах и степенях и все избиратели благой части. В час избрания упованием только прозревается этот конец, а в некоторой степени даже предощущается; но потом труды, борения и себя принуждения следуют одни за другими и мрачат избранный путь. Путеводною звездою остается благой конец благой части. Это тоже, что вдали светящийся огонек для путника, застигнутого темнотою. Упование — возбудитель энергии и поддержатель терпения и постоянства в начатом, а само оно крепко верою. По вере избирают, упованием бывают твердыми в избрании, а терпением достигают благого конца,'),
(141, 'Понедельник. (2Кор. 12, 10–19; Мк.4, 10–23). Вдунул Бог дыхание жизни, и стал человек по образу Божию. То же и в возрождении: дуновением Духа Божия, который неведомо откуда и как приходит, полагаются начала новой жизни и восстановляется образ. Это — точка отправления; отсюда начинается труд возведения образа в совершенное подобие. Возрожденный по образу Создавшего Господним Духом преобразуется от славы в славу, но не без нас; наш труд и старание, а созидает и возрождении: дуновением Духа Божия, Который неведомо откуда. Вот идеал и способ осуществления в себе образа и подобия Божия! А сколько пишут и толкуют о воспитании! Между тем, в слове Божием все оно определено несколькими словами. Возьмись только осуществить предписанное, и воспитание само собою пойдет успешно к цели. Это Божий путь; но он не исключает путей человеческих, напротив, дает им направление и венчает успех. Когда же остается одно человеческое, тогда воспитание обыкновенно бывает недостаточно, с ущербом, а нередко и совсем извращает воспитываемых; затем дальше и жизнь вся идет криво. Где умножаются криво воспитанные, там и все общество более и более начинает кривиться, и в жизни, и в воззрениях своих. Конец — всеобщее искривление: кто гнет в одну сторону, кто в другую.'),
(142, 'Вторник. (2Кор.12,20–13, 2; Мк.4, 24–34). Притча о постепенном возрастании из семени пшеницы изображает в отношении к каждому человеку постепенное возрастание потаенного в сердце человека, благодатию Божиею засеменяемого и блюдомого, а в отношении к человечеству — постепенное увеличение тела Церкви или общества спасаемых в Господе Иисусе Христе, по чину Им установленному. Этою притчею разрешается вопрос: отчего до сего времени христианство не всеобъемлюще? Как человек, бросив семя в землю, спит и встает, семя же прозябает и растет само собою без его ведома, так и Господь, положив на земле семя Божественной жизни, дал ему свободу о себе разрастаться, подчинив его естественному течению событий и не насилуя этих последних; блюдет только семя, содействует ему в частных случаях и дает общее направление. Причина этому в свободе человека. Господь ищет, чтобы человек сам себя подчинил Ему и ждет склонения его свободы; дело и длится. Если бы все зависело только от воли Божией, давно бы все были христианами. Другая мысль: созидаемое тело Церкви созидается на небе; с земли поступают только материалы, образуемые тоже небесными деятелями. Слово с неба проходит по земле и привлекает хотящих. Внявшие и последовавшие поступают, как сырцовый материал, в лабораторию Божиею, в Церковь, и здесь переделываются по образцам с неба данным. Переделанные, по исходе из этой жизни, переходят на небо и там поступают в здание Божие, каждый куда годен. Это идет непрерывно и, следовательно, дело Божие не стоит. Всеобщая торжественность христианства и не требуется для сего. Здание Божие созидается невидимо.'),
(143, 'Среда. (2Кор. 13, 3–13; Мк.4, 35–41). Ученики плывут по морю; поднимается буря и поставляет их в опасное положение, а Господь спит. Взывают к Нему: “Господи, спаси!”, и Он одним словом укрощает бурю. Другое фактическое представление порядка Божественного промышленная. И каждый человек, и народы, и Церковь — плывут по морю жизни сами, силами, в них вложенными, естественными и сверхъестественными, по порядкам, Богом заведенным. Господь почивает, хотя и пребывает среди движущихся событий; Сам же действовать начинает тогда, когда угрожает неминуемая беда, могущая уклонить направление событий, в противность Божественным Его планам. Он всюду есть, все хранит, все согревает веянием любви Своей, но действовать предоставляет Своим тварям, силами Им данными, по законам и порядкам, Им повсюду заведенным и хранимым. Он не лично вседейстующь, хотя все от Него и без Него ничего не бывает. Всегда готов Он и Сам воздействовать, когда это нужно по Его беспредельной премудрости и правде. Молитва — приемник Божиих действий. Но самая лучшая молитва: “Господи! Тебе все ведомо, сотвори со мною, как изволишь!”'),
(144, 'Четверг. (Гал.1, 1–10. 20–2, 5; Мк.5, 1–20). “Легион имя мне, потому что нас много”. Духи не телесны, потому места собою не наполняют и не занимают, подобно телам. Этим объясняется физическая возможность пребывания многих духов в одном человеке. Возможность нравственная со стороны духов понятна из их безнравственности или отсутствия всяких нравственных начал, а со стороны человека — из многостороннего соприкосновения душевным строем своим к мрачной области нечистых сил. Но этим объясняется только возможность; действительность же вселения бесов подлежит условиям, которых определить не имеем возможности. Можем только сказать, что вселение духов не всегда бывает видимым, не всегда обнаруживается известными действиями бесноватых. Есть вселение духов необнаруживаемое, скрытное; есть также власть духов над умами, помимо тела, когда они водят их, как хотят, чрез страсти, в них действующие; люди же думают, что они все сами действуют, будучи посмешищем нечистых сил. Как же быть? Будь настоящим христианином, и никакая вражеская сила не одолеет тебя.');

--
-- Klíče pro exportované tabulky
--

--
-- Klíče pro tabulku `denni_cteni_k`
--
ALTER TABLE `denni_cteni_k`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `denni_cteni_p`
--
ALTER TABLE `denni_cteni_p`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `jmena_nedeli`
--
ALTER TABLE `jmena_nedeli`
  ADD PRIMARY KEY (`id`);

--
-- Klíče pro tabulku `svati_dne`
--
ALTER TABLE `svati_dne`
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
-- AUTO_INCREMENT pro tabulku `denni_cteni_k`
--
ALTER TABLE `denni_cteni_k`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pro tabulku `denni_cteni_p`
--
ALTER TABLE `denni_cteni_p`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pro tabulku `svati_dne`
--
ALTER TABLE `svati_dne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
