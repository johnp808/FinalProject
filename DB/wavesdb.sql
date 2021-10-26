-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema wavesdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `wavesdb` ;

-- -----------------------------------------------------
-- Schema wavesdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wavesdb` DEFAULT CHARACTER SET utf8 ;
USE `wavesdb` ;

-- -----------------------------------------------------
-- Table `location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `location` ;

CREATE TABLE IF NOT EXISTS `location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NULL,
  `profile_image` VARCHAR(3000) NULL,
  `role` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_User_location1_idx` (`location_id` ASC),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  CONSTRAINT `fk_User_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beach`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beach` ;

CREATE TABLE IF NOT EXISTS `beach` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `default_image` VARCHAR(3000) NULL,
  `location_id` INT NOT NULL,
  `operational` TINYINT NULL,
  `pet_friendly` VARCHAR(100) NULL,
  `parking_available` VARCHAR(500) NULL,
  `price_of_admission` VARCHAR(45) NULL,
  `hours` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_beach_location1_idx` (`location_id` ASC),
  CONSTRAINT `fk_beach_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `report`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report` ;

CREATE TABLE IF NOT EXISTS `report` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(1000) NULL,
  `image` VARCHAR(3000) NULL,
  `beach_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NULL,
  `created` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comment_beach_idx` (`beach_id` ASC),
  INDEX `fk_Comment_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Comment_beach`
    FOREIGN KEY (`beach_id`)
    REFERENCES `beach` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comment_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorites`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorites` ;

CREATE TABLE IF NOT EXISTS `favorites` (
  `user_id` INT NOT NULL,
  `beach_id` INT NOT NULL,
  INDEX `fk_favorites_User1_idx` (`user_id` ASC),
  INDEX `fk_favorites_beach1_idx` (`beach_id` ASC),
  PRIMARY KEY (`user_id`, `beach_id`),
  CONSTRAINT `fk_favorites_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_favorites_beach1`
    FOREIGN KEY (`beach_id`)
    REFERENCES `beach` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weather`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weather` ;

CREATE TABLE IF NOT EXISTS `weather` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `weather_type` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `temperature_celsius` INT NULL,
  `created` DATETIME NULL,
  `wave_size` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `beach_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_weather_user1_idx` (`user_id` ASC),
  INDEX `fk_weather_beach1_idx` (`beach_id` ASC),
  CONSTRAINT `fk_weather_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_weather_beach1`
    FOREIGN KEY (`beach_id`)
    REFERENCES `beach` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beach_setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beach_setting` ;

CREATE TABLE IF NOT EXISTS `beach_setting` (
  `name` VARCHAR(45) NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inclement_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inclement_condition` ;

CREATE TABLE IF NOT EXISTS `inclement_condition` (
  `name` VARCHAR(45) NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `beach_has_beach_setting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `beach_has_beach_setting` ;

CREATE TABLE IF NOT EXISTS `beach_has_beach_setting` (
  `beach_id` INT NOT NULL,
  `beach_setting_id` INT NOT NULL,
  PRIMARY KEY (`beach_id`, `beach_setting_id`),
  INDEX `fk_beach_has_beach_setting_beach_setting1_idx` (`beach_setting_id` ASC),
  INDEX `fk_beach_has_beach_setting_beach1_idx` (`beach_id` ASC),
  CONSTRAINT `fk_beach_has_beach_setting_beach1`
    FOREIGN KEY (`beach_id`)
    REFERENCES `beach` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_beach_has_beach_setting_beach_setting1`
    FOREIGN KEY (`beach_setting_id`)
    REFERENCES `beach_setting` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `inclement_condition_has_beach`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `inclement_condition_has_beach` ;

CREATE TABLE IF NOT EXISTS `inclement_condition_has_beach` (
  `inclement_condition_id` INT NOT NULL,
  `beach_id` INT NOT NULL,
  PRIMARY KEY (`inclement_condition_id`, `beach_id`),
  INDEX `fk_inclement_condition_has_beach_beach1_idx` (`beach_id` ASC),
  INDEX `fk_inclement_condition_has_beach_inclement_condition1_idx` (`inclement_condition_id` ASC),
  CONSTRAINT `fk_inclement_condition_has_beach_inclement_condition1`
    FOREIGN KEY (`inclement_condition_id`)
    REFERENCES `inclement_condition` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inclement_condition_has_beach_beach1`
    FOREIGN KEY (`beach_id`)
    REFERENCES `beach` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `report_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `report_comment` ;

CREATE TABLE IF NOT EXISTS `report_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `comment_date` DATETIME NULL,
  `report_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `comment_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_report_comment_report1_idx` (`report_id` ASC),
  INDEX `fk_report_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_report_comment_report_comment1_idx` (`comment_reply_to_id` ASC),
  CONSTRAINT `fk_report_comment_report1`
    FOREIGN KEY (`report_id`)
    REFERENCES `report` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_report_comment_report_comment1`
    FOREIGN KEY (`comment_reply_to_id`)
    REFERENCES `report_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `weather_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `weather_comment` ;

CREATE TABLE IF NOT EXISTS `weather_comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` TEXT NULL,
  `comment_date` DATETIME NULL,
  `weather_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `weather_comment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_weather_comment_weather1_idx` (`weather_id` ASC),
  INDEX `fk_weather_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_weather_comment_weather_comment1_idx` (`weather_comment_id` ASC),
  CONSTRAINT `fk_weather_comment_weather1`
    FOREIGN KEY (`weather_id`)
    REFERENCES `weather` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_weather_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_weather_comment_weather_comment1`
    FOREIGN KEY (`weather_comment_id`)
    REFERENCES `weather_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS waver@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'waver'@'localhost' IDENTIFIED BY 'waver';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'waver'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `location`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (1, '8751 sand lake ct', 'lake worth', 'fl', '33467');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`) VALUES (1, 'cindy', 'cindy', 'https://www.serebii.net/pokemon/art/248.png', 'admin', 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`) VALUES (2, 'john', 'john', 'https://i.pinimg.com/550x/55/53/3a/55533ab148194fed637737e48d24c731.jpg', 'admin', 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`) VALUES (3, 'yanyan', 'yanyan', 'https://media-exp1.licdn.com/dms/image/D4E35AQH7Knjs6afHSA/profile-framedphoto-shrink_400_400/0/1634669537317?e=1635379200&v=beta&t=GVt7On3ZMHjgndjeIjLnCG1aOkxDA7aNGp0iZDAPVp0', 'admin', 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`) VALUES (4, 'kristin', 'kristin', 'https://3.bp.blogspot.com/-8FOB8-elTOE/WyOg7Y5hjVI/AAAAAAAAJyE/mYUG9TgTLZEbUC2yVsBOMtBRu_27-PT0wCLcBGAs/s1600/Photo%2B1_Parrotfiswh%2Bbeak.jpg', 'admin', 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`) VALUES (5, 'fred', '123', 'https://bloximages.newyork1.vip.townnews.com/dothaneagle.com/content/tncms/assets/v3/editorial/8/d4/8d4ed5ee-9429-11eb-9009-6f890de4cad2/6067dbb505f6a.image.jpg?resize=1200%2C800', 'user', 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`) VALUES (6, 'alicia', '123', 'https://www.edenbrothers.com/store/media/Bulbs-Flowers/resized/Calla-Captain-Ventura-2_medium.jpg', 'user', 1, 1);
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`) VALUES (7, 'stormy', '123', 'https://www.thelabradorsite.com/wp-content/uploads/2021/09/Black-Lab-Chow-Mix-LS-tall.jpg', 'user', 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `beach`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`) VALUES (1, 'Lake Worth Municipal Beach', 'Stand on the famous pier to watch a new sunrise. If you are an early riser, enjoy breakfast at Bennie’s and watch the surfers or beachgoers. There is a Casino building close by with shops and restaurants for all day fun. Then, go over the bridge to Bohemian, a bit-off-kilter downtown Lake Worth.', 'https://www.thepalmbeaches.com/sites/default/files/styles/profile_slideshow_xl/public/mmg_lfef_images/lake-worth-municipal-beach-41312-24c96632d6965d0332d2d615771cac27.jpg?itok=h7RMpqDH', 1, 1, 'no', 'yes', '5', '9 am-7 pm');

COMMIT;


-- -----------------------------------------------------
-- Data for table `report`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `report` (`id`, `comment`, `image`, `beach_id`, `user_id`, `rating`, `created`) VALUES (DEFAULT, 'A good family beach', 'https://www.thepalmbeaches.com/sites/default/files/styles/profile_slideshow_xl/public/mmg_lfef_images/lake-worth-municipal-beach-41312-24c96632d6965d0332d2d615771cac27.jpg?itok=h7RMpqDH', 1, 1, 3, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `weather`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`) VALUES (1, 'sunny', 'no clouds', 40, NULL, NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `beach_setting`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `beach_setting` (`name`, `id`, `description`) VALUES ('sandy', DEFAULT, 'sandy with clear water');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inclement_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `inclement_condition` (`name`, `id`, `description`) VALUES ('hurrican season', DEFAULT, 'crazy wind');

COMMIT;


-- -----------------------------------------------------
-- Data for table `report_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `report_comment` (`id`, `comment`, `comment_date`, `report_id`, `user_id`, `comment_reply_to_id`) VALUES (1, 'lovely day!', '2021-10-03 10:59:52 ', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `weather_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `weather_comment` (`id`, `comment`, `comment_date`, `weather_id`, `user_id`, `weather_comment_id`) VALUES (1, 'sunny and breezy', '2021-10-03 10:59:52 ', 1, 1, 1);

COMMIT;

