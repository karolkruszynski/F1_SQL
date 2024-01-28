-- Kamień Milowy 2: Sezonowe Statystyki Kierowców
-- Zadania:

-- 1. Zapytanie o Statystyki Sezonowe Kierowcy:
-- Stworzenie zapytania SQL,
-- które wybierze statystyki kierowcy dla danego sezonu, takie jak liczba startów, zwycięstw, punktów.

-- ROZWIĄZANIE 1.
SELECT d.driverId, d.forename, d.surname, COUNT(r.resultId) AS race_starts,
	COUNT(CASE WHEN r.position = '1' THEN 1 END) AS victories,
	SUM(r.points) AS total_points
FROM drivers d
LEFT JOIN results r ON d.driverId = r.driverId
WHERE r.raceId IN (SELECT raceId FROM races WHERE year = 2021)  -- Rok edytowalny dla różnych sezonów.
GROUP BY d.driverId, d.forename, d.surname
ORDER BY total_points DESC;

--2. Dodanie Grupowania i Sortowania:
-- Rozwijanie zapytania, dodając grupowanie wyników według kierowców i sortowanie
-- według liczby zdobytych punktów.

-- ROZWIĄZANIE 2.
SELECT d.driverId, d.forename, d.surname, COUNT(r.resultId) AS race_starts,
	COUNT(CASE WHEN r.position = '1' THEN 1 END) AS victories,
	SUM(r.points) AS total_points
FROM drivers d
LEFT JOIN results r ON d.driverId = r.driverId
WHERE r.raceId IN (SELECT raceId FROM races WHERE year = 2021)  -- Rok edytowalny dla różnych sezonów.
GROUP BY d.driverId, d.forename, d.surname
ORDER BY total_points DESC, victories DESC, race_starts DESC;

--3. Zapytanie o Kierowców z Największą Liczbą Punktów:
-- Stworzenie zapytania, które zwróci top 5 kierowców z największą liczbą zdobytych punktów
-- od sezonu 2014 (included) ( era silnikó hybrydowych)

-- ROZWIĄZANIE 3.
SELECT d.driverId, d.forename, d.surname, COUNT(r.resultId) AS race_starts,
	COUNT(CASE WHEN r.position = '1' THEN 1 END) AS victories,
	SUM(r.points) AS total_points
FROM drivers d
LEFT JOIN results r ON d.driverId = r.driverId
WHERE r.raceId IN (SELECT raceId FROM races WHERE year >= 2014)  -- Rok edytowalny dla różnych sezonów.
GROUP BY d.driverId, d.forename, d.surname
ORDER BY total_points DESC
LIMIT 5;















