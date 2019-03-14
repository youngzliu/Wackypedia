-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Mar 14, 2019 at 05:54 PM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wackypedia`
--
CREATE DATABASE IF NOT EXISTS `wackypedia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wackypedia`;

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`ID`, `title`) VALUES
(13, '30 One-Sentence Stories From People Who Have Built Better Habits'),
(14, 'Packers sweep'),
(15, 'HMS Stonehenge (P232)'),
(16, 'The Spy Chronicles'),
(17, 'Heptodon'),
(18, 'Photo Hunt'),
(19, 'Obsessed (2009 film)'),
(20, 'Pitbull (rapper)'),
(21, 'Cowboy Songs Four'),
(22, 'Chuck Norris'),
(23, 'Commercial Building (Dayton, Ohio)');

-- --------------------------------------------------------

--
-- Table structure for table `articles_authors`
--

CREATE TABLE `articles_authors` (
  `ID` int(11) NOT NULL,
  `article_ID` int(11) NOT NULL,
  `author_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles_authors`
--

INSERT INTO `articles_authors` (`ID`, `article_ID`, `author_ID`) VALUES
(27, 13, 27),
(28, 13, 28),
(29, 13, 29),
(30, 13, 30),
(31, 14, 31),
(32, 14, 32),
(33, 14, 33),
(34, 14, 34),
(35, 15, 35),
(36, 15, 36),
(37, 15, 37),
(38, 15, 38),
(39, 13, 39),
(40, 16, 40),
(41, 16, 41),
(42, 16, 42),
(43, 16, 43),
(44, 17, 44),
(45, 17, 45),
(46, 17, 46),
(47, 17, 47),
(48, 17, 48),
(49, 18, 49),
(50, 18, 50),
(51, 18, 51),
(52, 18, 52),
(53, 19, 53),
(54, 19, 54),
(55, 19, 55),
(56, 19, 56),
(57, 19, 57),
(58, 20, 58),
(59, 20, 59),
(60, 20, 60),
(61, 20, 61),
(62, 21, 62),
(63, 21, 63),
(64, 21, 64),
(65, 21, 65),
(66, 22, 66),
(67, 22, 67),
(68, 22, 68),
(69, 22, 69),
(70, 23, 70),
(71, 23, 71),
(72, 23, 72),
(73, 23, 73);

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `ID` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`ID`, `name`) VALUES
(27, 'Theary'),
(28, 'Bob'),
(29, 'Ned'),
(30, 'Tristan'),
(31, 'FootballFanatic1985'),
(32, 'Footballisthebest!!!'),
(33, 'SportsGuru92'),
(34, 'Coach Bob'),
(35, 'Steve'),
(36, 'Jim'),
(37, 'Ian'),
(38, 'Anne'),
(39, 'Eric'),
(40, 'A. S. Dulat'),
(41, 'Asad Durrani'),
(42, 'Aditya Sinha'),
(43, 'Cory'),
(44, 'AnimalExpert'),
(45, 'SuperScientist'),
(46, 'Lily'),
(47, 'Superman'),
(48, 'Frank'),
(49, 'EliteGamer'),
(50, 'Adam'),
(51, 'Ying'),
(52, 'Zach'),
(53, 'MovieGoer'),
(54, 'Iron Man'),
(55, 'Ant Man'),
(56, 'Bucky'),
(57, 'Sophie'),
(58, 'MusicFan'),
(59, 'CelebrityJournal'),
(60, 'John'),
(61, 'Pitbulls Biggest Fan'),
(62, 'TexasRanger'),
(63, 'Chuck Norris'),
(64, 'Aaron'),
(65, 'Charles'),
(66, 'Ranger'),
(67, 'Ukn0wN'),
(68, 'Chris'),
(69, 'Terrible Person'),
(70, 'Archy'),
(71, 'Jasmine'),
(72, 'Jared'),
(73, 'Kiki');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `ID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `imageLink` varchar(255) NOT NULL,
  `body` mediumtext NOT NULL,
  `articleID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`ID`, `title`, `imageLink`, `body`, `articleID`) VALUES
(8, 'Better Habits', 'empty', 'In this article, I\'d like to share 30 “one-sentence stories” about building better habits. (They are not all exactly one sentence, but they are very short.)\r\n\r\nNone of these stories are mine. They were sent to me by readers of Atomic Habits. My hope is that these examples will illustrate how real people are putting the book into practice. They will show you what people are actually doing to build good habits and break bad ones. And hopefully, they will spark some ideas for how you can do the same.\r\n\r\nI have divided the stories into categories that roughly correspond to different sections or ideas in the book.', 13),
(9, 'Identity-based habits', 'empty', 'One of the central ideas in the book is the concept of building “identity-based habits”, which essentially recommends focusing on the type of person you wish to become rather than the outcome you wish to achieve.\r\n\r\nOne reader named Roland used the idea to improve his eating habits.\r\n\r\n“I stopped eating unhealthy food via identity change,” he wrote. “I tried many times in the past, but it became easy — natural — only after I had made the conscious decision that I want to be someone who eats healthy. Instead of aiming for I want to stop eating bad food, I tried changing the mindset to I am someone that eats healthy and lives a healthy life. It changes how you approach things.”\r\n\r\nAnother reader named Robert employed this idea to help him quit smoking. He wrote, “I recently stopped smoking and the difference between I don\'t smoke and I can\'t smoke is a powerful trainer of my brain. The positive message of I don\'t smoke is that I have not “given up” anything. I am not sacrificing a pleasure. I am investing in my future happiness and wellbeing.”\r\n\r\nLike most strategies in the book, the concept of identity-based habits can be combined with other habit building tactics. For instance, one reader used an external reward of $10 to reinforce the desired identity. “I told myself, I am no longer a drinker. Then, after each day of non-drinking, I gave myself $10 to buy something nice rather than poison (like clothes and household items). Today, I no longer need the allowance and I\'m six years sober.”', 13),
(10, 'Changing the Cues', 'https://pbs.twimg.com/profile_images/731902102113533952/qFuWP9Pm_400x400.jpg', 'Another way you can change a habit is by identifying and altering the cues that prompt your behavior. This is precisely what many readers have done.\r\n\r\nOne woman named Lisa cultivated a reading habit by increasing her exposure to books. “I\'ve read more books by continually having 20-30 books on hold at the library,” she said. “It saves time on browsing for books. I always have new things to read with a three-week deadline.”\r\n\r\nHeather used a similar strategy to reinforce the simple habit of drinking more water. “I use color and placement for visual reminding and motivation. I poured water in a bright aqua water bottle – my favorite color – and placed it on my nightstand so I couldn’t miss it when I woke up.”\r\n\r\nOther readers have done the opposite. They reduced exposure to negative cues. One man named Max managed to eliminate his e-cigarette habit. “I quit e-cigarettes with a combination of determination and also quitting coffee at the same time, which was a trigger for me as I\'d smoke and drink coffee together in the morning.”', 13),
(11, 'The Sweep', 'https://upload.wikimedia.org/wikipedia/commons/c/cd/Packers_sweep_diagram.svg', 'The Packers sweep, also known as the Lombardi sweep, is an American football play popularized by Green Bay Packers coach Vince Lombardi. The Packers sweep is based on the sweep, a football play that involves a back taking a handoff and running parallel to the line of scrimmage before turning upfield behind lead blockers. The play became noteworthy due to its extensive use by the Packers in the 1960s, when the team won five National Football League (NFL) Championships, as well as the first two Super Bowls. Lombardi used the play as the foundation on which the rest of the team\'s offensive game plan was built. The dominance of the play, as well as the sustained success of Lombardi\'s teams in the 1960s, solidified the Packers sweep\'s reputation as one of the most famous football plays in history.', 14),
(12, 'Early development', 'empty', 'The development of what became known as the Packers sweep, also known as the Lombardi sweep, began with Vince Lombardi. He played football at Fordham University on a football scholarship, and was part of the \"Seven Blocks of Granite\", a nickname for the team\'s offensive line. This was the first time Lombardi witnessed the success of the sweep. Jock Sutherland\'s University of Pittsburgh teams used the sweep extensively against Lombardi\'s team in an era when the single-wing formation was used almost universally. In 1939, after graduation, Lombardi began his coaching career as an assistant at St. Cecilia High School in Englewood, New Jersey. He was promoted to head coach and over eight seasons led St. Cecilia\'s to multiple championships. With a 32-game unbeaten streak, the school had one of the top high school football programs in the nation. Lombardi attended coaching clinics during this time, where he continued to develop a better understanding of the sweep, especially the techniques of pulling offensive linemen and having the ball carriers cut back towards openings in the line. He moved on from high school to college football as an assistant under Earl \"Red\" Blaik at West Point in 1948. For five seasons Lombardi served as an assistant coach and further developed his coaching abilities. Blaik\'s emphasis on players executing their job and the military discipline of West Point greatly influenced Lombardi\'s future coaching style.\r\n\r\nLombardi\'s first NFL coaching job came in 1954, when he accepted an assistant coaching job (now known as an \"offensive coordinator\") for the New York Giants. It was with the Giants that Lombardi first implemented the principles that became the Packers sweep. He started to run the sweep using the T formation and positioned his lineman with greater space between each other. He also had offensive tackles pull from the line and implemented an early variant of zone blocking (blockers are expected to block a \"zone\" instead of an individual defender); this required the ball carrier to run the football wherever there was space. The phrase \"running to daylight\" was later coined to describe the freedom the ball carrier had to choose where to run the play.Under his offensive leadership and assisted by his defensive counterpart Tom Landry, Lombardi helped guide the Giants to an NFL Championship in 1956. They appeared again in the 1958 Championship Game, this time losing in overtime to the Baltimore Colts. In 1959, Lombardi accepted a head coaching and general manager position with the struggling Green Bay Packers. The Packers had just completed their worst season in team history with a record of 1–10–1. Even though the Packers had not been successful for a number of years, Lombardi inherited a team in which five players would go on to be Pro Football Hall of Famers.He immediately instituted a rigorous training routine, implemented a strict code of conduct, and demanded the team continually strive for perfection in everything they did.', 14),
(13, 'Implementation', 'empty', 'The first play Lombardi taught his team after he arrived in Green Bay was the sweep.He moved Paul Hornung to the halfback position permanently (in the past he had been poorly utilized in different back positions) and made him the primary ball-carrier for the 1959 season until Jim Taylor supplanted him as the primary ball-carrier in 1960. The Packers sweep, as it became known, was the team\'s lead play and the foundation on which the rest of the offensive plan was built.For the team to succeed, Lombardi drilled them constantly on the play, expecting it to be executed perfectly every time (it was common for the team to run the play at the beginning and end of every practice). [The play became the epitome of Lombardi\'s philosophy: a simple, yet fundamentally sound play that was reliant on the entire team working together to move the ball.\r\nEven though each player had a role to perform, the execution of the center, the pulling guards, and the halfback were essential to the play\'s success.The center had to cut off the defensive tackle or middle linebacker to prevent the defender from breaking up the play behind the line of scrimmage.This was due to the right guard (when the play was run to the right side of the field), who would vacate this space while pulling to lead the ball carrier. The most difficult block fell on the left guard, who had to pull the whole way across the field to be the lead blocker. The left guard also had to decide, based on how the defense reacted, whether to push the play to the inside or outside of the tight end.The ball carrier, usually the halfback, then decided whether to go inside or outside as well. The fullback, tight end, and left tackle also had essential blocks that dictated the success of the play.\r\nFor nine seasons Lombardi ran the Packers sweep with great success, with one estimate claiming the play gained an average of 8.3 yards each time it was run in the first three seasons under Lombardi. Overall though, the play was known as gaining \"four-yards-and-a-cloud-of-dust\" that would allow the Packers to control the time clock, slowly moving the ball down the field and exhausting the defense.\r\nEven when defenses shifted to try to stop it, Lombardi would either attack other weaknesses or would run variations of the sweep.Tom Landry, as head coach of the Dallas Cowboys, had his defense linemen \"flex\" (line up in an offset position) to prevent the runner from finding the cutback lanes that were essential to the success of the sweep.In response to Landry\'s flex defense, Lombardi would run other types of running plays attacking the new positions of the defensive linemen.Lombardi would also counter other defensive adjustments by running the sweep to the left side, having various blockers not pull, switching the ball carrier, or running option pass plays—each of which could be run out the sweep formation.\r\nOther coaches in the league had great respect for the Packers sweep, although most acknowledged the success of the play was based on two criteria: great players and perfect execution.  During his tenure, Lombardi had three offensive linemen (Jim Ringo, Forrest Gregg, and Jerry Kramer), two backs (Hornung and Jim Taylor), and one quarterback (Bart Starr) who were later elected to the Pro Football Hall of Fame.Each of those offensive players was instrumental to the success of the Packers sweep and thus the offense. Ringo, Gregg, Kramer, and Taylor each provided key blocks for Hornung to run the sweep. Starr (who as the quarterback orchestrated the play) and Taylor were essential to variations of the sweep that called for different runners or option pass plays.\r\nIn addition to the Hall of Famers, Lombardi\'s teams included other highly decorated players, such as first-team All-Pro Fuzzy Thurston, the left guard who had the most challenging blocking assignment in the sweep.Many of these players identified Lombardi\'s coaching and drive for perfection as important factors behind their accomplishments and the team\'s success, acknowledging that perhaps it was Lombardi\'s coaching of the sweep and other plays that helped the players achieve Hall of Fame status, not just that he happened to have \"great players\" that made the sweep so effective. ', 14),
(14, 'Construction and career', 'https://upload.wikimedia.org/wikipedia/commons/1/10/HMS_Stonehenge.jpg', 'HMS Stonehenge was a third-group S-class submarine and was ordered as part of the 1941 Naval Programme on 3 August 1941. She was laid down in the Cammell Laird shipyard in Birkenhead on 4 April 1942 and launched on 23 March 1943.[6] On 12 June 1943, Stonehenge, under the command of Lieutenant David S. M. Verschoyle-Campbell,[8] sailed to Holy Loch, where she was commissioned into the Royal Navy three days later.[6][7] Stonehenge was named after the prehistoric monument of Stonehenge and was the second Royal Navy ship with this name.[9]\r\n\r\nAfter training in several port areas, Stonehenge departed Lerwick on 10 September 1943 to patrol off Norway. She ended her patrol two weeks later without having sighted any ships. The boat then departed Great Britain on 5 November and visited Gibraltar, Beirut, and Port Said, then transited the Suez Canal, stopping at Aden and Colombo before arriving at Trincomalee, Ceylon, on 23 January 1944.[7]\r\n\r\nOn 1 February, Stonehenge departed Trincomalee for her second war patrol. Four days later, she fired two torpedoes at the Japanese merchant ship Koryo Maru No.2, but the torpedoes passed underneath the ship; the submarine surfaced and sank the vessel with her deck gun. On 7 February, the boat launched a landing party at Lem Hua Krung Yai, Siam, then torpedoed and sank the Japanese minelayer Choko Maru west of Malaya five days later. Stonehenge ended her patrol on 18 February.[7]', 15),
(15, 'Design and description', 'empty', 'The S-class submarines were designed to patrol the restricted waters of the North Sea and the Mediterranean Sea. The third batch was slightly enlarged and improved over the preceding second batch of the S class. The submarines had a length of 217 feet (66.1 m) overall, a beam of 23 feet 9 inches (7.2 m) and a draught of 14 feet 8 inches (4.5 m). They displaced 865 long tons (879 t) on the surface and 990 long tons (1,010 t) submerged.[1] The S-class submarines had a crew of 48 officers and ratings. They had a diving depth of 300 feet (91 m).[2]\r\n\r\nFor surface running, the boats were powered by two 950-brake-horsepower (708 kW) diesel engines, each driving one propeller shaft. When submerged each propeller was driven by a 650-horsepower (485 kW) electric motor. They could reach 15 knots (28 km/h; 17 mph) on the surface and 10 knots (19 km/h; 12 mph) underwater.[3] On the surface, the third-batch boats had a range of 6,000 nautical miles (11,000 km; 6,900 mi) at 10 knots (19 km/h; 12 mph) and 120 nmi (220 km; 140 mi) at 3 knots (5.6 km/h; 3.5 mph) submerged.[2]\r\n\r\nThe boats were armed with seven 21-inch (533 mm) torpedo tubes. A half-dozen of these were in the bow, and one external tube was mounted in the stern. They carried six reload torpedoes for the bow tubes for a total of thirteen torpedoes. Twelve mines could be carried in lieu of the internally stowed torpedoes. They were also armed with a 3-inch (76 mm) deck gun.[4] It is uncertain if Stonehenge was completed with a 20-millimetre (0.8 in) Oerlikon light AA gun or had one added later. The third-batch S-class boats were fitted with either a Type 129AR or 138 ASDIC system and a Type 291 or 291W early-warning radar.[5]', 15),
(16, 'The Spy Chronicles: RAW, ISI and the Illusion of Peace ', 'https://upload.wikimedia.org/wikipedia/en/9/9b/The_Spy_Chronicles_cover.jpg', 'The Spy Chronicles: RAW, ISI and the Illusion of Peace is a 2018 book in the format of a dialogue between two intelligence chiefs of India and Pakistan, AS Dulat and Asad Durrani, and moderated by Aditya Sinha.[1][2][3] The conversations between the two intelligence chiefs took place during 2016 and 2017 in Istanbul, Kathmandu and Bangkok.[4][5] AS Dulat is a former head of India\'s external agency, the Research and Analysis Wing (R&AW), Lt. Gen. Asad Durrani is a former head of Pakistan\'s external agency, Inter-Services Intelligence (ISI), and Aditya Sinha is an Indian journalist.', 16),
(17, 'Description', 'empty', 'The book covers various topics such as Kashmir, Afghanistan, Ajit Doval, trade wars, the deep state, the 26/11 Mumbai attacks, Donald Trump, Vladimir Putin, Osama Bin Laden, Hafiz Saeed, Balochistan, the surgical strikes and Kulbhushan Jadhav among other things. In the book Dulat says that ISI is a more influential intelligence agency; however, Durrani observes that \"R&AW is at least as good as we are” but discusses that R&AW may have the upperhand because it has \"career intelligence officers\" whereas ISI consists of army men.[1][2][12] In the book Durrani claims that Pakistan may have directed the American SEALs to Osama bin Laden in May 2011 as well as may have collected a payment for the cooperation and pretended to be surprised afterwards.[13][2][4][12] Durrani also says that ISI\'s involvement in Kashmir has turned out to be less than successful.[2][14]\r\n\r\nA.S. Dulat and Asad Durrani have previously collaborated, writing a paper together titled \"Kashmir: Confrontation to Cooperation\" in 2013 published by the University of Ottawa.[15][16] In the book Durrani notes this in the opening chapter, which also mentions another collaboration between the two after the 59th Pugwash Conference on Science and World Affairs in 2011, when they co-authored an article on intelligence cooperation which was published in The Hindu and Dawn.[17]\r\n\r\nAditya Sinha says that the book has \"no great revelations\" but is \"more about perspective\" and \"a metaphor for the actual relationship between the two countries.\"[5]', 16),
(18, 'Aftermath', 'empty', 'The book was released jointly by former Prime Minister of India Manmohan Singh and former Vice President of India Hamid Ansari as well as other dignitaries on 24 May 2018. The Indian government denied a visa to Asad Durrani to attend the book launch.[3]\r\n\r\nThe publication of the book resulted in accusations of betrayal against Asad Durrani.[15] On 28 May 2018, Pakistan placed Durrani on the \"Exit Control List\", barring him from leaving the country. An investigation headed by a three-star general was formed to ascertain whether Durrani violated Pakistan\'s military regulations.[13] Former Prime Minister of Pakistan Nawaz Sharif demanded that the National Security Committee (NSC) should discuss the book.[18] While addressing the Pakistan Senate in relation to the book, Raza Rabbani had said that if \"a politician done the same thing he would have been labelled a traitor.\"[15][19] However in October 2018, Asad Durrani\'s lawyer said they had not received any notice of an inquiry and sought the removal of Asad Durrani\'s name from the Exit Control List.[20]\r\n\r\nShazar Shafat, a security analyst, suggests two reasons in South Asian Voices (hosted by the The Stimson Center) as to why Asad Durrani may be facing the backlash. The first is related to Durrani\'s comments on Akhand Bharat in the book and the second is in relation to comments on Kulbhushan Jadhav.[21][22] However, a report by CNN found that the book (as well as a pirated PDF version) was freely available in Pakistan and that the Pakistani government\'s \"overreaction\", according to Hassan Askari Rizvi and other defence analysts, may be because Durrani did not get prior permissions for such a book.[23][24]\r\n\r\nOn 22 February 2019, Asad Durrani was found guilty of violating Pakistan\'s Military Code of Conduct for co-writing the book.[25][26] Asad Durrani\'s pension and other allowances have been withdrawn and it is yet to be decided if he should be taken off the Exit Control List.[27][28]', 16),
(19, 'Species', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Heptodon_posticus.jpg/500px-Heptodon_posticus.jpg', 'Heptodon is an extinct genus of tapir-type herbivore of the family Helaletidae endemic to North America during the Eocene epoch. It lived from 55.4—48.6 mya, existing for approximately 6.8 million years.[1]', 17),
(20, 'Taxonomy', 'empty', 'Heptodon was named by Cope (1882). It was considered paraphyletic by Colbert (2005). It was assigned to Helaletinae by Radinsky (1966); to Ceratomorpha by Cope (1882) and Colbert and Schoch (1998); to Heptodontidae by Holbrook (1999);[2] and to Tapiroidea by Colbert (2005). M. W. Colbert. 2005.[3]', 17),
(21, 'Morphology', 'empty', 'Heptodon was about 1 metre (3.3 ft) in length, and closely resembled modern tapirs. The shape of the skull suggests that it probably lacked the characteristic tapir trunk. Instead it probably had a slightly elongated, fleshy upper lip, like its relative Helatetes.[4]\r\n\r\nA single specimen was examined by M. Mendoza, C. M. Janis, and P. Palmqvist for body mass. It was estimated to have a weight of 15.5 kg (34 lb).[5]', 17),
(22, 'Game description', 'https://upload.wikimedia.org/wikipedia/en/7/74/Photo_Hunt_screen_shot.jpg', 'Photo Hunt is a spot the difference game featured on Megatouch game systems, which are coin-operated, touchscreen video games primarily found in bars, restaurants, and taverns. Megatouch games were developed by Merit Entertainment in Bristol, Pennsylvania.[1] Photo Hunt has been reworked as a downloadable version for the iPhone and iPod touch.[2]', 18),
(23, 'Gameplay', 'empty', 'Photo Hunt is a spot the difference game. In each level, players are shown two photos—side-by-side—that are identical except for five differences. The objective is to find and identify the differences between the pictures before the timer runs out. Players select potential differences by touching the screen on either picture in the location of difference. Correct choices encircle the difference in green and incorrect touches deduct time, with the game ending if time expires on any level. Upon clearing a level, bonus points are awarded for the time remaining and the timer is refreshed for the next level, where it decreases more quickly.\r\n\r\nDepending on the settings, players are provided either 3 or 5 hints for use during the course of one game. The number of remaining hints is indicated by the number of magnifying glass images centered at the top of bottom of the screen. Players touch one of these icons to reveal one of the remaining differences. Differences located by hints are immediately counted as found and are surrounded by a yellow circle.', 18),
(24, 'Development', 'empty', 'Megatouch products were produced by Merit Industries,[4] with games were developed by Merit Entertainment in Bristol, Pennsylvania.[1] Megatouch also released a variant of the game called Erotic Photo Hunt, which featured sexually explicit photos.[3]\r\n\r\n', 18),
(25, 'Plot', 'https://upload.wikimedia.org/wikipedia/en/6/63/Obsessed_2009_film.jpg', '           Derek Charles (Idris Elba) works for a finance company and is married to Sharon (Beyoncé). While Derek is at work, he greets temporary worker Lisa Sheridan (Ali Larter), who, believing Derek was flirting with her, attempts to seduce him. Derek repeatedly rejects her, but Lisa continues to pursue him, making sexual advances on him at the Christmas party. At one point, she follows him to his car and attempts to seduce him again with revealing lingerie and fishnet stockings, but Derek refuses again and forces her out of his car. Derek intends to report Lisa to his firm\'s human resource management, but learns that she has quit her job. Thinking that Lisa has given up, Derek is annoyed when he receives flirtatious emails from her. Derek and his workmates visit a resort for a conference, where he spots and confronts Lisa, who spikes his drink. Incapacitated, Derek is helpless when Lisa follows him into his hotel room. He confronts Lisa again the following day, and hours later discovers her lying naked in his bed after attempting suicide, and calls for medical help.\r\n\r\nAfter repeated attempts to reach Derek on his phone, Sharon finds Derek at the hospital and suspects that he and Lisa had an affair, as Lisa claims. LAPD Detective Monica Reese (Christine Lahti) at first questions Derek\'s fidelity to Sharon as well, but soon becomes skeptical of Lisa\'s claims, due to inconsistencies in her story. Sharon, refusing to believe Derek, kicks him out of their house, and he moves into a separate apartment. Months later, Derek and Sharon meet up for dinner and finally reconcile. Meanwhile, Lisa tricks the babysitter Samantha (Scout Taylor-Compton) into letting her in under the pretense of being one of Sharon\'s friends. When Derek and Sharon return home after dinner, they discover that Lisa had been in the house and seemingly abducted Derek and Sharon\'s infant son, Kyle (Nathan and Nicolas Myers). Derek goes to his car with the intent to pursue Lisa, only to find the baby is safely sitting in the back seat. He and Sharon immediately take Kyle to the hospital for a check-up. When Derek and Sharon return home from the hospital, they find Lisa has trashed their bedroom and removed Sharon\'s face from their family portrait. Sharon leaves a threatening voice message on Lisa\'s phone, and she and Derek set up a home alarm system.\r\n\r\nLisa learns that Derek and Sharon will be going away from town for a few days, with Sharon leaving one afternoon and Derek the next day. While Sharon is on her way to pick up Kyle, she realizes she forgot to set the alarm system and returns home. Meanwhile, Lisa breaks into Derek and Sharon\'s house again and decorates the master bed with rose petals. While setting the alarm, Sharon hears Lisa in the bedroom. She confronts Lisa, who tries to convince her that Derek was seeing Lisa. However, Sharon sees through her lie and attempts to call the police, but Lisa tackles her to the floor, and the two engage in a fight. Derek calls the home phone and Lisa answers; he calls Detective Reese and they both head toward the house. Lisa runs to the attic and Sharon pursues her. Sharon leads her to a weak spot in the attic floor, where Lisa falls through. Seeing that Lisa is in mortal danger, Sharon reaches out in an attempt to grab Lisa and lift her up, but Lisa refuses and tries to pull Sharon down with her. Seeing that the floor is beginning to buckle, Sharon pries Lisa off of her arm. Lisa is injured upon falling on the chandelier which she hangs off on. The chandelier soon loosens but Lisa falls onto the glass table below, and is killed when the chandelier falls from the ceiling onto her. Detective Reese arrives as Sharon comes out of the house. Detective Reese goes inside the house to investigate Lisa\'s actions, and Derek arrives soon after; he and Sharon tearfully embrace.', 19),
(26, 'Production', 'empty', 'The concept of Obsessed was thought up by Clint Culpepper, president of Screen Gems, and was shared with David Loughery, who wrote the screenplay. Producer William Packer read the script and signed on; executive producers for the film were Glenn S. Gainor, Jeff Graup, Earvin \"Magic\" Johnson, Beyoncé, Mathew Knowles, Damon Lee and Loughery, while Nicholas Stern and George Flynn served as co-producer and associate producer, respectively.[4] Director Steve Shill signed on after reading the script and hearing that Beyoncé was on board.[5] Part of the reason Elba joined in was that the black–white theme was ignored; \"It\'s not mentioned in the film, it\'s never an issue, and I think that\'s phenomenal ... To me, that was very refreshing that the studio execs didn\'t want to make an issue of it.\"[6] Obsessed was allocated a production budget of $20 million.[2] Shill stated that the intended effect of the film was to have the audience discuss the characters\' motivations.[7] Writer David Loughery designed Lisa as \"not a villain in a traditional sense; she\'s not setting out to wreck a marriage or ruin somebody\'s life. She really believes that [Derek] is in love with her.\"[8] Lisa\'s past was deliberately omitted from the film, explaining, \"It\'s scarier if we never really know how she\'s developed this personality that can go from very loving to ultimately deadly.\"[5]', 19),
(27, 'Armando Christian Pérez ', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Pitbull_%287906562418%29.jpg/440px-Pitbull_%287906562418%29.jpg', 'Armando Christian Pérez (born January 15, 1981), known by the stage name Pitbull (also known as Mr. Worldwide), is an American rapper. His first recorded mainstream performance was on a solo track from Lil Jon\'s 2002 album Kings of Crunk. In 2004, Pitbull released his debut album M.I.A.M.I. under TVT Records. It included production producers Lil Jon and Jim Jonsin. Pitbull later released his second album El Mariel, in 2006 and his third, The Boatlift, in 2007.[4] His fourth album, Rebelution (2009), included his breakthrough hit single \"I Know You Want Me (Calle Ocho)\", which peaked at number two on the US Billboard Hot 100.\r\n\r\nAfter rebranding himself as a pop artist, Pitbull\'s next album, Planet Pit, featured his first US number one single \"Give Me Everything\".[5] His 2013 track \"Timber\", topped the charts in twenty nations, including the US and UK. He performed the song \"We Are One (Ole Ola)\" along with Jennifer Lopez and Claudia Leitte, which served as the official theme of the 2014 FIFA World Cup.[6]', 20),
(28, 'Early life and education', 'empty', 'Armando Christian Perez was born on January 15, 1981[7][8] to Cuban expatriates in Miami, Florida. When he was 3, he could recite the works of Cuba\'s national hero and poet, José Martí, in Spanish.[1] Growing up, he was influenced by the Miami bass genre of pop music[4] and has cited Celia Cruz and Willy Chirino as sources of inspiration for his music.[9] Pérez\'s parents separated when he was young, and he was raised by his mother; he later spent time with a foster family in Roswell, Georgia.[10] He attended South Miami Senior High School before graduating from Miami Coral Park High School, where he focused his career on rapping.\r\n\r\nHe said he chose his stage name of Pitbull because the dogs \"bite to lock. The dog is too stupid to lose. And they\'re outlawed in Dade County. They\'re basically everything that I am. It\'s been a constant fight\".[10] After meeting Lil Jon in Miami,[10] Pitbull was featured on Lil Jon and the East Side Boyz\' album Kings of Crunk in 2002.[4] Pitbull\'s song \"Oye\" was featured on the soundtrack to the film 2 Fast 2 Furious the following year.[10] In addition, Pitbull released several mixtapes, composed of freestyles and remixes of popular rap music. Pitbull also worked with Uncle Luke during his early career, being featured on Luke\'s 2001 album Somethin\' Nasty, including the single \"Lollipop\" along with Lil\' Zane.[4]', 20),
(29, 'Career', 'empty', 'In 2001, Pitbull was signed to Luther Campbell\'s Luke Records by Jullian Boothe, then the label\'s vice-president of A&R.[11] In 2001, Pitbull was introduced to Robert Fernandez of Famous Artist Music & Management, an independent label and management company specializing in developing artists, by the Diaz Brothers, a producer duo signed to the company. Fernandez \"saw the eagerness and hunger he had\" and, with the Luke Records deal ending, began working to develop Pitbull. Together they focused on creating a more radio-friendly sound. Fernandez later told HitQuarters: \"At that time his music had a lot of verses and took a long time to get into the hook, and so we took time in getting the songs catchier and less on the rap side.\"[citation needed]\r\n\r\nFernandez introduced Pitbull to Lil Jon, hoping to secure the rapper a small guest intro spot on Lil Jon\'s upcoming album Kings of Crunk. According to Fernandez, Jon took a liking to Pérez and offered him a track on the album; it is called \"Pitbull\'s Cuban Ride Out.\" This track helped raise the young rapper\'s profile.[12]', 20),
(30, 'Album Description', 'https://upload.wikimedia.org/wikipedia/en/2/29/Cowboy_Songs_Four.jpg', 'Cowboy Songs Four is the twenty-first album by American singer-songwriter Michael Martin Murphey, his fourth album of cowboy songs, and his first album produced by his son, Ryan Murphey. The album features a guest performance by Lyle Lovett on \"Farther Down the Line\".[1]', 21),
(31, 'Track listing', 'empty', '\"Song from Lonesome Dove\" (Murphey) – 4:58\r\nTrail Song Medley: \"Colorado Trail\" / \"Twilight on the Trail\" / \"Navaj Trail\" / \"Riding Down the Canyon\" / \"Blue Shadows on the Trail\"[Note 1] – 5:47\r\n\"Born to Be a Cowboy\" (Hampton) – 5:36\r\n\"Farther Down the Line\" (Lovett, Goldsen) – 3:36\r\n\"Born to Buck Bad Luck\" (Murphey) – 3:46\r\n\"Easy on the Pain\" (Murphey, Westergen) – 3:51\r\n\"Utah Carroll\" (Traditional) – 3:29\r\n\"Freewheeler\" (Winchester) – 3:13\r\n\"Rangeland Rebel\" (Murphey) – 4:46\r\n\"Run Toward the Light\" (Murphey, Murphey) –4:10\r\n\"The Bunkhouse Orchestra\" (Murphey) – 2:05\r\n\"Little Joe, the Wrangler\" (Thorp, Traditional) – 4:07\r\n\"Summer Ranges\" (Murphey) – 3:37\r\n\"Old Horse\" (Murphey) – 5:11\r\n\"Night Hawk\" (Murphey) – 8:04[1]\r\n', 21),
(32, 'Credits', 'empty', 'Music\r\n\r\nMichael Martin Murphey – vocals, acoustic guitar, harmonica, background vocals, arranger\r\nRyan Murphey – electric guitar, acoustic guitar, chart, background vocals, arranger, producer\r\nPat Flynn – acoustic guitar\r\nSonny Garrish – steel guitar\r\nJonathan Yudkin – fiddle\r\nHank Singer – fiddle\r\nDavid Coe – fiddle\r\nDennis Burnside – piano\r\nJoey Miskulin – accordion\r\nDavid Hungate – electric bass\r\nCraig Nelson – acoustic bass\r\nBob Mater – drums\r\nTodd D. Smith – shouts\r\nLyle Lovett – vocals\r\nProduction\r\n\r\nGary Paczosa – engineer\r\nCraig A. Wolf – engineer\r\nSteve Tveit – studio manager\r\nVernell Hackett – photography[1]', 21),
(33, 'Walker Texas Ranger', 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Chuck_Norris_May_2015.jpg/440px-Chuck_Norris_May_2015.jpg', 'Carlos Ray Norris (born March 10, 1940) is an American martial artist, actor, film producer and screenwriter. After serving in the United States Air Force, he competed as a martial artist, won many championships, and he has since founded his own school of fighting, Chun Kuk Do. Norris is also a black belt in Brazilian jiu jitsu and Judo.[3]\r\n\r\nNorris appeared in a number of action films, such as Way of the Dragon (in which he starred alongside Bruce Lee), Good Guys Wear Black, The Octagon, Lone Wolf McQuade, Code of Silence, The Delta Force, and Missing in Action 1, 2, & 3. He was The Cannon Group\'s leading star in the 1980s.[4][5] He played the title role in the television series Walker, Texas Ranger from 1993 until 2001. Since 1997, he and model Christie Brinkley have been the main spokespersons for the Total Gym infomercials.\r\n\r\nNorris has written several books, with subject matter varying from martial arts, exercise, philosophy, politics, Christian religion, western novels, to biography. He was twice a New York Times best-selling author, firstly with his book on his personal philosophy of positive force and the psychology of self-improvement based on personal anecdotes called The Secret of Inner Strength: My Story (1988). His second New York Times Best Seller, Black Belt Patriotism: How to Reawaken America (2008), was about his critique on current issues in the USA.\r\n\r\nIn 2005, Norris became an internet star with the comical Chuck Norris facts, which documents fictional and often absurd feats associated with him. With this new found popularity he was hired to endorse many products that incorporated Chuck Norris facts in their commercials. This phenomenon also spawned six books, two of them New York Times Best Sellers, and two video games.', 22),
(34, 'Early life', 'empty', 'Norris was born in Ryan, Oklahoma on March 10, 1940,[6] to Wilma (née Scarberry, born May 4, 1921) and Ray Norris (1918–1971), who was a World War II Army soldier,[7] a mechanic, bus driver, and truck driver.[8] Norris has stated that he has Irish and Cherokee roots.[4][7][9] Norris was named after Carlos Berry, his father\'s minister.[7] He has two younger brothers, Wieland (1943–1970; killed in Vietnam) and Aaron (a Hollywood producer). When Norris was sixteen, his parents divorced,[10] and he later relocated to Prairie Village, Kansas, and then to Torrance, California, with his mother and brothers.[4]\r\n\r\nNorris has described his childhood as downbeat. He was nonathletic, shy, and scholastically mediocre.[11] His father, Ray, worked intermittently as an automobile mechanic, and went on alcohol drinking binges that lasted for months at a time. Embarrassed by his father\'s behavior and the family\'s financial plight, Norris developed a debilitating introversion that lasted for his entire childhood.[12]', 22),
(35, 'Chuck Norris Facts', 'empty', 'Chuck Norris counted to infinity - twice.\r\nChuck Norris once visited the Virgin Islands. They are now The Islands.\r\nSome kids piss their name in the snow. Chuck Norris can piss his name into concrete.\r\nChuck Norris doesn\'t cheat death. He wins fair and square.\r\nLeading hand sanitizers claim they can kill 99.9 percent of germs. Chuck Norris can kill 100 percent of whatever the fuck he wants.\r\nChuck Norris\' tears cure cancer. Too bad he has never cried.', 22),
(36, 'Architecture', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/CommercialBuilding.jpg/500px-CommercialBuilding.jpg', 'Built of brick with elements of stone, the Commercial Building is a ten-story structure surrounded by smaller buildings. Its front (southern side) is divided into three bays, while the western side is divided into four.[2] Among its more distinctive elements is its ornate main entrance, which forms a crucial component of the building\'s Neo-Renaissance styling.[3] Two-over-two windows fill large areas of the upper stories.[2] The building sits on the Ludlow and Fourth Streets,[4] connected to the Dayton Arcade, which was among the leading commercial complexes of the early 20th-century city.[3]', 23),
(37, 'Early history', 'empty', 'At its completion in 1908, the Commercial Building was one of the most important parts of Dayton\'s skyline, being one of just five high-rises in the city. It was built at the behest of Adam Schantz, Jr.,[3] who at the time was one of Dayton\'s leading citizens; more than any other man, he was responsible for the appearance of the city\'s skyline, he impelled extensive construction along Ludlow, he headed one of the city\'s largest companies, and he was responsible for the development of the Schantz Park neighborhood in the suburb of Oakwood.[5] Schantz chose a leading architect to design his new building: by the late twentieth century, Albert Pretzinger had gained the reputation of being the most important architect native to Dayton in the city\'s history.[3]', 23),
(38, 'Late twentieth century', 'empty', 'In 1982, the Commercial Building was listed on the National Register of Historic Places. While its architecture was significant enough to qualify it for this designation,[1] a crucial part of its significance derives from its close connection to Adam Schantz, Jr.[3] It is one of nearly 150 National Register-listed locations in Montgomery County, along with sites such as the former Dayton Daily News Building, located on another corner of Fourth and Ludlow, and the Dayton Arcade next door.[1] However, the historic designation has not ensured these buildings\' continued well-being: the Arcade has been empty for several decades, the Dayton Daily News Building was vacated in 2007, and the Commercial Building itself has received so little maintenance that the city has cordoned off the surrounding sidewalks to prevent pedestrians from being hit by glass falling from the building\'s windows.[6] Nevertheless, some hope for its restoration remains: a group from Wisconsin has been attempting to restore the Arcade Building with hopes of seeing it reopen and of participating in downtown revitalization.[7]', 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `articles_authors`
--
ALTER TABLE `articles_authors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `articles_authors`
--
ALTER TABLE `articles_authors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
