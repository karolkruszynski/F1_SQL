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

