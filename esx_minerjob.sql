INSERT INTO `jobs` (name, label) VALUES
	('miner', 'Mineur')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('miner', 0, 'employee', 'Ouvrier', 0, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`, `limit`) VALUES
	('stone', 'Minerai', 40),
	('washedstone', 'Minerai Nettoyé', 40),
	('diamond', 'Diamant', 100),
	('gold', 'Or', 100),
	('iron', 'Fer', 100),
	('copper', 'Cuivre', 100)
;
