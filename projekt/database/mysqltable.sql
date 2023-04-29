CREATE TABLE uzytkownicy (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    haslo VARCHAR(255) NOT NULL,
    status INT DEFAULT 0,
    PRIMARY KEY (id)
);

CREATE TABLE testy (
    id INT NOT NULL AUTO_INCREMENT,
    nazwa VARCHAR(255) NOT NULL,
    opis TEXT,
    cena INT NOT NULL,
    img TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE pytania (
    id INT NOT NULL AUTO_INCREMENT,
    id_testu INT NOT NULL,
    tresc TEXT NOT NULL,
    A TEXT NOT NULL,
    B TEXT NOT NULL,
    C TEXT NOT NULL,
    D TEXT NOT NULL,
    poprawna_odpowiedz INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_testu) REFERENCES testy(id)
);

CREATE TABLE testy_uzytkownicy (
    id INT NOT NULL AUTO_INCREMENT,
    id_uzytkownika INT NOT NULL,
    id_testu INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_uzytkownika) REFERENCES uzytkownicy(id),
    FOREIGN KEY (id_testu) REFERENCES testy(id)
);

ALTER TABLE uzytkownicy 
ADD CONSTRAINT email_format CHECK (email LIKE '%_@__%.__%');


INSERT INTO uzytkownicy (email, haslo)
VALUES 
('jan.kowalski@gmail.com', 'haslo123'),
('anna.nowak@gmail.com', 'testowe123'),
('marek.jankowski@gmail.com', 'zaq1@WSX'),
('katarzyna.kaminska@gmail.com', 'haslo456'),
('piotr.nowacki@gmail.com', 'qwerty123'),
('izabela.janusz@gmail.com', 'zaq12wsx');


INSERT INTO uzytkownicy (email, haslo, status)
VALUES 
('admin@admin.admin','admin', 1);

INSERT INTO testy (nazwa, opis, cena)
VALUES 
('Survival guide!', "Survival is key in the wasteland of Fallout. Our course covers scavenging, building, defense, weapon crafting, and navigating using maps and landmarks. Learn how to manage radiation exposure and purify water. Whether you're a seasoned wanderer or a novice, prepare for the challenges ahead.", 100),
('Crafting weapons!', "Create deadly weapons from scrap in the wasteland of Fallout. Learn to salvage, identify, and craft firearms, melee weapons, explosives, and traps. Modify existing weapons and repair and maintain them. Gain an edge in the post-apocalyptic world.", 300),
('HACKING!', "Learn to hack robots in Fallout. Control turrets, protectrons, and sentry bots to your advantage. Identify weaknesses in security systems and exploit them. Use holotapes and terminals to access robot systems. Gain a powerful ally in the wasteland.", 1000);

INSERT INTO pytania (id_testu, tresc, A, B, C, D, poprawna_odpowiedz)
VALUES 
(1, 'Ile to jest 2+2?', '2', '3', '4', '5', 3),
(1, 'Jakie jest pole koła o promieniu 5?', '15.71', '25.00', '78.54', '31.42', 3),
(2, 'Co to jest "dog" po polsku?', 'kot', 'pies', 'krowa', 'kura', 2),
(2, 'Jakie jest przeciwieństwo słowa "hot"?', 'zimny', 'gorący', 'wilgotny', 'miękki', 1),
(3, 'W którym roku miał miejsce bitwa pod Grunwaldem?', '1410', '1569', '1807', '1939', 1),
(3, 'Kto był pierwszym królem Polski?', 'Bolesław Chrobry', 'Jan III Sobieski', 'Władysław Jagiełło', 'Kazimierz III Wielki', 1),
(1, 'Co to jest mitochondrium?', 'organella komórkowe', 'gatunek bakterii', 'komórka zwierzęca', 'system odpornościowy', 1),
(2, 'Która planeta Układu Słonecznego jest najbliżej Słońca?', 'Merkury', 'Wenus', 'Ziemia', 'Mars', 1),
(3, 'Jakie jest stolicą Włoch?', 'Paryż', 'Berlin', 'Madryt', 'Rzy5m', 4);



INSERT INTO testy_uzytkownicy (id_uzytkownika, id_testu)
VALUES
(1,1)
(1,2)
(1,3)
(3,3)
(4,3)
(5,2)
(5,3)