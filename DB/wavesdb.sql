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
  `price_of_admission` VARCHAR(45) NULL,
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
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (3, 'Ocean Inlet Park', 'TBD', 'https://www.lotsafunmaps.com/view.php?id=6260', 3, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (4, 'Gulfstream Park', 'TBD', 'https://beachcatcher.com/rails/active_storage/representations/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaHBBZzBOIiwiZXhwIjpudWxsLCJwdXIiOiJibG9iX2lkIn19--b05dbddbf70998e5dfd38685fb22306d77798a5e/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdCam9MY21WemFYcGxTU0lKTmpJMVhnWTZCa1ZVIiwiZXhwIjpudWxsLCJwdXIiOiJ2YXJpYXRpb24ifX0=--b3e6e6f13118646b539080d9d2278b4ce73ed6a7/18bd31a4-2001-4e8e-b684-6b25f7cafae6.jpeg', 4, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (5, 'Harvey E. Oye Jr. Park', 'Oceanfront park beach is open 365 days a year from sunrise to 9:00 p.m; Lifeguards are on duty every day from 9 am – 5 pm. The staff is certified or licensed as First Responders or EMT’s.  Designated surfing and skim board areas are located at the north and south end of the beach. ', 'https://captainkimo.s3.amazonaws.com/wp-content/uploads/2018/11/02122151/Harvey-E-Oyer-Jr-Park-Public-Boat-Ramp-to-Boynton-Inlet.jpg', 6, 1, 'yes', 'yes', '0', '9 am – 5 pm', 1, 4.5);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (6, 'Mangrove Park', 'This nature area with wildlife features a suspended walkway over water & interpretive signs.', 'https://www.thepalmbeaches.com/sites/default/files/styles/profile_slideshow_xl/public/mmg_lfef_images/mangrove-park-42313-9dd47b5ae978f8301586c029381e4db4.jpg?itok=MfMPafRf', 7, 0, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.1);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (7, 'Boynton Lakes Park', 'This is a neighborhood park that is maintained by the city of Boynton Beach. There is approximately 8 parking spaces and no restrooms. Mainly used by neighborhood families it can be a nice quiet place to play or take bike rides. There is a large open field adjacent to the playground that\'s great for frisbee, football, or soccer games. The playground equipment is mostly for younger kids and the pavilion is very small so not for party use. Swings are both infant and normal so older kids and adults may also swing. ', 'https://www.boynton-beach.org/sites/default/files/styles/hero_image_style/public/images/Landing%20Pages/Parks%20and%20Rec/boynton%20lakes%201567%20x%20498%20.jpg?itok=68eyKJiC', 8, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.3);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (8, 'Jupiter Beach Park', 'Jupiter Beach Park lies on the south side of the Jupiter Inlet. It has 1,700 feet of guarded beach, picnic areas with grills, restrooms, outdoor showers and a sand volleyball court. Park hours are sunrise to sunset but inlet fishing is available 24 hours.\n\nTo rent a pavilion please call (561) 966-6611', 'https://youimg1.tripcdn.com/target/0ww3l120008yal5li6094_C_750_420.jpg_.webp?proc=source%2Ftrip', 9, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.6);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (9, 'Carlin Park', 'Carlin Park hosts 3,000 feet of guarded beach and has plentiful amenities to suit most anyone\'s needs. From bocce ball, tennis, sand volleyball, playgrounds, exercise running course, restroom facilities, picnic areas, shelters with grills and a cafe, there\'s a lot of recreation activities available at Carlin Park. ', 'https://media-cdn.tripadvisor.com/media/photo-s/0b/f1/4c/4f/access-to-the-beautiful.jpg', 10, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (10, 'Coral Cove Park', 'While this park is light on acreage, once here, you\'ll experience the beauty of old Florida. Coral Cove park has 600 feet of guarded beach, 600 feet of intracoastal waterway frontage, picnic areas with grills, playground, restroom facilities and outdoor showers.', 'https://upload.wikimedia.org/wikipedia/commons/6/6e/CCPbeach.jpg', 11, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.7);
INSERT INTO `beach` (`id`, `name`, `description`, `default_image`, `location_id`, `operational`, `pet_friendly`, `parking_available`, `price_of_admission`, `hours`, `enabled`, `rating`) VALUES (11, 'Dubois Park', 'Operated by: Palm Beach County Parks & Recreation Department \n(561) 966-6600 \n18.69 acres\n\n*Swimming area is guarded from 9:00 am - 5:20 pm, seven days a week from Memorial Day until Palm Beach County public schools begin in August; when school starts, swimming areas will be guarded only on weekends until Memorial Day.', 'http://1.bp.blogspot.com/-M8oGFfrgYdU/ThYbqMElA9I/AAAAAAAAAm4/nEpDp0WHAvg/s1600/IMG_0105.JPG', 12, 1, 'yes', 'yes', '0', 'Sunrise-Sunset', 1, 4.8);

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

