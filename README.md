```
CREATE DATABASE wackypedia;
```

```
CREATE TABLE `wackypedia`.`article` ( `ID` INT NOT NULL AUTO_INCREMENT , `title` VARCHAR(255) NOT NULL , PRIMARY KEY (`ID`)) ENGINE = InnoDB;
```

```
CREATE TABLE `wackypedia`.`author` ( `ID` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR(255) NOT NULL , PRIMARY KEY (`ID`)) ENGINE = InnoDB;
```

```
CREATE TABLE `wackypedia`.`section` ( `ID` INT NOT NULL AUTO_INCREMENT , `title` VARCHAR(255) NOT NULL , `imageLink` VARCHAR(255) NOT NULL , `body` LONGTEXT NOT NULL , `articleID` INT NOT NULL , PRIMARY KEY (`ID`)) ENGINE = InnoDB;
```

```
CREATE TABLE `wackypedia`.`articles_authors` ( `ID` INT NOT NULL AUTO_INCREMENT , `article_ID` INT NOT NULL , `author_ID` INT NOT NULL , PRIMARY KEY (`ID`)) ENGINE = InnoDB;
```

For tests
Repeat for wackypedia_test.