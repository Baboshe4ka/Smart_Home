-- Создаём таблицу датчиков 
CREATE TABLE IF NOT EXISTS detectors(
    id INT UNIQUE PRIMARY KEY,
	flat VARCHAR (255) NOT NULL,
    detector_type VARCHAR (255) NOT NULL,
    status BOOLEAN NOT NULL,
    start_date DATE);

--Заполняем таблицу 
INSERT INTO detectors VALUES
(1123, 123, 'Датчик движения', '0', '2022-09-25'),
(2123, 123, 'Датчик протечки воды', '0', '2022-09-25'),
(3123, 123, 'Датчик открытия двери', '0', '2022-09-25'),
(4123, 123, 'Датчик открытия окна', '0', '2022-09-25'),
(5123, 123, 'Датчик для управления жалюзи', '0', '2022-09-25'),
(6123, 123, 'Датчик для управления шторами', '0', '2022-09-25'),
(7123, 123, 'Датчик дыма', '0', '2022-09-25');

--Создаём таблицу для записи изменений значений
CREATE TABLE IF NOT EXISTS detectors_logs(
    time_of_update TIMESTAMP,
    id INT,
	flat VARCHAR (255) NOT NULL,
    detector_type VARCHAR (255) NOT NULL,
    status BOOLEAN NOT NULL,
    start_date DATE);

--Созание функции для тригера 
CREATE OR REPLACE FUNCTION fnc_tgr_detector_status_changed()
RETURNS TRIGGER AS $detectors_logs$
BEGIN 
	INSERT INTO detectors_logs SELECT now(), NEW.*;
	RETURN NULL;
END;
$detectors_logs$ LANGUAGE plpgsql;

--Создание триггера 
CREATE OR REPLACE TRIGGER tgr_detector_status_changed
AFTER UPDATE ON detectors
	FOR EACH ROW EXECUTE FUNCTION fnc_tgr_detector_status_changed();
