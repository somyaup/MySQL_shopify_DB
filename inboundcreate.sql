use retainiqdb;
CREATE TABLE IF NOT EXISTS `inbound` (
  `idinbound` INT NOT NULL AUTO_INCREMENT,
  `sms_store_id` VARCHAR(45) NULL,
  `sms_customer_id` VARCHAR(45) NULL,
  `message` VARCHAR(160) NULL,
  `init_time` datetime Null,
  PRIMARY KEY (`idinbound`));
-- init_time,message,sms_store_id,sms_customer_id;