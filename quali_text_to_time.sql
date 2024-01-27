UPDATE public.qualifying
SET q1 = COALESCE(NULLIF(q1, '\N')::TIME, '0:00.000');
UPDATE public.qualifying
SET q2 = COALESCE(NULLIF(q2, '\N')::TIME, '0:00.000');
UPDATE public.qualifying
SET q3 = COALESCE(NULLIF(q3, '\N')::TIME, '0:00.000');

-- NULLIF(q1, '\N') sprawdza, czy wartość kolumny q1 to \N. Jeśli tak, to zwraca NULL, w przeciwnym razie zachowuje oryginalną wartość.
-- ::TIME rzutuje wartość (lub NULL) na typ danych TIME.
-- COALESCE(..., '0:00.000') ustawia wartość na '0:00.000', jeśli jest to NULL, czyli gdy oryginalna wartość była \N.

UPDATE public.qualifying
SET q1 = COALESCE(NULLIF(q1, ''), '0:00.000'),
    q2 = COALESCE(NULLIF(q2, ''), '0:00.000'),
    q3 = COALESCE(NULLIF(q3, ''), '0:00.000');

-- Powyższe polecenie korzysta z funkcji NULLIF do porównania wartości w kolumnach q1, q2, q3 z pustym ciągiem znaków.
-- Jeśli wartość jest równa pustemu ciągowi, to NULLIF zwraca NULL, a następnie COALESCE zastępuje NULL wartością '0:00.000'.
-- W ten sposób uzyskasz zamianę wszystkich pustych ciągów znaków na wartość '0:00.000'

ALTER TABLE public.qualifying
ALTER COLUMN q1 TYPE TIME USING q1::TIME,
ALTER COLUMN q2 TYPE TIME USING q2::TIME,
ALTER COLUMN q3 TYPE TIME USING q3::TIME;
