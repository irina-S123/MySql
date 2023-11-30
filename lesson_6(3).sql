/* 
 3. (по желанию)* Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, 
 communities и messages в таблицу logs помещается время и дата создания записи, название 
 таблицы, идентификатор первичного ключа.
*/

DROP TABLE IF EXISTS logs;

CREATE TABLE logs (
    created_at DATETIME DEFAULT now(),
    table_name VARCHAR(20) NOT NULL,
    pk_id INT UNSIGNED NOT NULL
)  ENGINE=ARCHIVE;

CREATE 
    TRIGGER  users_log
 AFTER INSERT ON users FOR EACH ROW 
    INSERT INTO logs SET table_name = 'users' , pk_id = NEW.id;

CREATE 
    TRIGGER  communities_log
 AFTER INSERT ON communities FOR EACH ROW 
    INSERT INTO logs SET table_name = 'communities' , pk_id = NEW.id;

CREATE 
    TRIGGER  messages_log
AFTER INSERT ON messages FOR EACH ROW 
    INSERT INTO logs SET table_name = 'messages' , pk_id = NEW.id;
    TRIGGER  messages_log
AFTER INSERT ON messages FOR EACH ROW 
    INSERT INTO logs SET table_name = 'messages' , pk_id = NEW.id;