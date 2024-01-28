CREATE TABLE results
(
	resultId smallint,
	raceId smallint,
	driverId smallint,
	constructorId smallint,
	number text,
	grid smallint,
	position text,
	positionText text,
	positionOrder smallint,
	points real,
	PRIMARY KEY (resultId),
	FOREIGN KEY (raceId) REFERENCES public.races(raceId),
	FOREIGN KEY (driverId) REFERENCES public.drivers(driverId),
	FOREIGN KEY (constructorId) REFERENCES public.constructors(constructorId)
)