USE innodb;
-- -----------------------------------------------------
-- Table `mydb`.`storefront`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS storefront (
  idstorefront INT NOT NULL AUTO_INCREMENT,
  store_shopify_id VARCHAR(45) NULL,
  sender_no VARCHAR(45) NULL,
  provider VARCHAR(45) NULL,
  store_name VARCHAR(45) NULL,
  PRIMARY KEY (idstorefront));
-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS customer (
  idcustomer INT NOT NULL AUTO_INCREMENT,
  phoneNo VARCHAR(45) NULL,
  customer_name VARCHAR(45) NULL,
  service VARCHAR(45) NULL,
  storefront_idstorefront INT NOT NULL,
  PRIMARY KEY (idcustomer));
-- ENGINE = InnoDB;

-- CREATE UNIQUE INDEX idcustomer_UNIQUE ON customer (idcustomer ASC) VISIBLE;
-- CREATE INDEX fk_customer_storefront_idx ON customer(storefront_idstorefront ASC) VISIBLE;
-- -----------------------------------------------------
-- Table `mspdb`.`Sms_template`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Sms_template (
  idSms_template INT NOT NULL,
  message VARCHAR(200) NULL,
  flow_TYPE VARCHAR(45) NULL,
  PRIMARY KEY (idSms_template));
-- ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `mydb`.`store_sms_template`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS store_sms_template (
  store_sms_id INT NOT NULL AUTO_INCREMENT,
  template_type VARCHAR(45) NULL,
  template_text VARCHAR(45) NULL,
  sms_storefromt_id INT NOT NULL,
  Sms_template_idSms_template INT NOT NULL,
  PRIMARY KEY (store_sms_id));
-- ENGINE = InnoDB;

-- CREATE UNIQUE INDEX idcustomer_UNIQUE2 ON store_sms_template (store_sms_id ASC) VISIBLE;
CREATE INDEX store_Sms_template1_id ON store_sms_template (sms_storefromt_id ASC) VISIBLE;
CREATE INDEX store_Sms_template1_id ON store_sms_template (Sms_template_idSms_template ASC) VISIBLE;
-- -----------------------------------------------------
-- Table `sms_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sms_log (
  transaction_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  init_time DATETIME(1) NULL,
  message VARCHAR(100) NULL,
  sms_customer_id INT NOT NULL,
  sms_store_id INT NOT NULL,
  PRIMARY KEY (transaction_id));
-- ENGINE = InnoDB;
CREATE INDEX log_customer1_id ON sms_log (sms_customer_id ASC) VISIBLE;
CREATE INDEX log_store_sms_template1_id ON sms_log (sms_store_id ASC) VISIBLE;
-- -----------------------------------------------------
-- Table `mspdb`.`sms_log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS sms_log (
  log_id INT NOT NULL,
  message VARCHAR(43) NULL DEFAULT NULL,
  customer_id INT NULL DEFAULT NULL,
  storefront_id INT NULL DEFAULT NULL,
  provider VARCHAR(10) NULL DEFAULT NULL,
  success TINYINT(1) NULL DEFAULT NULL,
  error VARCHAR(30) NULL DEFAULT NULL,
  Time_stamp DATETIME NULL DEFAULT NULL,
  template_id INT NULL DEFAULT NULL,
  PRIMARY KEY (log_id));
-- ENGINE = InnoDB
-- DEFAULT CHARACTER SET = utf8mb4
-- COLLATE = utf8mb4_0900_ai_ci;
-- -----------------------------------------------------
-- Table `mspdb`.`storefront`
-- -----------------------------------------------------

