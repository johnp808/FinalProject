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
  `street` VARCHAR(100) NULL,
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
  `password` VARCHAR(300) NULL,
  `profile_image` VARCHAR(3000) NULL,
  `role` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `location_id` INT NOT NULL,
  `email` VARCHAR(100) NULL,
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
  `price_of_admission` VARCHAR(300) NULL,
  `hours` VARCHAR(45) NULL,
  `enabled` TINYINT NULL,
  `rating` DOUBLE NULL,
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
  `comment` TEXT NULL,
  `image` VARCHAR(3000) NULL,
  `beach_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `rating` INT NULL,
  `created` DATETIME NULL,
  `enabled` TINYINT NULL,
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
  `weather_type` VARCHAR(100) NULL,
  `description` TEXT NULL,
  `temperature_celsius` INT NULL,
  `created` DATETIME NULL,
  `wave_size` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `beach_id` INT NOT NULL,
  `enabled` TINYINT NULL,
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
  `weather_comment_id` INT NULL,
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
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (2, '6620 North Ocean Boulevard', 'Ocean Ridge', 'fl', '33435');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (3, '6990 N. Ocean Boulevard', 'Ocean Ridge', 'FL ', '33435');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (4, '4489 N. Ocean Boulevard', 'Gulfstream', 'FL ', '33483');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (5, '10 S Ocean Blvd', 'Lake Worth', 'FL ', '33460');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (6, '2010 N Federal Hwy', 'Boynton Beach', 'FL ', '33435');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (7, '700 NE 4th Ave', 'Boyton Beach', 'FL ', '33435');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (8, '300 Boynton Lakes Blvd', 'Boynton Beach', 'FL ', '33435');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (9, '2050 Florida A1A', 'Jupiter', 'FL ', '33477');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (10, '400 S. S.R. A1A', 'Jupiter', 'FL', '33477');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (11, '1600 Beach Road', 'Tequesta', 'FL', '33469');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (12, '19075 DuBois Road', 'Jupiter', 'FL', '33477');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (14, '2188 Marcinski\n\n\n', 'Jupiter', 'FL', '33477');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (15, '3001 N Ocean Blvd', 'Boca Raton', 'FL', '33431');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (16, '240 Las Olas Cir', 'Fort Lauderdale', 'FL', '33316');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (17, '100 NE 4th St', 'Boynton Beach', 'FL', '33435');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (18, '48 Ocean Blvd', 'Jupiter', 'FL', '33477');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (19, 'Hobe Sound Beach', 'Jupiter Island', 'FL', '33455');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (20, '1585 SE MacArthur Blvd', 'Stuart', 'FL', '34996');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (21, '3860 N Ocean Dr', 'Riviera Beach', 'FL', '33404');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (22, '74 Onekahakaha Rd', 'Hilo', 'HI ', '96720');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (23, 'Waikiki Beach', 'Honolulu', 'HI ', '96815');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (37, '69-275 Waikōloa Beach Dr', 'Waikoloa Village', 'HI', '96738');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (38, 'Kahanamoku Beach', 'Honolulu', 'HI', '96815');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (24, 'Kamehameha Beach', 'Honolulu', 'HI', '96818');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (25, 'Ulua Beach', 'Wailea-Makena', 'HI', '96753');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (26, 'Queen\'s Beach', 'Honolulu', 'HI', '96815');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (27, 'Wawaloli Beach', 'Kalaoa', 'HI', '96740');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (28, 'Amala Pl', 'Kahului', 'HI', '96732');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (29, 'Po‘olenalena Beach', 'Wailea-Makena', 'HI', '96753');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (30, '1700 Atlantic Ave', 'Virginia Beach', 'VA', '23451');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (31, 'Maryland Beach', 'Ocean City', 'MD', '21842');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (32, 'Brighton 2nd St. &, Brightwater Ct', 'Brooklyn', 'NY', '11235');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (33, 'Coney Island Beach', 'Brooklyn', 'NY', '11224');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (34, '1850 Ocean Front St', 'San Diego', 'CA', '92107');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (35, '200 Santa Monica Pier', 'Santa Monica', 'CA', '90401');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (36, 'Ocean Front Walk', 'Santa Monica', 'CA', '90401');
INSERT INTO `location` (`id`, `street`, `city`, `state`, `zip`) VALUES (13, '2188 Marcinski Rd', 'Jupiter', 'FL', '33477');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`, `email`) VALUES (1, 'cindy', '$2a$12$nlMOo29ODu6FIQbR.87Gze635XyMCMvMJAh54a0Y24yhGohCCqrG.', 'https://www.serebii.net/pokemon/art/248.png', 'admin', 1, 1, 'cindy@waves.com');
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`, `email`) VALUES (2, 'john', '$2a$12$6H17xNDdJ7M7WbUEWePG/exhG600bkpgFaMiSW2AcWVTKawDCb89m', 'https://i.pinimg.com/550x/55/53/3a/55533ab148194fed637737e48d24c731.jpg', 'admin', 1, 1, 'john@waves.com');
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`, `email`) VALUES (3, 'yanyan', '$2a$12$43MiQKGc0qLTfh46cA1ca.4d0X0lHVSb/bXyI.HABQGe21Vo/PRh.', 'https://cdn1.vectorstock.com/i/1000x1000/03/45/cute-fish-cartoon-vector-1430345.jpg', 'admin', 1, 1, 'yanyan@waves.com');
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`, `email`) VALUES (4, 'kristin', '$2a$12$SCAJxyMAFAkVom80go/pSuUTWhBtlEo2ykt59Dgg5T0Oqhqo7NtGy', 'https://3.bp.blogspot.com/-8FOB8-elTOE/WyOg7Y5hjVI/AAAAAAAAJyE/mYUG9TgTLZEbUC2yVsBOMtBRu_27-PT0wCLcBGAs/s1600/Photo%2B1_Parrotfiswh%2Bbeak.jpg', 'admin', 1, 1, 'kristin@waves.com');
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`, `email`) VALUES (5, 'fred', '$2a$12$tBlS0fAF30M6iiEEVaP5Tu0..mxekmfbZQU7h/bqhWNmlNpzbyi9m', 'https://bloximages.newyork1.vip.townnews.com/dothaneagle.com/content/tncms/assets/v3/editorial/8/d4/8d4ed5ee-9429-11eb-9009-6f890de4cad2/6067dbb505f6a.image.jpg?resize=1200%2C800', 'user', 1, 1, 'fred@waves.com');
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`, `email`) VALUES (6, 'alicia', '$2a$12$IsiHptK89xfJ5BIMx.VHo.TGgMTYrs7pyCFvWVNKkt6NKKB2Cyaqa', 'https://www.edenbrothers.com/store/media/Bulbs-Flowers/resized/Calla-Captain-Ventura-2_medium.jpg', 'user', 1, 1, 'alicia@waves.com');
INSERT INTO `user` (`id`, `username`, `password`, `profile_image`, `role`, `enabled`, `location_id`, `email`) VALUES (7, 'stormy', '$2a$12$LfcFE7d37Zf2Zjs1eCQryOEh5n1Z8eOsQVLTmlM/LC9aUiDV1Gp/q', 'https://www.thelabradorsite.com/wp-content/uploads/2021/09/Black-Lab-Chow-Mix-LS-tall.jpg', 'user', 1, 1, 'stormy@waves.com');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beach`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (1, 'Lake Worth Municipal Beach', 'Stand on the famous pier to watch a new sunrise. If you are an early riser, enjoy breakfast at Bennie’s and watch the surfers or beachgoers. There is a Casino building close by with shops and restaurants for all day fun. Then, go over the bridge to Bohemian, a bit-off-kilter downtown Lake Worth.', 'https://www.thepalmbeaches.com/sites/default/files/styles/related/public/Lantana-Beach-Sunrise-with-Coconut-Trees.jpg?itok=SQ5EP7Eq', 5, 1, 'no', 'yes', '5', '9 am-7 pm', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (2, 'Ocean Ridge Hammock Park', 'Accessed by a wooded trail, this secluded area offers an unguarded beach area, swimming & fishing.', 'https://fastly.4sqi.net/img/general/600x600/2441237_VNSXmFoXYFeHu2DMblGDM6xsarobWXYbfdWJmhDvIjA.jpg', 2, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (3, 'Ocean Inlet Park', 'Set on the ocean, this public area offers swimming, kayaking & fishing, plus picnic spots.', 'https://www.lotsafunmaps.com/view.php?id=6260', 3, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (4, 'Gulfstream Park', 'Modest beachfront park with a playground, picnic tables, BBQ grills & palm trees.', 'https://beachcatcher.com/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZzBOIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b05dbddbf70998e5dfd38685fb22306d77798a5e/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9MY21WemFYcGxTU0lKTmpJMVhnWTZCa1ZVIiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--b3e6e6f13118646b539080d9d2278b4ce73ed6a7/18bd31a4-2001-4e8e-b684-6b25f7cafae6.jpeg', 4, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (5, 'Harvey E. Oye Jr. Park', 'Oceanfront park beach is open 365 days a year from sunrise to 9:00 p.m; Lifeguards are on duty every day from 9 am – 5 pm. The staff is certified or licensed as First Responders or EMT’s.  Designated surfing and skim board areas are located at the north and south end of the beach. ', 'https://captainkimo.s3.amazonaws.com/wp-content/uploads/2018/11/02122151/Harvey-E-Oyer-Jr-Park-Public-Boat-Ramp-to-Boynton-Inlet.jpg', 6, 1, 'yes', 'yes', '0', '9 am – 5 pm', 1, 4.5);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (6, 'Mangrove Park', 'This nature area with wildlife features a suspended walkway over water & interpretive signs.', 'https://www.thepalmbeaches.com/sites/default/files/styles/profile_slideshow_xl/public/mmg_lfef_images/mangrove-park-42313-9dd47b5ae978f8301586c029381e4db4.jpg?itok=MfMPafRf', 7, 0, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.1);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (7, 'Boynton Lakes Park', 'This is a neighborhood park that is maintained by the city of Boynton Beach. There is approximately 8 parking spaces and no restrooms. Mainly used by neighborhood families it can be a nice quiet place to play or take bike rides. There is a large open field adjacent to the playground that\'s great for frisbee, football, or soccer games. The playground equipment is mostly for younger kids and the pavilion is very small so not for party use. Swings are both infant and normal so older kids and adults may also swing. ', 'https://www.boynton-beach.org/sites/default/files/styles/hero_image_style/public/images/Landing%20Pages/Parks%20and%20Rec/boynton%20lakes%201567%20x%20498%20.jpg?itok=68eyKJiC', 8, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.3);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (8, 'Jupiter Beach Park', 'Jupiter Beach Park lies on the south side of the Jupiter Inlet. It has 1,700 feet of guarded beach, picnic areas with grills, restrooms, outdoor showers and a sand volleyball court. Park hours are sunrise to sunset but inlet fishing is available 24 hours.\n\nTo rent a pavilion please call (561) 966-6611', 'https://youimg1.tripcdn.com/target/0ww3l120008yal5li6094_C_750_420.jpg_.webp?proc=source%2Ftrip', 9, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (9, 'Carlin Park', 'Carlin Park hosts 3,000 feet of guarded beach and has plentiful amenities to suit most anyone\'s needs. From bocce ball, tennis, sand volleyball, playgrounds, exercise running course, restroom facilities, picnic areas, shelters with grills and a cafe, there\'s a lot of recreation activities available at Carlin Park. ', 'https://media-cdn.tripadvisor.com/media/photo-s/0b/f1/4c/4f/access-to-the-beautiful.jpg', 10, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (10, 'Coral Cove Park', 'While this park is light on acreage, once here, you\'ll experience the beauty of old Florida. Coral Cove park has 600 feet of guarded beach, 600 feet of intracoastal waterway frontage, picnic areas with grills, playground, restroom facilities and outdoor showers.', 'https://upload.wikimedia.org/wikipedia/commons/6/6e/CCPbeach.jpg', 11, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (11, 'Dubois Park', 'Operated by: Palm Beach County Parks & Recreation Department \n(561) 966-6600 \n18.69 acres\n\n*Swimming area is guarded from 9:00 am - 5:20 pm, seven days a week from Memorial Day until Palm Beach County public schools begin in August; when school starts, swimming areas will be guarded only on weekends until Memorial Day.', 'http://1.bp.blogspot.com/-M8oGFfrgYdU/ThYbqMElA9I/AAAAAAAAAm4/nEpDp0WHAvg/s1600/IMG_0105.JPG', 12, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.8);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (12, 'Ocean Cay Park', 'Ocean Cay Park has beach frontage and lifeguard service is provided.  Visitors are encouraged to always swim near a lifeguard during guarded hours. This beautiful park has many amenities for the whole family to enjoy. Picnic pavilions, shelters, playgrounds, restrooms, outdoor showers, sand volleyball courts, bus shelter and a seating plaza.', 'https://images.squarespace-cdn.com/content/v1/500743e6e4b008384abeb1b5/1343309547269-R32S96JA92D5IUU1DO81/Ocean+Cay+Park+Palm+Beach+County+Open+Buffer+pavallions.jpg?format=1000w', 13, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (13, 'South Beach Park', 'A 24.5-acre beach area featuring 3 swimming areas plus surf, fishing & bird-watching opportunities.', 'https://lh5.googleusercontent.com/p/AF1QipNzfT1KM-X9xavVfnBuxDYRERfPU1VHOgWHjFjp=w408-h306-k-no', 14, 1, 'yes', 'yes', '0', '8AM-8PM', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (14, 'Bark Park Dog Beach', 'Bark Beach is pet-friendly. Local dogs are welcome with a permit at this dog-friendly beach at Spanish River Park.', 'https://lh5.googleusercontent.com/p/AF1QipOhCISOGpUkpPNh3IfhjCRIRnRt58X9kM6RTxPb=w408-h306-k-no', 15, 1, 'yes!', 'yes', 'Resident - $31 per dog (City of Boca Raton & Greater Boca Raton Beach and Park District)\n\nNon-Resident - $167 per dog\n\nWeekend Passes - $11 per dog, Parking is $25', 'Fri-Sun 7-9AM, 5-7PM; Mon-Thur Closed', 1, 4.3);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (15, 'Las Olas Beach', 'This busy public beach offers white sand & palm trees, plus restaurants, lodging & stores.', 'https://lh5.googleusercontent.com/p/AF1QipM40zTIlVoItmZDrIbuWwOklyty_S0MMxsvju2_=w408-h306-k-no', 16, 1, 'yes', 'yes', '0', '24/7', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (16, 'Dewey Park', 'Compact grassy lawn with funky outdoor sculptures & mature trees, plus cement tables & stools.', 'https://lh5.googleusercontent.com/p/AF1QipPq-IXH_AIDTC6Q7rw0jo7YnF5Cu-NZmR01Oi7K=w408-h306-k-no', 17, 1, 'yes', 'yes', '0', '6AM-6PM', 1, 4.2);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (17, 'Jupiter Off-Leash Dog Beach', 'Jupiter Dog Beach is a 2.5-mile stretch of beach that starts at dune crossover marker #26 (north of Ocean Cay Park, 2188 Marcinski Road in Jupiter) and proceeds north to dune crossover marker #57 (south of Carlin Park, 400 S. S.R. A1A in Jupiter).\n\nWell-socialized, obedient dogs and their conscientious owners are welcome to visit from sunrise to sunset, where dogs can play and swim off-leash. Parking is free and restrooms and showers are located at nearby Ocean Cay Park and Carlin Park.', 'https://lh5.googleusercontent.com/p/AF1QipPL-pan7Xs_HUMVEMhDEyhmJevYjC7H4QZkC3rF=w408-h306-k-no', 18, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.8);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (18, 'Hobe Sound Beach', 'Take the scenic drive east on SE Bridge Rd through the tree canopy and end up at the Hobe Sound Public Beach Park. This guarded beach is a great spot for you to soak up the sun and enjoy a day with family and friends.', 'https://lh5.googleusercontent.com/p/AF1QipNWDqfNRmb1mVrsK4GyqygZvKvzaDINaD-6YItT=w408-h306-k-no', 19, 1, 'yes', 'yes', '0', '24/7', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (19, 'Bathtub Beach', 'Bathtub Reef is located just offshore at Bathtub Beach Park in Stuart, Florida. Bathtub Beach is special, due in large part to this reef system, which is home to more than 500 marine creatures, including endangered sea turtles. This reef system is created by tiny tube-building Sabellariid sea worms and is not only incredibly unique, but also an extremely fragile one.\n\nThe worms cement sand grains together, creating a vast network of tube dwellings. Colonies build up over time and create a reef system that helps break waves in the summer months, creating a “bathtub effect.', 'https://lh5.googleusercontent.com/p/AF1QipOV96xlaxN7lrf-DYIQNhdfrVZpEq91UhAKbf_L=w312-h192-p-k-no', 20, 1, 'yes', 'yes', '0', '24/7', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (20, 'Riviera Beach', 'Riviera Beach is a city in Palm Beach County, Florida, United States, which was incorporated September 29, 1922. Due to the location of its eastern boundary, it is also the easternmost municipality in the Miami metropolitan area, which was home to an estimated 6,012,331 people in 2015.', 'https://lh5.googleusercontent.com/p/AF1QipPWjJzvYX-G-wScnnFTe7mRjWuwv8DqK2dVexuZ=w426-h240-k-no', 21, 1, 'no', 'yes', '0', '7AM-8PM', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (21, 'Onekahakaha Beach Park', 'Familiar recreation stop with kid-friendly wading & tidal pools, picnic shelters & play equipment.', 'https://lh5.googleusercontent.com/p/AF1QipOtAgMwL4yxGQvhrHcYIq4J1QJQuyb7ngnyn8A=w408-h306-k-no', 22, 1, 'yes', 'yes', '0', '7AM-9PM', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (22, 'Waikīkī Beach', 'Famous beach with palm trees, white sand & Diamond Head views, plus posh resorts & restaurants.', 'https://lh5.googleusercontent.com/p/AF1QipMjHpEnOE7RRwC-08QdJf7G7rQ-8bV-Khu2L_XU=w408-h326-k-no', 23, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (23, 'ʻAnaehoʻomalu Beach', 'White-sand beach for swimming & snorkeling, with 2 fishponds & a hiking trail nearby.', 'https://lh5.googleusercontent.com/p/AF1QipNXqSg4nZRRc-ry4fnq-8W1G5f4Os_578Wr5tPf=w408-h306-k-no', 37, 1, 'yes', 'yes', '0', '24/7', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (24, 'Kahanamoku Beach', 'This sandy, curved beach offers swimming, surfing, paddle-boarding & sunning.', 'https://lh5.googleusercontent.com/p/AF1QipNR0qA0qHLA8q9NYrxqv4maiGESJ2SHfGpzaAxv=w408-h306-k-no', 38, 1, 'yes', 'yes', '0', '6Am-10PM', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (25, 'Kamehameha Beach', 'This small beach is situated behind the Hotel King Kamehameha Beach Hotel. It is the perfect place for children, as the beach is protected from the open sea and there is a shallow surf. You always have to be careful because many people launch their kayaks and canoes from this point.', 'https://lh5.googleusercontent.com/p/AF1QipO0sIMPUVTsx-qY8Elnc1hRGHy2r3r2i6gqbRu1=w408-h306-k-no', 24, 1, 'No Pets Allowed', 'yes', '0', '24/7', 1, 4.5);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (26, 'Ulua Beach Park', 'Sandy, palm-fringed beach popular for swimming & bodyboarding with showers, restrooms & parking.', 'https://lh5.googleusercontent.com/p/AF1QipMTCY9td04CVBGLsoL-G9X5IO6a_jJUTdDpqUTw=w423-h240-k-no', 25, 1, 'yes', 'yes', '0', '24/7', 1, 4.8);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (27, 'Queens Beach', 'Located between the Waikiki Aquarium and Kapahulu Groin, Queen’s beach is popular among bodyboarders and snorkelers. Designated as a Marine Life Conservation District, you’ll spot many colorful fish in the area. Queen’s also hosts special movie nights at sunset on its 1,000-foot outdoor movie screen.', 'https://lh5.googleusercontent.com/p/AF1QipNH1izesCDLJ1EUaFCEDY11ORJ9aHDgqwIZWBuP=w408-h271-k-no', 26, 1, 'yes', 'yes', '0', '24/7', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (28, 'Wawaloli Beach', 'Located just seven miles from downtown Kailua-Kona and beyond the Kona Airport runway, you will find Wawaloli Beach Park. This beach park is operated by the Natural Energy Laboratory of Hawaii (NELHA) within the Hawaii Ocean Science and Technology (HOST) park.', 'https://lh5.googleusercontent.com/p/AF1QipOHx6qHFkXS_2ggFHu_I6rBslsigbfpbTbY2V31=w493-h240-k-no', 27, 1, 'yes', 'yes', '0', '24/7', 1, 4.4);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (29, 'Kanaha Beach', 'Tranquil beach retreat offering swimming, picnicking & volleyball, plus kite & windsurfing areas.', 'https://lh5.googleusercontent.com/p/AF1QipPBf49T1hvyj1IAa6JqKLlPfnJN9_8mveVeeZxZ=w426-h240-k-no', 28, 1, 'yes', 'yes', '0', '24/7', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (30, 'Po‘olenalena Beach', 'If you\'re looking for a quiet beach away from it all, this is one of them. Tucked beyond a patch of keawe forest in Wailea, Chang\'s Beach offers that simple sumptuousness common to most beaches in the Makena area — minus the crowds. Although the white sand here blankets less than half a mile, you\'ll often find Chang\'s sparsely populated on the weekdays due to its unassuming location.', 'https://images.fineartamerica.com/images/artworkimages/mediumlarge/1/poolenalena-beach-sunrise-pierre-leclerc-photography.jpg', 29, 1, 'yes', 'yes', '0', '24/7', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (31, 'Virginia Beach', 'Boasting a 3-mile boardwalk, this bustling area offers sandy beaches, cafes & shops.', 'https://assets.simpleviewinc.com/simpleview/image/upload/c_limit,h_1200,q_75,w_1200/v1/clients/virginia/HR19041103P_001_44ffec26-db50-4dc9-9844-831c02c9ee04.jpg', 30, 1, 'yes', 'yes', '0', '24/7', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (32, 'Maryland Beach', 'Miles-long stretch of sand with boardwalk arcades & restaurants, plus summer movies & concerts.', 'https://lh5.googleusercontent.com/p/AF1QipPQQWmuSo9qmBQjM6aOhn-OocEryA4LbvXK14Mh=w408-h306-k-no', 31, 1, 'yes', 'yes', '0', '24/7', 1, 4.5);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (33, 'Brighton Beach', 'Also known as \"Little Odessa\" due its tight-knit Russian and Eastern European communities, Brooklyn\'s Brighton Beach is a lively neighborhood with many high-rise residential buildings. Traditional ethnic restaurants and food markets line Brighton Beach Avenue. The beach and boardwalk here are more laid-back than nearby Coney Island, catering largely to locals. Splashy nightclubs attract partiers in the evenings.', 'https://848090.smushcdn.com/1795165/wp-content/uploads/2019/08/Brighton-beach-Pier-UK-in-Autumn.jpg?lossy=1&strip=1&webp=1', 32, 1, 'yes', 'yes', '0', '24/7', 1, 4.4);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (34, 'Coney Island Beach', 'Coney Island offers an ideal summer respite from the hectic and steamy city. With nearly 3 miles of sandy beaches, Coney Island’s sunny skies and rolling waves make for the perfect getaway. If being active at the beach is more your idea of fun than just catching some rays, Coney Island also offers exciting recreation opportunities. With courts for beach volleyball, handball, and basketball as well as playgrounds and amusement rides, the beach and boardwalk can provide hours of entertainment.', 'https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&w=1800&h=900&url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F28%2F2021%2F05%2F12%2Fconey-island-beach-1960-CONEYISLAND0521.jpg', 33, 1, 'yes', 'yes', '0', '24/7', 1, 4.5);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (35, 'Ocean Beach', '3.5-mile white sand beach with fire pits & restrooms, a popular spot for flying kites & windsurfing.', 'https://www.nps.gov/goga/getinvolved/images/A_OCBE_150215_ATB_4E.jpg', 34, 1, 'yes', 'yes', '0', '24/7', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (36, 'Santa Monica State Beach', 'Maintained by the city, this beach is fringed by a range of businesses & offers many activities.', 'https://www.planetware.com/wpimages/2019/06/california-santa-monica-top-attractions-santa-monica-state-beach.jpg', 35, 1, 'yes', 'yes', '0', '24/7', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (37, 'Original Muscle Beach Santa Monica', 'Beach workout area, dating to the 1930s, with popular public bars, rings & ropes over the sand.', 'https://www.stack3d.com/wp-content/uploads/2019/05/muscle-beach.jpg', 36, 1, 'yes', 'yes', '0', '24/7', 1, 4.6);

COMMIT;


-- -----------------------------------------------------
-- Data for table `report`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `report` (`id`, `comment`, `image`, `beach_id`, `user_id`, `rating`, `created`, `enabled`) VALUES (1, 'I grew up going to this beach. Such a great location!', 'https://www.thepalmbeaches.com/sites/default/files/styles/profile_slideshow_xl/public/mmg_lfef_images/lake-worth-municipal-beach-41312-24c96632d6965d0332d2d615771cac27.jpg?itok=h7RMpqDH', 1, 1, 4, '2021-10-26 09:14:30', 1);
INSERT INTO `report` (`id`, `comment`, `image`, `beach_id`, `user_id`, `rating`, `created`, `enabled`) VALUES (2, 'This my favorite beach for finding sticks!', 'https://i5.walmartimages.com/asr/f27e73f7-2b1b-46b1-8f7d-468608c1079a_1.a494aafcca6d2cf4af5eac74bd837823.jpeg', 2, 7, 5, '2021-10-28 09:15:30', 1);
INSERT INTO `report` (`id`, `comment`, `image`, `beach_id`, `user_id`, `rating`, `created`, `enabled`) VALUES (3, 'We saw dolphins today! So exciting!', 'https://i.pinimg.com/736x/a1/7f/84/a17f84f2ad01a9df3971e3f2f24ef8a9--jupiter-florida-dolphins.jpg', 8, 5, 5, '2021-10-25 13:47:02', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorites`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (1, 1);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (1, 4);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (1, 5);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (1, 8);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (5, 2);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (6, 3);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (7, 7);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (5, 9);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (6, 10);
INSERT INTO `favorites` (`user_id`, `beach_id`) VALUES (7, 11);

COMMIT;


-- -----------------------------------------------------
-- Data for table `weather`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (1, 'Sunny and 80! The best kind of day for the beach!', 'no clouds', 80, '2021-10-26 09:14:45', 'Chest Height', 1, 1, 1);
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (2, 'Sunny with a few clouds', 'Bluse skies, a couple of puffy white clouds and temps somewhere in the 70s. Its a dream out here', 75, '2021-10-30 11:26:07', 'Chest Height', 5, 2, 1);
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (3, 'Rainy', 'Stormy and muggy, not a good day for this beach.', 89, '2021-10-28 09:14:30', 'Overhead', 6, 8, 1);
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (4, 'cloudy', ' cdkbchdnk', 90, '2021-10-26 9:14:45', 'Chest Height', 2, 2, 1);
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (5, 'windy', ' dclsklk', 80, '2021-10-26 9:14:45', 'Chest Height', 3, 3, 1);
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (6, 'sunny but windy', 'dkjvcnkd', 70, '2021-10-26 9:14:45', 'Chest Height', 4, 4, 1);
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (7, 'cloudy', ' cdkbchdnk', 90, '2021-10-26 9:14:45', 'Chest Height', 1, 3, 1);
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (8, 'windy', ' dclsklk', 80, '2021-10-26 9:14:45', 'Chest Height', 5, 4, 1);
INSERT INTO `weather` (`id`, `weather_type`, `description`, `temperature_celsius`, `created`, `wave_size`, `user_id`, `beach_id`, `enabled`) VALUES (9, 'sunny but windy', 'dkjvcnkd', 70, '2021-10-26 9:14:45', 'Chest Height', 6, 7, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `beach_setting`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `beach_setting` (`name`, `id`, `description`) VALUES ('sandy', 1, 'sandy with clear water');

COMMIT;


-- -----------------------------------------------------
-- Data for table `inclement_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `inclement_condition` (`name`, `id`, `description`) VALUES ('hurricane season', 1, 'crazy wind');

COMMIT;


-- -----------------------------------------------------
-- Data for table `beach_has_beach_setting`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `beach_has_beach_setting` (`beach_id`, `beach_setting_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `inclement_condition_has_beach`
-- -----------------------------------------------------
START TRANSACTION;
USE `wavesdb`;
INSERT INTO `inclement_condition_has_beach` (`inclement_condition_id`, `beach_id`) VALUES (1, 2);

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

