--Telephely tábla létrehozása és az oszlopok, kulcsok meghatározása
CREATE TABLE Telephelyek (
    id INT NOT NULL,
    varos VARCHAR(50),
    cim VARCHAR(100),
    CONSTRAINT PK_Telephelyek PRIMARY KEY (id)
);

--Alkalmazottak tábla létrehozása és az oszlopok, kulcsok meghatározása
CREATE TABLE Alkalmazottak (
    id INT NOT NULL,
    nev VARCHAR(100),
    email VARCHAR(100),
    telefonszam VARCHAR(20),
    telephely_id INT NOT NULL,
    CONSTRAINT PK_Alkalmazottak PRIMARY KEY (id),
    CONSTRAINT FK_Alkalmazottak_Telephelyek FOREIGN KEY (telephely_id) REFERENCES Telephelyek(id)
);

--Vásárlók tábla létrehozása és az oszlopok, kulcsok meghatározása
CREATE TABLE Vasarlok (
    id INT NOT NULL,
    nev VARCHAR(100),
    email VARCHAR(100),
    telefonszam VARCHAR(20),
    CONSTRAINT PK_Vasarlok PRIMARY KEY (id)
);

--Autók tábla létrehozása és az oszlopok, kulcsok meghatározása
CREATE TABLE Autok (
    id INT NOT NULL,
    marka VARCHAR(50),
    modell VARCHAR(50),
    evjarat INT,
    szin VARCHAR(30),
    ar INT,
    telephely_id INT NOT NULL,
    CONSTRAINT PK_Autok PRIMARY KEY (id),
    CONSTRAINT FK_Autok_Telephelyek FOREIGN KEY (telephely_id) REFERENCES Telephelyek(id)
);

--Eladások tábla létrehozása és az oszlopok, kulcsok meghatározása
CREATE TABLE Eladasok (
    id INT NOT NULL,
    auto_id INT NOT NULL,
    vasarlo_id INT NOT NULL,
    alkalmazott_id INT NOT NULL,
    eladas_datum DATE,
    eladas_ar INT,
    CONSTRAINT PK_Eladasok PRIMARY KEY (id),
    CONSTRAINT FK_Eladasok_Autok FOREIGN KEY (auto_id) REFERENCES Autok(id),
    CONSTRAINT FK_Eladasok_Vasarlok FOREIGN KEY (vasarlo_id) REFERENCES Vasarlok(id),
    CONSTRAINT FK_Eladasok_Alkalmazottak FOREIGN KEY (alkalmazott_id) REFERENCES Alkalmazottak(id)
);

--Ezeket az adatokat először megcsináltuk egy Excel-be utána pedig ide bemásoltuk
--Telephely tábla feltöltése adatokkal 
INSERT INTO Telephelyek (id, varos, cim) VALUES
	('1', 'Budapest', 'Hentes u. 7, 1097'),
	('2', 'Nyíregyháza', 'Babér u. 2, 4551'),
	('3', 'Szeged', 'Vásárhelyi Pál út 13, 6724');

--Alkalmazottak tábla feltöltése adatokkal 
INSERT INTO Alkalmazottak (id, nev, email, telefonszam, telephely_id) VALUES
	('1', 'Sándor Ákos', 'akos.sandor@gmail.com', '+36 30 313 1755', '1'),
	('2', 'Tóth Zétény', 'zeteny.toth@gmail.com', '+36 20 183 7836', '3'),
	('3', 'Orsós Máté', 'mate.orsos@gmail.com', '+36 70 790 3256', '1'),
	('4', 'Kis Emma', 'emma.kis@gmail.com', '+36 20 562 5508', '1'),
	('5', 'Kozma Gábor', 'gabor.kozma@gmail.com', '+36 20 344 9807', '3'),
	('6', 'Kovács András', 'andras.kovacs@gmail.com', '+36 20 103 6910', '2'),
	('7', 'Magyar Csaba', 'csaba.magyar@gmail.com', '+36 20 653 8772', '3'),
	('8', 'Bogdán Emma', 'emma.bogdan@gmail.com', '+36 70 837 1173', '1'),
	('9', 'Bálint Nóra', 'nora.balint@gmail.com', '+36 30 362 8040', '3'),
	('10', 'Mészáros József', 'jozsef.meszaros@gmail.com', '+36 20 774 8907', '1'),
	('11', 'Jakab Benett', 'benett.jakab@gmail.com', '+36 70 476 3819', '1'),
	('12', 'Hegedűs Zsombor', 'zsombor.hegedus@gmail.com', '+36 70 110 5449', '2'),
	('13', 'Bálint Kamilla', 'kamilla.balint@gmail.com', '+36 70 849 6716', '2'),
	('14', 'Balog Gábor', 'gabor.balog@gmail.com', '+36 20 722 8813', '3'),
	('15', 'Bogdán Nóra', 'nora.bogdan@gmail.com', '+36 30 419 1733', '2'),
	('16', 'Fehér Martin', 'martin.feher@gmail.com', '+36 70 140 7750', '1'),
	('17', 'Kerekes Lili', 'lili.kerekes@gmail.com', '+36 70 211 6546', '3'),
	('18', 'Horváth Roland', 'roland.horvath@gmail.com', '+36 70 264 5241', '2'),
	('19', 'Rácz Olívia', 'olívia.racz@gmail.com', '+36 30 505 7082', '1'),
	('20', 'Vincze Patrik', 'patrik.vincze@gmail.com', '+36 30 880 1727', '3');

--Vásárlók tábla feltöltése adatokkal     
INSERT INTO Vasarlok (id, nev, email, telefonszam) VALUES
	('1', 'Tamás János', 'janos.tamas@gmail.com', '+36 20 168 7686'),
	('2', 'Soós Patrik', 'patrik.soos@gmail.com', '+36 20 169 5151'),
	('3', 'Sándor Nóra', 'nora.sandor@gmail.com', '+36 20 184 4098'),
	('4', 'Fazekas Abigél', 'abigel.fazekas@gmail.com', '+36 20 187 2248'),
	('5', 'Berki Barnabás', 'barnabas.berki@gmail.com', '+36 20 208 1906'),
	('6', 'Takács Gergő', 'gergo.takacs@gmail.com', '+36 20 214 2104'),
	('7', 'Király Flóra', 'flora.kiraly@gmail.com', '+36 20 287 4589'),
	('8', 'Bálint Sára', 'sara.balint@gmail.com', '+36 20 359 3200'),
	('9', 'Nagy Roland', 'roland.nagy@gmail.com', '+36 20 442 6570'),
	('10', 'Sárközi Hanna', 'hanna.sarkozi@gmail.com', '+36 20 507 2595'),
	('11', 'Pintér László', 'laszlo.pinter@gmail.com', '+36 20 519 4050'),
	('12', 'Jakab Nolen', 'nolen.jakab@gmail.com', '+36 20 526 3885'),
	('13', 'Bálint Zoé', 'zoe.balint@gmail.com', '+36 20 528 8482'),
	('14', 'Vincze Nóra', 'nora.vincze@gmail.com', '+36 20 554 5140'),
	('15', 'Virág Alex', 'alex.virag@gmail.com', '+36 20 570 7807'),
	('16', 'Halász Bendegúz', 'bendeguz.halasz@gmail.com', '+36 20 596 3834'),
	('17', 'Szabó Bence', 'bence.szabo@gmail.com', '+36 20 616 2083'),
	('18', 'Balázs Krisztián', 'krisztian.balazs@gmail.com', '+36 20 620 5043'),
	('19', 'Antal Mihály', 'mihaly.antal@gmail.com', '+36 20 624 1587'),
	('20', 'Jakab Janka', 'janka.jakab@gmail.com', '+36 20 629 4381'),
	('21', 'Kerekes Emma', 'emma.kerekes@gmail.com', '+36 20 629 4878'),
	('22', 'Barta Zsófia', 'zsofia.barta@gmail.com', '+36 20 646 1155'),
	('23', 'Bálint Liza', 'liza.balint@gmail.com', '+36 20 675 9588'),
	('24', 'Major Mira', 'mira.major@gmail.com', '+36 20 713 4033'),
	('25', 'Lukács Hanna', 'hanna.lukacs@gmail.com', '+36 20 721 5589'),
	('26', 'Bodnár Csongor', 'csongor.bodnar@gmail.com', '+36 20 814 4092'),
	('27', 'Sipos Nimród', 'nimrod.sipos@gmail.com', '+36 20 827 7981'),
	('28', 'Szilágyi Szofia', 'szofia.szilagyi@gmail.com', '+36 20 829 7722'),
	('29', 'Nemes Nimród', 'nimrod.nemes@gmail.com', '+36 20 846 6556'),
	('30', 'Bálint Martin', 'martin.balint@gmail.com', '+36 20 892 7306'),
	('31', 'Nemes Zsófia', 'zsofia.nemes@gmail.com', '+36 20 947 8642'),
	('32', 'Molnár Sára', 'sara.molnar@gmail.com', '+36 20 952 1253'),
	('33', 'Szőke Ármin', 'armin.szoke@gmail.com', '+36 20 986 2668'),
	('34', 'Szűcs Zétény', 'zeteny.szucs@gmail.com', '+36 30 141 8235'),
	('35', 'Barna Vince', 'vince.barna@gmail.com', '+36 30 155 4388'),
	('36', 'Magyar Jázmin', 'jazmin.magyar@gmail.com', '+36 30 157 3647'),
	('37', 'Fodor Teodor', 'teodor.fodor@gmail.com', '+36 30 157 5988'),
	('38', 'Nagy Nóra', 'nora.nagy@gmail.com', '+36 30 180 6744'),
	('39', 'Farkas Alex', 'alex.farkas@gmail.com', '+36 30 185 7273'),
	('40', 'Németh Miron', 'miron.nemeth@gmail.com', '+36 30 199 2137'),
	('41', 'Gulyás Mira', 'mira.gulyas@gmail.com', '+36 30 302 5954'),
	('42', 'Pap Bálint', 'balint.pap@gmail.com', '+36 30 322 6572'),
	('43', 'Takács Kevin', 'kevin.takacs@gmail.com', '+36 30 350 3157'),
	('44', 'Vass Kende', 'kende.vass@gmail.com', '+36 30 396 6209'),
	('45', 'Budai Jázmin', 'jazmin.budai@gmail.com', '+36 30 397 8606'),
	('46', 'László Roland', 'roland.laszlo@gmail.com', '+36 30 441 5299'),
	('47', 'Mezei Zoltán', 'zoltan.mezei@gmail.com', '+36 30 475 8107'),
	('48', 'Bogdán Miron', 'miron.bogdan@gmail.com', '+36 30 478 3964'),
	('49', 'Gulyás Gábor', 'gabor.gulyas@gmail.com', '+36 30 491 9086'),
	('50', 'Rácz Róbert', 'robert.racz@gmail.com', '+36 30 551 4324'),
	('51', 'Hegedüs Gergő', 'gergo.hegedus@gmail.com', '+36 30 551 5122'),
	('52', 'Barna Áron', 'aron.barna@gmail.com', '+36 30 555 2050'),
	('53', 'Csonka Zoé', 'zoe.csonka@gmail.com', '+36 30 570 1336'),
	('54', 'Máté Flóra', 'flora.mate@gmail.com', '+36 30 571 7718'),
	('55', 'Nagy Benjámin', 'benjamin.nagy@gmail.com', '+36 30 576 5109'),
	('56', 'Budai Marcell', 'marcell.budai@gmail.com', '+36 30 598 4107'),
	('57', 'Németh Kristóf', 'kristof.nemeth@gmail.com', '+36 30 612 4663'),
	('58', 'Balog István', 'istvan.balog@gmail.com', '+36 30 637 4233'),
	('59', 'Hegedűs Richárd', 'richard.hegedus@gmail.com', '+36 30 658 6023'),
	('60', 'Novák Gréta', 'greta.novak@gmail.com', '+36 30 676 5960'),
	('61', 'Deák Zoltán', 'zoltan.deak@gmail.com', '+36 30 694 1146'),
	('62', 'Jónás Dániel', 'daniel.jonas@gmail.com', '+36 30 705 9496'),
	('63', 'Fehér Marcell', 'marcell.feher@gmail.com', '+36 30 721 5503'),
	('64', 'Fazekas Roland', 'roland.fazekas@gmail.com', '+36 30 727 9586'),
	('65', 'Somogyi Boglárka', 'boglarka.somogyi@gmail.com', '+36 30 743 7071'),
	('66', 'Orosz Bella', 'bella.orosz@gmail.com', '+36 30 773 6541'),
	('67', 'Deák Flóra', 'flora.deak@gmail.com', '+36 30 773 9030'),
	('68', 'Kocsis Marcell', 'marcell.kocsis@gmail.com', '+36 30 787 3916'),
	('69', 'Pintér Zoltán', 'zoltan.pinter@gmail.com', '+36 30 888 3653'),
	('70', 'Dudás Norbert', 'norbert.dudas@gmail.com', '+36 30 904 4826'),
	('71', 'Orbán Boglárka', 'boglarka.orban@gmail.com', '+36 30 917 7557'),
	('72', 'Orbán Csongor', 'csongor.orban@gmail.com', '+36 30 961 8467'),
	('73', 'Bognár Csaba', 'csaba.bognar@gmail.com', '+36 30 996 3780'),
	('74', 'Péter Kende', 'kende.peter@gmail.com', '+36 70 114 2306'),
	('75', 'Csonka Benedek', 'benedek.csonka@gmail.com', '+36 70 257 2571'),
	('76', 'Varga Laura', 'laura.varga@gmail.com', '+36 70 280 7463'),
	('77', 'Váradi Barnabás', 'barnabas.varadi@gmail.com', '+36 70 312 1341'),
	('78', 'Fekete Barnabás', 'barnabas.fekete@gmail.com', '+36 70 327 3414'),
	('79', 'Szilágyi Nóra', 'nora.szilagyi@gmail.com', '+36 70 352 5041'),
	('80', 'Antal Alex', 'alex.antal@gmail.com', '+36 70 353 2451'),
	('81', 'Faragó Flóra', 'flora.farago@gmail.com', '+36 70 374 9798'),
	('82', 'Biró Nimród', 'nimrod.biro@gmail.com', '+36 70 412 5595'),
	('83', 'Takács Flóra', 'flora.takacs@gmail.com', '+36 70 419 3113'),
	('84', 'Balázs Richárd', 'richard.balazs@gmail.com', '+36 70 425 7438'),
	('85', 'Balázs Dániel', 'daniel.balazs@gmail.com', '+36 70 454 8966'),
	('86', 'Somogyi Richárd', 'richard.somogyi@gmail.com', '+36 70 478 2439'),
	('87', 'Bálint Roland', 'roland.balint@gmail.com', '+36 70 500 8826'),
	('88', 'Varga Kende', 'kende.varga@gmail.com', '+36 70 526 9827'),
	('89', 'Nemes Kende', 'kende.nemes@gmail.com', '+36 70 540 8169'),
	('90', 'Pál Zsolt', 'zsolt.pal@gmail.com', '+36 70 554 8536'),
	('91', 'Király Alíz', 'aliz.kiraly@gmail.com', '+36 70 561 3691'),
	('92', 'Kovács Dávid', 'david.kovacs@gmail.com', '+36 70 617 7925'),
	('93', 'Sándor András', 'andras.sandor@gmail.com', '+36 70 769 7555'),
	('94', 'Vörös Zsolt', 'zsolt.voros@gmail.com', '+36 70 770 5208'),
	('95', 'Vincze Tamás', 'tamas.vincze@gmail.com', '+36 70 807 2161'),
	('96', 'Kis Alíz', 'aliz.kis@gmail.com', '+36 70 817 9710'),
	('97', 'Pataki Benett', 'benett.pataki@gmail.com', '+36 70 854 3743'),
	('98', 'Gulyás Benett', 'benett.gulyas@gmail.com', '+36 70 929 4420'),
	('99', 'Csonka Gábor', 'gabor.csonka@gmail.com', '+36 70 939 1451'),
	('100', 'Bodnár Máté', 'mate.bodnar@gmail.com', '+36 70 975 8334');
 
--Autók tábla feltöltése adatokkal 
INSERT INTO Autok (id, marka, modell, evjarat, szin, ar, telephely_id) VALUES
	('1', 'Ford', 'Focus', '2015', 'szürke', '8484320', '2'),
	('2', 'Ford', 'Mondeo', '2019', 'barna', '7746665', '3'),
	('3', 'Opel', 'Corsa', '2023', 'piros', '2297172', '3'),
	('4', 'Kia', 'Ceed', '2011', 'kék', '4882251', '3'),
	('5', 'Mercedes', 'CLA', '2017', 'szürke', '8587092', '2'),
	('6', 'Audi', 'Q7', '2009', 'piros', '5940434', '1'),
	('7', 'Volkswagen', 'Tiguan', '2006', 'szürke', '13285981', '3'),
	('8', 'Volkswagen', 'Golf', '2009', 'szürke', '7596730', '1'),
	('9', 'Opel', 'Insignia', '2020', 'szürke', '5090816', '2'),
	('10', 'Toyota', 'Corolla', '2012', 'fekete', '2108573', '3'),
	('11', 'Opel', 'Insignia', '2015', 'barna', '9924252', '1'),
	('12', 'Opel', 'Insignia', '2020', 'fekete', '13645010', '3'),
	('13', 'Toyota', 'Yaris', '2021', 'piros', '3169701', '3'),
	('14', 'Kia', 'Ceed', '2006', 'fehér', '9371144', '1'),
	('15', 'Mercedes', 'CLA', '2020', 'barna', '13058587', '1'),
	('16', 'BMW', '118d', '2021', 'kék', '8785816', '2'),
	('17', 'Volkswagen', 'Polo', '2013', 'zöld', '3624255', '2'),
	('18', 'BMW', 'X5', '2016', 'sárga', '11403734', '1'),
	('19', 'Toyota', 'Corolla', '2007', 'barna', '11077481', '1'),
	('20', 'Renault', 'Megane', '2014', 'fehér', '7572089', '3'),
	('21', 'Kia', 'Rio', '2021', 'barna', '3567416', '2'),
	('22', 'Renault', 'Megane', '2016', 'piros', '14851284', '1'),
	('23', 'Toyota', 'Yaris', '2006', 'barna', '13622206', '2'),
	('24', 'Kia', 'Rio', '2015', 'ezüst', '6675990', '1'),
	('25', 'Volkswagen', 'Golf', '2011', 'fehér', '7927624', '1'),
	('26', 'Renault', 'Kadjar', '2013', 'szürke', '10035233', '3'),
	('27', 'Opel', 'Corsa', '2016', 'fekete', '12995649', '2'),
	('28', 'Volkswagen', 'Golf', '2018', 'zöld', '2642273', '1'),
	('29', 'Ford', 'Focus', '2007', 'fehér', '4934231', '3'),
	('30', 'BMW', '320i', '2012', 'sárga', '4254258', '1'),
	('31', 'Renault', 'Megane', '2012', 'bordó', '2915957', '3'),
	('32', 'Renault', 'Talisman', '2010', 'barna', '4736636', '2'),
	('33', 'Volkswagen', 'Passat', '2012', 'szürke', '4201495', '1'),
	('34', 'Toyota', 'Avensis', '2011', 'barna', '2333897', '1'),
	('35', 'Volkswagen', 'Passat', '2017', 'barna', '8565326', '2'),
	('36', 'Ford', 'Kuga', '2011', 'fekete', '4555807', '1'),
	('37', 'Opel', 'Mokka', '2019', 'szürke', '2480340', '2'),
	('38', 'Toyota', 'Yaris', '2007', 'szürke', '8210396', '3'),
	('39', 'Ford', 'Focus', '2020', 'sárga', '5227006', '1'),
	('40', 'BMW', '320i', '2017', 'kék', '12609687', '1'),
	('41', 'Toyota', 'RAV4', '2012', 'zöld', '7041869', '2'),
	('42', 'Ford', 'Focus', '2015', 'piros', '7260216', '3'),
	('43', 'BMW', '320i', '2015', 'zöld', '5239419', '1'),
	('44', 'Volkswagen', 'Passat', '2007', 'fehér', '7668646', '3'),
	('45', 'Toyota', 'Avensis', '2019', 'fekete', '6600736', '2'),
	('46', 'Kia', 'Stonic', '2006', 'fehér', '6618961', '2'),
	('47', 'Audi', 'A4', '2010', 'kék', '9805318', '3'),
	('48', 'Hyundai', 'i30', '2016', 'fekete', '13630094', '3'),
	('49', 'Mercedes', 'GLA', '2016', 'zöld', '11643076', '3'),
	('50', 'Opel', 'Mokka', '2013', 'bordó', '4184084', '2'),
	('51', 'Volkswagen', 'Tiguan', '2023', 'barna', '3881787', '1'),
	('52', 'Volkswagen', 'Polo', '2018', 'fehér', '14340259', '1'),
	('53', 'Toyota', 'Yaris', '2007', 'ezüst', '13246169', '1'),
	('54', 'Volkswagen', 'Golf', '2023', 'sárga', '12136812', '1'),
	('55', 'Renault', 'Talisman', '2022', 'zöld', '10559180', '1'),
	('56', 'Renault', 'Talisman', '2008', 'piros', '3361245', '1'),
	('57', 'Toyota', 'Avensis', '2023', 'fekete', '2361912', '1'),
	('58', 'Volkswagen', 'Polo', '2017', 'kék', '7886253', '2'),
	('59', 'Kia', 'Stonic', '2018', 'fekete', '13124518', '3'),
	('60', 'Volkswagen', 'Polo', '2005', 'piros', '7985876', '3'),
	('61', 'Ford', 'Fiesta', '2019', 'sárga', '11701596', '3'),
	('62', 'Renault', 'Megane', '2020', 'kék', '2606002', '3'),
	('63', 'Audi', 'Q7', '2015', 'kék', '13561441', '1'),
	('64', 'Volkswagen', 'Golf', '2006', 'barna', '11471440', '2'),
	('65', 'BMW', 'X5', '2013', 'zöld', '2615056', '1'),
	('66', 'Ford', 'Mondeo', '2005', 'piros', '9133697', '1'),
	('67', 'Opel', 'Insignia', '2013', 'fekete', '9641165', '2'),
	('68', 'Renault', 'Kadjar', '2013', 'zöld', '3382353', '1'),
	('69', 'Kia', 'Stonic', '2016', 'fehér', '4004195', '1'),
	('70', 'Toyota', 'Avensis', '2007', 'ezüst', '8857800', '2'),
	('71', 'Toyota', 'RAV4', '2017', 'fehér', '9496814', '2'),
	('72', 'Mercedes', 'E220', '2021', 'fekete', '6496863', '2'),
	('73', 'Audi', 'A4', '2005', 'szürke', '9952712', '2'),
	('74', 'Opel', 'Astra', '2016', 'fekete', '4553372', '3'),
	('75', 'Opel', 'Mokka', '2010', 'sárga', '5424013', '2'),
	('76', 'Renault', 'Talisman', '2023', 'kék', '14434736', '3'),
	('77', 'Ford', 'Fiesta', '2020', 'szürke', '10368529', '1'),
	('78', 'Hyundai', 'i30', '2012', 'fehér', '8394367', '1'),
	('79', 'Ford', 'Kuga', '2016', 'fekete', '4845337', '1'),
	('80', 'Mercedes', 'CLA', '2015', 'sárga', '5824850', '3'),
	('81', 'Audi', 'A3', '2018', 'barna', '9829405', '2'),
	('82', 'Volkswagen', 'Tiguan', '2019', 'szürke', '4444775', '3'),
	('83', 'Ford', 'Fiesta', '2017', 'ezüst', '10445378', '3'),
	('84', 'Renault', 'Talisman', '2022', 'piros', '9436175', '3'),
	('85', 'Ford', 'Kuga', '2022', 'barna', '4980332', '1'),
	('86', 'Renault', 'Clio', '2020', 'szürke', '5757978', '2'),
	('87', 'Mercedes', 'GLA', '2016', 'sárga', '14932324', '2'),
	('88', 'Volkswagen', 'Golf', '2018', 'fehér', '11915742', '2'),
	('89', 'Volkswagen', 'Tiguan', '2018', 'barna', '4774522', '2'),
	('90', 'Hyundai', 'i20', '2013', 'szürke', '11117763', '3'),
	('91', 'Audi', 'A4', '2005', 'szürke', '9641870', '3'),
	('92', 'Ford', 'Mondeo', '2013', 'fekete', '13850681', '2'),
	('93', 'Volkswagen', 'Polo', '2018', 'fehér', '3058409', '1'),
	('94', 'Mercedes', 'CLA', '2008', 'fehér', '5601588', '2'),
	('95', 'Mercedes', 'C200', '2010', 'bordó', '3515048', '3'),
	('96', 'Ford', 'Mondeo', '2006', 'bordó', '11683366', '1'),
	('97', 'Volkswagen', 'Tiguan', '2010', 'sárga', '4676763', '2'),
	('98', 'Kia', 'Sportage', '2006', 'bordó', '3263556', '2'),
	('99', 'Opel', 'Insignia', '2010', 'barna', '8215405', '2'),
	('100', 'Hyundai', 'Santa Fe', '2023', 'fekete', '12452228', '3');

--Eladások tábla feltöltése adatokkal 
INSERT INTO Eladasok (id, auto_id, vasarlo_id, alkalmazott_id, eladas_datum, eladas_ar) VALUES
	('1', '28', '86', '11', '2024.09.11', '2642273'),
	('2', '95', '98', '17', '2024.12.24', '3515048'),
	('3', '73', '28', '14', '2025.03.09', '9952712'),
	('4', '69', '82', '18', '2025.01.07', '4004195'),
	('5', '74', '57', '8', '2024.06.21', '4553372'),
	('6', '89', '32', '20', '2025.03.13', '4774522'),
	('7', '94', '19', '16', '2025.02.23', '5601588'),
	('8', '9', '14', '15', '2024.09.01', '5090816'),
	('9', '3', '7', '19', '2025.05.05', '2297172'),
	('10', '47', '79', '3', '2024.07.24', '9805318'),
	('11', '72', '92', '7', '2024.10.31', '6496863'),
	('12', '22', '99', '6', '2025.04.19', '14851284'),
	('13', '71', '25', '17', '2024.11.05', '9496814'),
	('14', '49', '13', '11', '2024.07.09', '11643076'),
	('15', '25', '95', '5', '2025.02.14', '7927624'),
	('16', '44', '42', '3', '2024.09.06', '7668646'),
	('17', '70', '8', '2', '2024.08.23', '8857800'),
	('18', '43', '61', '5', '2024.09.18', '5239419'),
	('19', '85', '69', '2', '2024.06.06', '4980332'),
	('20', '88', '78', '18', '2024.09.07', '11915742'),
	('21', '82', '48', '7', '2025.05.04', '4444775'),
	('22', '62', '6', '8', '2025.03.22', '2606002'),
	('23', '34', '91', '9', '2024.12.25', '2333897'),
	('24', '6', '71', '4', '2024.09.20', '5940434'),
	('25', '32', '45', '19', '2024.09.21', '4736636'),
	('26', '2', '46', '15', '2025.04.07', '7746665'),
	('27', '59', '21', '20', '2024.12.01', '13124518'),
	('28', '76', '68', '13', '2025.05.07', '14434736'),
	('29', '75', '50', '9', '2024.05.12', '5424013'),
	('30', '99', '73', '4', '2025.03.07', '8215405'),
	('31', '97', '80', '7', '2025.01.30', '4676763'),
	('32', '42', '36', '1', '2024.06.28', '7260216'),
	('33', '27', '43', '15', '2024.09.20', '12995649'),
	('34', '86', '62', '18', '2024.09.25', '5757978'),
	('35', '98', '27', '20', '2024.07.09', '3263556'),
	('36', '46', '90', '14', '2024.12.13', '6618961'),
	('37', '30', '65', '10', '2024.10.28', '4254258'),
	('38', '45', '34', '9', '2025.01.23', '6600736'),
	('39', '16', '96', '6', '2024.10.01', '8785816'),
	('40', '7', '33', '2', '2024.11.15', '13285981'),
	('41', '15', '38', '12', '2024.12.31', '13058587'),
	('42', '90', '77', '20', '2024.08.27', '11117763'),
	('43', '61', '41', '5', '2025.01.11', '11701596'),
	('44', '68', '53', '4', '2024.07.17', '3382353'),
	('45', '48', '12', '13', '2025.03.19', '13630094'),
	('46', '53', '51', '20', '2025.04.30', '13246169'),
	('47', '21', '81', '13', '2025.01.17', '3567416'),
	('48', '78', '30', '16', '2025.04.29', '8394367'),
	('49', '92', '97', '2', '2025.04.27', '13850681'),
	('50', '4', '24', '2', '2025.05.07', '4882251'),
	('51', '80', '40', '10', '2024.09.09', '5824850'),
	('52', '20', '66', '13', '2024.12.31', '7572089'),
	('53', '55', '84', '3', '2025.01.31', '10559180'),
	('54', '96', '52', '11', '2024.08.30', '11683366'),
	('55', '36', '29', '12', '2024.07.02', '4555807'),
	('56', '14', '16', '6', '2025.02.04', '9371144'),
	('57', '64', '63', '13', '2025.03.08', '11471440'),
	('58', '51', '49', '14', '2025.01.11', '3881787'),
	('59', '37', '31', '1', '2024.09.11', '2480340'),
	('60', '100', '67', '15', '2025.03.02', '12452228'),
	('61', '40', '23', '9', '2024.07.24', '12609687'),
	('62', '63', '87', '8', '2025.01.07', '13561441'),
	('63', '11', '58', '7', '2025.04.08', '9924252'),
	('64', '31', '56', '6', '2024.09.05', '2915957'),
	('65', '93', '59', '10', '2025.02.10', '3058409'),
	('66', '35', '94', '14', '2024.09.18', '8565326'),
	('67', '8', '17', '2', '2025.03.10', '7596730'),
	('68', '84', '88', '16', '2025.01.20', '9436175'),
	('69', '50', '4', '14', '2025.01.26', '4184084'),
	('70', '79', '11', '16', '2025.05.06', '4845337'),
	('71', '52', '54', '19', '2025.02.21', '14340259'),
	('72', '12', '93', '3', '2024.08.14', '13645010'),
	('73', '29', '60', '16', '2024.10.16', '4934231'),
	('74', '77', '18', '19', '2025.03.28', '10368529'),
	('75', '65', '15', '17', '2024.09.28', '2615056'),
	('76', '54', '20', '2', '2024.10.30', '12136812'),
	('77', '91', '26', '8', '2024.11.30', '9641870'),
	('78', '60', '55', '16', '2024.05.31', '7985876'),
	('79', '10', '75', '20', '2024.09.19', '2108573'),
	('80', '87', '74', '20', '2024.09.20', '14932324'),
	('81', '56', '39', '5', '2025.01.23', '3361245'),
	('82', '17', '64', '12', '2025.02.01', '3624255'),
	('83', '81', '37', '9', '2024.09.05', '9829405'),
	('84', '18', '89', '5', '2025.02.24', '11403734'),
	('85', '38', '22', '14', '2025.05.10', '8210396'),
	('86', '57', '35', '5', '2024.08.24', '2361912'),
	('87', '1', '2', '1', '2025.02.08', '8484320'),
	('88', '66', '70', '6', '2025.03.17', '9133697'),
	('89', '26', '3', '2', '2024.11.29', '10035233'),
	('90', '58', '5', '1', '2025.03.03', '7886253'),
	('91', '5', '44', '13', '2024.12.23', '8587092'),
	('92', '33', '9', '6', '2024.10.08', '4201495'),
	('93', '23', '85', '15', '2025.02.12', '13622206'),
	('94', '24', '83', '10', '2024.10.27', '6675990'),
	('95', '41', '100', '3', '2024.11.10', '7041869'),
	('96', '19', '76', '18', '2024.10.10', '11077481'),
	('97', '39', '10', '12', '2025.02.16', '5227006'),
	('98', '13', '72', '2', '2024.11.24', '3169701'),
	('99', '67', '1', '5', '2025.01.30', '9641165'),
	('100', '83', '47', '16', '2024.08.02', '10445378');
    
--1. Ez a lekérdezés kilistázza, hogy egyes márkákból hány autót adtak el és mennyi volt az átlagos eladási ár kerekítve.
Select a.marka aS Márkanév, Count(*) aS Darabszám, ROUND(AVG(e.eladas_ar), -4) AS "Átlagos eladási ár"   
FRom Eladasok e JOIN Autok a ON a.id= e.auto_id 
Group By a.marka
Order By AVG(e.eladas_ar) DESC    

--2. Ez a lekérdezés megmutatja a TOP 3 alkalmazottat, akik a legtöbb autót adták el.
SELECT TOP 3 alk.nev As "Alkalmazott név", COUNT(*) AS "Eladások száma"
From Alkalmazottak alk JOIN Eladasok e ON alk.id = e.alkalmazott_id
GROUP By alk.nev 
ORDER BY COUNT(*) DESC

--3. A lekérdezés kilistázza azt, hogy bizonyos autó árkategóriákon belül hány darab autó van.
select ar_kategoria AS "Ár kategória", count(*) as 'Darab'
FROM
(select case
			WHEN ar <= 5000000 THEN 'olcsó'
			WHEN ar between 5000000 and 10000000 THEN 'középkategória'
			WHEN ar >= 10000000 THEN 'drága'
			END as ar_kategoria
from Autok) as sorok
group by ar_kategoria
order by count(*)

--4. A lekérdezés kilistázza azt az öt autót, amik az elmúlt hat hónapban vásárolt legdrágább kocsik.
SELECT TOP 5 a.marka AS "Márka", a.modell AS "Modell", a.evjarat AS "Évjárat", e.eladas_datum AS "Eladás dátuma", e.eladas_ar AS "Eladás ár"
FROM Eladasok e JOIN Autok a ON e.auto_id = a.id
WHERE e.eladas_datum >= DATEADD(month, -6, GETDATE())
ORDER BY e.eladas_ar DESC

--5. A lekérdezés kilistázza, hogy telephelyenként mennyi autót adtak el és összesen mennyi értékben. Emellett mutat egy összesítést is.
SELECT ISNULL(t.varos, 'Összesen') AS Telephely, COUNT(*) AS "Eladások száma", SUM(e.eladas_ar) AS "Összesített ár"
FROM Eladasok e JOIN Autok a ON a.id = e.auto_id
				JOIN Telephelyek t ON t.id = a.telephely_id
GROUP BY GROUPING SETS ((t.varos),())
ORDER BY GROUPING(t.varos), t.varos;

--6. A lekérdezés kilistázza a márkákon belüli legdrágább autókat.
SELECT marka AS "Márkanév", modell AS "Modell", ar AS "Ár" 
FROM (
    SELECT marka, modell, ar, RANK() OVER (PARTITION BY marka ORDER BY ar DESC) AS rang
    FROM Autok
) AS lekerdezes
WHERE rang = 1;


