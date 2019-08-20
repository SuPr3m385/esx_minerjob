INSERT INTO `items` (`name`, `label`, `limit`) VALUES	
('diamond', 'Diamond', -1),
('gold', 'Gold', -1),
('iron', 'Iron', -1),
('copper', 'Copper', -1)
;

INSERT INTO `jobs` (name, label) VALUES
('miner', 'Miner')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
('miner', 0, 'employee', 'Employee', 0, '{}', '{}')
,
