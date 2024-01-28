-- Kamień Milowy 1: Wybieranie Danych o Kierowcach
-- Zadania:
-- 1. Zapytanie Wyświetlające Informacje o Kierowcach:
--		Stworzenie zapytania SQL, które wybierze podstawowe informacje o kierowcach, takie jak:
--			imię, nazwisko, narodowość, data urodzenia.

-- ROZWIĄZANIE 1.
SELECT forename, surname, nationality, dob
FROM drivers;

-- 2. Dodanie Sortowania i Ograniczenia:
-- Rozwinięcie zapytania, dodając sortowanie kierowców według daty urodzenia od najmłodszego kierowcy
-- i ograniczenie wyników do pierwszych 10.

-- ROZWIĄZANIE 2.
SELECT forename, surname, nationality, dob
FROM drivers
ORDER BY dob DESC
LIMIT 10;

-- 3. Zapytanie o Liczbę Zwycięstw Kierowcy:
-- Stworzenie zapytania, które wybierze kierowców wraz z informacją o liczbie zdobytych zwycięstw.

-- ROZWIĄZANIE 3.
SELECT d.driverId, d.forename, d.surname, COUNT(r.position) AS victories
FROM drivers d
LEFT JOIN results r ON d.driverId = r.driverId AND r.position = '1'
GROUP BY d.driverId, d.forename, d.surname
ORDER BY victories DESC;

-- 4. Złączenie Zapytań o Kierowców i Konstruktorów:
-- Połączenie wyników zapytań o kierowców i konstruktorów, wybierając ich podstawowe informacje. Użyj metody Distinct dla driverId

-- ROZWIĄZANIE 4.
SELECT DISTINCT(d.driverID),d.forename, d.surname, d.dob, d.nationality, c.name AS constructor_name
FROM drivers d
LEFT JOIN results r ON d.driverId = r.driverId
LEFT JOIN constructors c ON r.constructorID = c.constructorID
ORDER BY d.driverID;

-- 5. Zapytanie o Najmłodszego Kierowcę
--Stworzenie zapytania, które zidentyfikuje najmłodszego kierowcę w bazie danych.
SELECT driverId, forename, surname, dob AS Date_of_Birth
FROM drivers
ORDER BY dob DESC
LIMIT 1;