# Wackypedia

By 
Theary, Young, Florin and Tristan 03/12/19

## Description


## Setup/Installation Requirements

### To Clone:
<br/>Download .NET Core 1.1.4 SDK and .NET Core Runtime 1.1.2 and install them. Download Mono and install it.
<br/>Open terminal and $ cd into preferred destination of clone
<br/>Run the command:
```;'
$ git clone https://github.com/xxxxxxxxxx
```
<br/>Navigate into the Wackypedia directory
```
$ cd Wackypedia.Solution
```
### To edit: 
<br/>open entire dot solutions director in preffered text editor

### Setup:
<br/>Download and install MAMP: https://www.mamp.info/en/downloads
<br/>Open mamp, click preferences, select ports tab, Set the Apache Port to 8888, the MySQL Port to 8889, then click OK.
<br/>Start servers
<br/>Click on Open WebStart page
<br/>Click on 'tools' at the top menu bar then click on PHPMYADMIN
<br/>Click on databases, click on import, in the Wackypedia.Solution's folder select and import wackypedia.sql, then inport wackypedia_test.sql.
<br/>In command prompt or terminal, Navigate into Wackypedia.Solution folder: 
```
$ cd Wackypedia.Solution
```
<br/>Navigate into Wackypedia directory: 
```
$ cd Wackypedia
```
<br/>while in the Wackypedia directory use the commands:
```
$ dotnet restore
$ dotnet run
```
<br/>Open the path from "Now listening on: http://localhost:5000 in your favorite web browser

### To run tests:



### Creating tables manually in MySql:

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

## Specs

|   Behavior                          | Input Example | Output Example |
| ------------------------------------|:-------------:| :-------------:|
| User clicks Add new Article         | Click Add new article | Article form |
| User enters and submits article  | Submit |  |
| User types in section | 
| User searches for article


## Technologies Used

C#, .NetCore 1.1, Mamp, MyPhpAdmin, MySql, HTML, Git, Visual Studio code

ask us anything
Emails: 
xxx
xxx
xxx
xxx

MIT

Copyright (c) 2019 Theary , Young , Florin, Tristan 









