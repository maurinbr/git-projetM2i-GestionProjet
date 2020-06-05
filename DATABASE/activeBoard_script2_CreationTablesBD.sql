
/* ACTIVEBOARD DATABASE */
/* CREATION DE LA BD*/
/* Pour nettoyer la base utiliser le fichier activeBoard_script1_NettoyerBD.sql*/


/***************************************************** FRAGMENT 1  (BRUNO + activity) *******************************************/

/* CREATION DE TABLES avec PK et UNIQUES */


CREATE TABLE activity ( id INT(10) PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255), beginning TIMESTAMP NULL, ending TIMESTAMP NULL, status_id INT(10), client_id INT(10)) ENGINE InnoDB;

CREATE TABLE user ( id INT(10) PRIMARY KEY AUTO_INCREMENT, last_name VARCHAR(255), firs_name VARCHAR(255), phone VARCHAR(255), startContract TIMESTAMP NULL , endContract TIMESTAMP NULL, team_id INT(10), authentication_id INT(10), role_id INT(10) ) ENGINE InnoDB;

CREATE TABLE team ( id INT(10) PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255)) ENGINE InnoDB;

CREATE TABLE role ( id INT(10) PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255) ) ENGINE InnoDB;

CREATE TABLE authentication ( id INT(10) PRIMARY KEY AUTO_INCREMENT, login VARCHAR(255) UNIQUE, password VARCHAR(255) ) ENGINE InnoDB;

CREATE TABLE comment ( id INT(10) PRIMARY KEY AUTO_INCREMENT, description text ) ENGINE InnoDB;

CREATE TABLE activity_user (id INT(10) PRIMARY KEY AUTO_INCREMENT, activity_id INT(10), user_id INT(10), comment_id INT(10) ) ENGINE InnoDB;

CREATE TABLE type_license ( id INT(10) PRIMARY KEY AUTO_INCREMENT, category VARCHAR(3) ) ENGINE InnoDB;

CREATE TABLE user_license ( type_license_id INT(10), user_id INT(10) ) ENGINE InnoDB;
ALTER TABLE user_license ADD CONSTRAINT PK_user_license PRIMARY KEY (type_license_id, user_id);


/* AJOUTER FOREING KEYS */

ALTER TABLE user  			ADD CONSTRAINT `user_fk_1` 			FOREIGN KEY (team_id) 			REFERENCES team(id);
ALTER TABLE user 			ADD CONSTRAINT `user_fk_2` 			FOREIGN KEY (role_id) 			REFERENCES role(id);
ALTER TABLE user 			ADD CONSTRAINT `user_fk_3` 			FOREIGN KEY (authentication_id) 	REFERENCES authentication(id);
ALTER TABLE activity_user   ADD CONSTRAINT `activity_user_fk_1` FOREIGN KEY (activity_id) 		REFERENCES activity(id);
ALTER TABLE activity_user 	ADD CONSTRAINT `activity_user_fk_2` FOREIGN KEY (user_id) 			REFERENCES user(id);
ALTER TABLE activity_user 	ADD CONSTRAINT `activity_user_fk_3` FOREIGN KEY (comment_id) 		REFERENCES comment(id);
ALTER TABLE user_license 	ADD CONSTRAINT `user_license_fk_1` 	FOREIGN KEY (type_license_id) 	REFERENCES type_license(id);
ALTER TABLE user_license 	ADD CONSTRAINT `user_license_fk_2` 	FOREIGN KEY (user_id) 			REFERENCES user(id);



/***************************************************** FRAGMENT 2 (Paola) *******************************************/

/* TABLE ACTIVITY CREATED PREVIOUSLY */

/* CREATION DE TABLES avec PK et UNIQUES */

CREATE TABLE client( id INT(10) PRIMARY KEY AUTO_INCREMENT, name VARCHAR(255), phone VARCHAR(255) ) ENGINE InnoDB;

CREATE TABLE address( id INT(10) PRIMARY KEY AUTO_INCREMENT, city VARCHAR(255), street VARCHAR(255), postalCode VARCHAR(255), client_id INT(10), user_id INT(10) ) ENGINE InnoDB;

CREATE TABLE status( id INT(10) PRIMARY KEY AUTO_INCREMENT, code VARCHAR(10) UNIQUE, couleur VARCHAR(10)) ENGINE InnoDB;

CREATE TABLE planning( id INT(10) PRIMARY KEY AUTO_INCREMENT, beginning TIMESTAMP NULL, ending TIMESTAMP NULL) ENGINE InnoDB;

CREATE TABLE activity_address( activity_id INT(10), address_id INT(10), functionAct VARCHAR(255)) ENGINE InnoDB;
ALTER TABLE activity_address ADD CONSTRAINT PK_activity_address PRIMARY KEY (activity_id, address_id);

CREATE TABLE activity_planning( activity_id INT(10), planning_id INT(10)) ENGINE InnoDB;
ALTER TABLE activity_planning ADD CONSTRAINT PK_activity_planning PRIMARY KEY (activity_id, planning_id);


/*AJOUTER FOREING KEYS*/

ALTER TABLE address 			ADD CONSTRAINT `address_fk_1` 			FOREIGN KEY (client_id) 	REFERENCES client(id);
ALTER TABLE activity_address 	ADD CONSTRAINT `activity_address_fk_1` 	FOREIGN KEY (address_id) 	REFERENCES address(id);
ALTER TABLE activity_planning 	ADD CONSTRAINT `activity_planning_fk_1` FOREIGN KEY (planning_id) 	REFERENCES planning(id);
ALTER TABLE address 			ADD CONSTRAINT `address_fk_2` 			FOREIGN KEY (user_id) 		REFERENCES user(id);		/*BESOIN FRAGMENT 1*/
ALTER TABLE activity 			ADD CONSTRAINT `activity_fk_1` 			FOREIGN KEY (client_id) 	REFERENCES client(id);		/*BESOIN FRAGMENT 1*/
ALTER TABLE activity 			ADD CONSTRAINT `activity_fk_2` 			FOREIGN KEY (status_id) 	REFERENCES status(id);		/*BESOIN FRAGMENT 1*/
ALTER TABLE activity_address 	ADD CONSTRAINT `activity_address_fk_2` 	FOREIGN KEY (activity_id) 	REFERENCES activity(id);	/*BESOIN FRAGMENT 1*/
ALTER TABLE activity_planning 	ADD CONSTRAINT `activity_planning_fk_2` FOREIGN KEY (activity_id) 	REFERENCES activity(id);	/*BESOIN FRAGMENT 1*/



/***************************************************** FRAGMENT 3 (Soufiane) *******************************************/

/* TABLE ACTIVITY CREATED PREVIOUSLY */

/* CREATION DE TABLES avec PK et UNIQUES */


CREATE TABLE `equipment_type` ( `id` int(10) PRIMARY KEY AUTO_INCREMENT, `type` varchar(255), `name` varchar(255), `info` varchar(255) ) ENGINE=InnoDB;

CREATE TABLE `activity_equipment` ( `id` int(10) PRIMARY KEY AUTO_INCREMENT, `activity_id` int(10), `equip_type_id` int(10) ) ENGINE=InnoDB;


CREATE TABLE `equipment1` ( `id` int(10) PRIMARY KEY AUTO_INCREMENT, `description` varchar(255), `busy`  tinyint(1), `volume` int(10), `equip_type_id` int(10), `type_license_id` int(10) ) ENGINE=InnoDB;


CREATE TABLE `equipment2` ( `id` int(10) PRIMARY KEY AUTO_INCREMENT, `description` varchar(255), `busy`  tinyint(1), `equip_type_id` int(10) ) ENGINE=InnoDB;

 

/*AJOUTER FOREING KEYS*/

ALTER TABLE `activity_equipment` 	ADD CONSTRAINT `activity_equipment_fk_2` 	FOREIGN KEY (`equip_type_id`) 	REFERENCES `equipment_type` (`id`);

ALTER TABLE `equipment2` 			ADD CONSTRAINT `equipment2_fk_1` 			FOREIGN KEY (`equip_type_id`) 	REFERENCES `equipment_type` (`id`);

ALTER TABLE `equipment1` 			ADD CONSTRAINT `equipment1_fk_1` 			FOREIGN KEY (`equip_type_id`) 	REFERENCES `equipment_type` (`id`);

ALTER TABLE `activity_equipment` 	ADD CONSTRAINT `activity_equipment_fk_1` 	FOREIGN KEY (`activity_id`) 	REFERENCES `activity` 		(`id`);		/*BESOIN FRAGMENT 1*/

ALTER TABLE `equipment1` 			ADD CONSTRAINT `equipment1_fk_2` 		    FOREIGN KEY (`type_license_id`)  REFERENCES `type_license` 	(`id`);		/*BESOIN FRAGMENT 1*/






