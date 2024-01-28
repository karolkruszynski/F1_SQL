CREATE TABLE results
(
	resultId smallint,
	raceId smallint,
	driverId smallint,
	constructorId smallint,
	number smallint,
	grid smallint,
	position smallint,
	positionText character varying(10),
	positionOrder smallint,
	points smallint,
	PRIMARY KEY (resultId),
	FOREIGN KEY (raceId) REFERENCES public.races(raceId),
	FOREIGN KEY (driverId) REFERENCES public.drivers(driverId),
	FOREIGN KEY (constructorId) REFERENCES public.constructors(constructorId)
)