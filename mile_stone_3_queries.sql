-- Kamień Milowy 3: Konstruktorzy i Wyścigi
-- Zadania:

-- 1. Zapytanie o Konstruktorów:
-- Stwórz zapytanie SQL, które wybierze informacje o konstruktorach, takie jak nazwa, narodowość.

-- ROZWIĄZANIE 1.
SELECT constructorId, name, nationality FROM constructors;

-- 2. Zapytanie o Konstruktorów z Największą Liczbą Zwycięstw:
-- Rozwiń zapytanie, aby uwzględniało konstruktorów z największą liczbą zwycięstw.

-- ROZWIĄZANIE 2.
SELECT c.constructorId, c.name, c.nationality, COUNT(r.position) AS victories
FROM constructors c
LEFT JOIN results r ON c.constructorId = r.constructorId AND r.position = '1'
GROUP BY c.constructorId, c.name, c.nationality
ORDER BY victories DESC;

-- 3. Zapytanie o Wyścigi w Sezonie:
-- Stwórz zapytanie, które wybierze informacje o wyścigach w danym sezonie.

-- ROZWIĄZANIE 3.
SELECT raceId, name, date
FROM races
WHERE year = 2022;

-- 4. Łączenie Tabel w Zapytaniach o Konstruktorów:
-- Połączenie wyników zapytań o konstruktorów i wyścigi, aby uzyskać kompleksowe informacje o sezonie.

-- ROZWIĄZANIE 4.
SELECT c.constructorId, c.name, c.nationality, rc.raceId, rc.name AS race_name, rc.date, COUNT(r.position) as Victories
FROM constructors c
LEFT JOIN results as r ON c.constructorId = r.constructorId AND r.position = '1'
LEFT JOIN races as rc ON r.raceId = rc.raceId
WHERE rc.year = 2008
GROUP BY c.constructorId, c.name, c.nationality, rc.raceId, rc.name, rc.date
ORDER BY c.constructorId, rc.date;

-- 5. Zapytanie o Najbardziej Popularny Tor Wyścigowy:
-- Stwórz zapytanie, które zidentyfikuje tor wyścigowy, na którym odbyło się najwięcej wyścigów.

-- ROZWIĄZANIE 5.
SELECT name, COUNT(circuitId) AS Races_in_F1
FROM races
GROUP BY name
ORDER BY Races_in_F1 DESC;







