/*
Создайте таблицу users_old, аналогичную таблице users. 
Создайте процедуру, с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. 
(использование транзакции с выбором commit или rollback – обязательно).
*/

DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id INT PRIMARY KEY auto_increment, 
    firstname varchar(50), 
    lastname varchar(50), 
    email varchar(120)
);

DELIMITER $$
DROP PROCEDURE IF EXISTS move;
CREATE PROCEDURE  move (IN num1 INT) 
	DETERMINISTIC
BEGIN
INSERT INTO users_old (firstname,lastname,email) 
SELECT firstname, lastname, email 
	FROM users 
	WHERE users.id = num1;
DELETE FROM users 
	WHERE id = num1;
COMMIT;
END$$

DELIMITER ;

CALL move(7); -- Проверяем.

DELIMITER ;

CALL move(7); -- Проверяем.