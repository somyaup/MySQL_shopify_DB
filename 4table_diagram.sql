use retainiqdb;

CREATE TABLE IF NOT EXISTS `storefront` (
  `idstorefront` INT NOT NULL AUTO_INCREMENT,
  `store_shopify_id` VARCHAR(45) NULL,
  `sender_no` VARCHAR(45) NULL,
  `provider` VARCHAR(45) NULL,
  PRIMARY KEY (`idstorefront`));
  
CREATE TABLE IF NOT EXISTS `customer` (
  `idcustomer` INT NOT NULL AUTO_INCREMENT,
  `phoneNo` VARCHAR(45) NULL,
  `customer_info` JSON NULL,
  `service` VARCHAR(45) NULL,
  `storefront_id` INT NOT NULL,
  PRIMARY KEY (`idcustomer`));



-- -----------------------------------------------------
-- Table `mydb`.`sms_log`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `sms_log` (
  `transaction_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `init_time` DATETIME(1) NULL,
  `message` VARCHAR(100) NULL,
  `sms_customer_id` INT NOT NULL,
  `sms_store_id` INT NOT NULL,
  PRIMARY KEY (`transaction_id`),
  CONSTRAINT `fk_sms_log_customer1`
    FOREIGN KEY (`sms_customer_id`)
    REFERENCES `customer` (`idcustomer`));

CREATE TABLE IF NOT EXISTS `store_sms_template` (
  `store_sms_id` INT NOT NULL AUTO_INCREMENT,
  `template_type` VARCHAR(45) NULL,
  `template_text` VARCHAR(45) NULL,
  `sms_storefromt_id` INT NOT NULL,
  PRIMARY KEY (`store_sms_id`),
  CONSTRAINT `fk_store_sms_template_storefront1`
    FOREIGN KEY (`sms_storefromt_id`)
    REFERENCES `storefront` (`idstorefront`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `mspdb`.`sms_log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `sms_log` ;

CREATE TABLE IF NOT EXISTS `sms_log` (
  `log_id` INT NOT NULL,
  `message` VARCHAR(43) NULL DEFAULT NULL,
  `customer_id` INT NULL DEFAULT NULL,
  `storefront_id` INT NULL DEFAULT NULL,
  `provider` VARCHAR(10) NULL DEFAULT NULL,
  `success` TINYINT(1) NULL DEFAULT NULL,
  `error` VARCHAR(30) NULL DEFAULT NULL,
  `Time_stamp` DATETIME NULL DEFAULT NULL,
  `template_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`));



-- -----------------------------------------------------
-- Table `mspdb`.`storefront`
-- -----------------------------------------------------
