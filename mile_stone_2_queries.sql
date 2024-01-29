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

-- 4. Zapytanie o Średnią Liczbę Punktów na Wyścig:
-- Stworzenie zapytania obliczającego średnią liczbę punktów zdobytych przez kierowcę na wyścig.

-- ROZWIĄZANIE 4.
SELECT d.driverId, d.forename, d.surname, AVG(r.points) AS avg_points_per_race
FROM drivers d
LEFT JOIN results r ON d.driverId = r.driverId
WHERE r.raceId IN (SELECT raceId FROM races WHERE year = 2016)  -- Zmień rok na aktualny
GROUP BY d.driverId, d.forename, d.surname
ORDER BY avg_points_per_race DESC;

-- 5. Zapytanie o Najlepszą Średnią Czasu Kwalifikacji:
-- Stworzenie zapytania, które wybierze kierowców z najlepszą średnią czasów kwalifikacji Q1, Q2 ,Q3.

-- ROZWIĄZANIE 5.
SELECT d.driverId, d.forename, d.surname, AVG(q.q1) AS q1_avg_time, AVG(q.q2) AS q2_avg_time, AVG(q.q3) AS q3_avg_time
FROM drivers d
LEFT JOIN qualifying q ON d.driverId = q.driverId
GROUP BY d.driverId, d.forename, d.surname
ORDER BY q1_avg_time ASC;




