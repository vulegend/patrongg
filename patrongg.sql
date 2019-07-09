-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 09, 2019 at 01:38 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patrongg`
--

-- --------------------------------------------------------

--
-- Table structure for table `ability`
--

DROP TABLE IF EXISTS `ability`;
CREATE TABLE IF NOT EXISTS `ability` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `is_ultimate` tinyint(1) NOT NULL,
  `fk_hero` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_hero_index` (`fk_hero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ability`
--

INSERT INTO `ability` (`id`, `name`, `description`, `is_ultimate`, `fk_hero`) VALUES
(1, 'Biotic Rifle', 'Ana’s rifle shoots darts that can restore health to her allies or deal ongoing damage to her enemies. She can use the rifle’s scope to zoom in on targets and make highly accurate shots.', 0, 1),
(2, 'Sleep Dart', 'Ana fires a dart from her sidearm, rendering an enemy unconscious (though any damage will rouse them).', 0, 1),
(3, 'Biotic Grenade', 'Ana tosses a biotic bomb that deals damage to enemies and heals allies in a small area of effect. Affected allies briefly receive increased healing from all sources, while enemies caught in the blast cannot be healed for a few moments.', 0, 1),
(4, 'Nano Boost', 'After Ana hits one of her allies with a combat boost, they temporarily move faster, deal more damage, and take less damage from enemies’ attacks.', 1, 1),
(5, 'Configuration: Recon', 'In Recon mode, Bastion is fully mobile, outfitted with a submachine gun that fires steady bursts of bullets at medium range.', 0, 2),
(6, 'Configuration: Sentry', 'In Sentry mode, Bastion is a stationary powerhouse equipped with a gatling gun capable of unleashing a hail of bullets. The gun\'s aim can be \"walked\" across multiple targets dealing devastating damage at short to medium range.', 0, 2),
(7, 'Reconfigure', 'Bastion transforms between its two primary combat modes to adapt to changing battlefield conditions.', 0, 2),
(8, 'Self-Repair', 'Bastion restores its health; it cannot move or fire weapons while the repair process is in effect.', 0, 2),
(9, 'Configuration: Tank', 'In Tank mode, Bastion extends wheeled treads and a powerful long-range cannon. The cannon’s explosive shells demolish targets in a wide blast radius, but Bastion can only remain in this mode for a limited time.', 1, 2),
(10, 'Fusion Cannons', 'D.Va\'s mech is equipped with twin short-range rotating cannons. They lay down continuous, high-damage fire without needing to reload, but slow D.Va’s movement while they’re active.', 0, 3),
(11, 'Boosters', 'D.Va’s mech launches into the air, her momentum carrying her forward. She can turn and change directions or barrel through her enemies, knocking them back.', 0, 3),
(12, 'Defense Matrix', 'D.Va can activate this forward-facing targeting array to shoot incoming projectiles out of the air.', 0, 3),
(13, 'Eject', 'D.Va ejects out of her mech when it is destroyed.', 0, 3),
(14, 'Self-Destruct', 'D.Va ejects from her mech and sets its reactor to explode, dealing massive damage to nearby opponents.', 1, 3),
(15, 'Light Gun', 'While outside of her mech, D.Va can continue the fight with a mid-range automatic blaster.', 0, 3),
(16, 'Call Mech', 'If her armored battle suit is destroyed, D.Va can call down a fresh mech and return to the fray.', 1, 3),
(17, 'Shuriken', 'Genji looses three deadly throwing stars in quick succession. Alternatively, he can throw three shuriken in a wider spread.', 0, 4),
(18, 'Swift Strike', 'Genji darts forward, slashing with his katana and passing through foes in his path. If Genji eliminates a target, he can instantly use this ability again.', 0, 4),
(19, 'Deflect', 'With lightning-quick swipes of his sword, Genji reflects any oncoming projectiles and can send them rebounding towards his enemies.', 0, 4),
(20, 'Cyber-Agility', 'Thanks to his cybernetic abilities, Genji can climb walls and perform jumps in mid-air.', 0, 4),
(21, 'Dragonblade', 'Genji brandishes his katana for a brief period of time. Until he sheathes his sword, Genji can deliver killing strikes to any targets within his reach.', 1, 4),
(22, 'Storm Bow', 'Hanzo nocks and fires an arrow at his target.', 0, 5),
(23, 'Scatter Arrow', 'Hanzo shoots a fragmenting arrow that ricochets off walls and objects and can strike multiple targets at once.', 0, 5),
(24, 'Sonic Arrow', 'Hanzo launches an arrow that contains a sonar tracking device. Any enemy within its detection radius is visibly marked, making them easier for Hanzo and his allies to hunt down.', 0, 5),
(25, 'Wall Climb', 'Hanzo can climb any vertical surface.', 0, 5),
(26, 'Dragonstrike', 'Hanzo summons a Spirit Dragon which travels through the air in a line. It passes through walls in its way, devouring any enemies it encounters.', 1, 5),
(27, 'Frag Launcher', 'Junkrat\'s Frag Launcher lobs grenades a significant distance. They bounce to reach their destination, and blow up when they strike an enemy.', 0, 6),
(28, 'Concussion Mine', 'After placing one of his homemade Concussion Mines, Junkrat can trigger it to damage enemies and send them flying... or propel himself through the air.', 0, 6),
(29, 'Steel Trap', 'Junkrat tosses out a giant, metal-toothed trap. Should an enemy wander too close to the trap, it clamps on, injuring and immobilizing them.', 0, 6),
(30, 'Total Mayhem', 'Junkrat\'s deranged sense of humor persists past his death. If killed, he drops several live grenades.', 0, 6),
(31, 'RIP-Tire', 'Junkrat revs up a motorized tire bomb and sends it rolling across the battlefield, climbing over walls and obstacles. He can remotely detonate the RIP-Tire to deal serious damage to enemies caught within the blast, or just wait for it to explode on its own.', 1, 6),
(32, 'Sonic Amplifier', 'Lúcio can hit his enemies with sonic projectiles or knock them back with a blast of sound.', 0, 7),
(33, 'Crossfade', 'Lúcio continuously energizes himself, and nearby teammates, with music. He can switch between two songs: one amplifies movement speed, while the other regenerates health.', 0, 7),
(34, 'Amp It Up', 'Lúcio increases the volume on his speakers, boosting the effects of his songs.', 0, 7),
(35, 'Wall Ride', 'Lúcio rides along a wall. This has a slight upwards angle, allowing him to ascend the wall.', 0, 7),
(36, 'Sound Barrier', 'Protective waves radiate out from Lúcio’s Sonic Amplifier, briefly providing him and nearby allies with personal shields.', 1, 7),
(37, 'Peacekeeper', 'McCree fires off a round from his trusty six-shooter. He can fan the Peacekeeper’s hammer to swiftly unload the entire cylinder.', 0, 8),
(38, 'Combat Roll', 'McCree dives in the direction he\'s moving, effortlessly reloading his Peacekeeper in the process.', 0, 8),
(39, 'Flashbang', 'McCree heaves a blinding grenade that explodes shortly after it leaves his hand. The blast staggers enemies in a small radius.', 0, 8),
(40, 'Deadeye', 'Focus. Mark. Draw. McCree takes a few precious moments to aim; when he\'s ready to fire, he shoots every enemy in his line of sight. The weaker his targets are, the faster he\'ll line up a killshot.', 1, 8),
(41, 'Endothermic Blaster', 'Mei\'s blaster unleashes a concentrated, short-range stream of frost that damages, slows, and ultimately freezes enemies in place. Mei can also use her blaster to shoot icicle-like projectiles at medium range.', 0, 9),
(42, 'Cryo-Freeze', 'Mei instantly surrounds herself with a block of thick ice. She heals and ignores damage while encased, but cannot move or use abilities.', 0, 9),
(43, 'Ice Wall', 'Mei generates an enormous ice wall that obstructs lines of sight, stops movement, and blocks attacks.', 0, 9),
(44, 'Blizzard', 'Mei deploys a weather-modification drone that emits gusts of wind and snow in a wide area. Enemies caught in the blizzard are slowed and take damage; those who linger too long are frozen solid.', 1, 9),
(45, 'Caduceus Staff', 'Mercy engages one of two beams that connect to an ally. By maintaining the beams, she can either restore that ally\'s health or increase the amount of damage they deal.', 0, 10),
(46, 'Caduceus Blaster', 'Mercy shoots a round from her sidearm. It\'s best reserved for emergency personal defense.', 0, 10),
(47, 'Guardian Angel', 'Mercy flies towards a targeted ally, allowing her to reach them quickly and provide assistance in crucial moments.', 0, 10),
(48, 'Angelic Descent', 'Propelled by her Valkyrie suit, Mercy slows the speed of her descent from great heights.', 0, 10),
(49, 'Resurrect', 'Mercy radiates restorative power, bringing nearby dead allies back into the fight with full health.', 1, 10),
(50, 'Rocket Launcher', 'Pharah’s primary weapon launches rockets that deal significant damage in a wide blast radius.', 0, 11),
(51, 'Concussive Blast', 'Pharah looses a wrist rocket that knocks back any enemies it strikes.', 0, 11),
(52, 'Jump Jet', 'Propelled by her suit’s thrusters, Pharah soars high into the air.', 0, 11),
(53, 'Hover Jets', 'Pharah hovers in mid-air.', 0, 11),
(54, 'Barrage', 'Pharah directs a continuous salvo of mini-rockets to destroy groups of enemies.', 1, 11),
(55, 'Hellfire Shotguns', 'Reaper tears enemies apart with twin shotguns.', 0, 12),
(56, 'Wraith Form', 'Reaper becomes a shadow for a short period of time. While in this form, he takes no damage and is able to pass through enemies, but cannot fire his weapons or use other abilities.', 0, 12),
(57, 'Shadow Step', 'After marking a destination, Reaper disappears and reappears at that location.', 0, 12),
(58, 'The Reaping', 'Reaper collects souls from fallen enemies to replenish his health.', 0, 12),
(59, 'Death Blossom', 'In a blur of motion, Reaper empties both hellfire shotguns at breakneck speed, dealing massive damage to all nearby enemies.', 1, 12),
(60, 'Rocket Hammer', 'Reinhardt’s Rocket Hammer is an exemplary melee weapon, able to deal punishing damage in a wide arc with every swing.', 0, 13),
(61, 'Barrier Field', 'Reinhardt projects a broad, forward-facing energy barrier, which can absorb substantial damage before it is destroyed. Although Reinhardt can protect himself and his companions behind the barrier, he cannot attack while sustaining it.', 0, 13),
(62, 'Charge', 'Reinhardt charges forth in a straight line, pinning the first enemy in his path and knocking others aside. If he collides with a wall, the foe he’s carrying suffers extreme damage.', 0, 13),
(63, 'Fire Strike', 'By whipping his Rocket Hammer forward, Reinhardt slings a flaming projectile which pierces and damages any enemies it touches.', 0, 13),
(64, 'Earthshatter', 'Reinhardt forcefully slams his rocket hammer into the ground, knocking down and damaging all enemies in front of him.', 1, 13),
(65, 'Scrap Gun', 'Roadhog\'s Scrap Gun fires short-range blasts of shrapnel with a wide spread. Alternatively, it can launch a shrapnel ball that detonates farther away, scattering metal fragments from the point of impact.', 0, 14),
(66, 'Take A Breather', 'Roadhog restores a chunk of his health over a brief period of time.', 0, 14),
(67, 'Chain Hook', 'Roadhog hurls his chain at a target; if it catches, he yanks them into close range.', 0, 14),
(68, 'Whole Hog', 'After cramming a top-loader onto his Scrap Gun, Roadhog pours in ammo. For a short time, he can crank out a stream of shrapnel that knocks back enemies.', 1, 14),
(69, 'Heavy Pulse Rifle', 'Soldier: 76’s rifle remains particularly steady while unloading fully-automatic pulse fire. He can also fire single shots with pinpoint accuracy.', 0, 15),
(70, 'Helix Rockets', 'Tiny rockets spiral out of Soldier: 76’s Pulse Rifle in a single burst. The rockets’ explosion damages enemies in a small radius.', 0, 15),
(71, 'Sprint', 'Whether he needs to evade a firefight or get back into one, Soldier: 76 can rush ahead in a burst of speed. His sprint ends if he takes an action other than charging forward.', 0, 15),
(72, 'Biotic Field', 'Soldier: 76 plants a biotic emitter on the ground. Its energy projection restores health to 76 and any of his squadmates within the field.', 0, 15),
(73, 'Tactical Visor', 'Soldier: 76’s pinpoint targeting visor “locks” his aim on the threat closest to his crosshairs. If an enemy leaves his line of sight, Soldier: 76 can quickly switch to another target.', 1, 15),
(74, 'Photon Projector', 'Symmetra’s weapon emits a short-range beam that homes in on a nearby enemy, dealing continuous damage that increases the longer it is connected. The projector can also release a charged energy ball that deals high damage.', 0, 16),
(75, 'Sentry Turret', 'Symmetra sets up a small turret that automatically fires speed-reducing blasts at the nearest enemy within range. Several turrets can be built on the battlefield at once.', 0, 16),
(76, 'Photon Shield', 'Symmetra surrounds an ally with a hard-light shield that absorbs damage and persists as long as that ally remains alive.', 0, 16),
(77, 'Teleporter', 'Symmetra places a teleporter exit pad at her current location, and connects it to a teleporter entry pad at her team’s starting point. Allies can travel through the entry pad to the exit pad instantly, enabling them to return to the fight swiftly after being defeated.', 1, 16),
(78, 'Rivet Gun', 'Torbjörn fires rivets at long range, or ejects molten metal from his gun in a short, close-range burst.', 0, 17),
(79, 'Forge Hammer', 'Torbjörn uses his multipurpose hammer to build, upgrade and repair turrets. In a pinch, it can also be swung as a weapon.', 0, 17),
(80, 'Build Turret', 'Torbjörn constructs an enemy-tracking autocannon. He can use his Forge Hammer to repair or upgrade it, increasing its health and adding a second cannon barrel and a rocket launcher.', 0, 17),
(81, 'Scrap Collector', 'Collect scrap to gain resources.', 0, 17),
(82, 'Armor Pack', 'Torbjörn deploys an armor upgrade; either he or his allies can pick it up to absorb some damage.', 0, 17),
(83, 'Molten Core', 'After overheating his personal forge, Torbjörn gains a significant amount of armor. He also attacks (and builds and repairs turrets) far faster than normal.', 1, 17),
(84, 'Pulse Pistols', 'Tracer rapid-fires both of her pistols.', 0, 18),
(85, 'Blink', 'Tracer zips horizontally through space in the direction she’s moving, and reappears several yards away. She stores up to three charges of the blink ability and generates more every few seconds.', 0, 18),
(86, 'Recall', 'Tracer bounds backward in time, returning her health, ammo and position on the map to precisely where they were a few seconds before.', 0, 18),
(87, 'Pulse Bomb', 'Tracer lobs a large bomb that adheres to any surface or unfortunate opponent it lands on. After a brief delay, the bomb explodes, dealing high damage to all enemies within its blast radius.', 1, 18),
(88, 'Widow\'s Kiss', 'Widowmaker’s versatile sniper rifle is ideal for scope-aimed shots at distant targets. Should targets close to medium range, the rifle can also be fired in fully-automatic mode.', 0, 19),
(89, 'Grappling Hook', 'Widowmaker launches a grappling hook towards the location she’s aiming at – when the hook connects with a scalable surface, she’s quickly drawn towards it, allowing her to expand her view of the battlefield and evade or flank targets.', 0, 19),
(90, 'Venom Mine', 'Widowmaker adheres a swiftly-arming venom mine to nearly any surface. When a target wanders within range of the mine’s motion trigger, it explodes, delivering poison gas to any enemies in the vicinity.', 0, 19),
(91, 'Infra-Sight', 'Widowmaker’s recon visor allows her to see the heat signatures of her targets through walls and objects for a moderate amount of time. This enhanced vision is shared with her allies.', 1, 19),
(92, 'Tesla Cannon', 'Winston’s weapon fires a short-range electric barrage for as long as he holds down the trigger.', 0, 20),
(93, 'Jump Pack', 'Assisted by his energy pack, Winston lunges through the air, dealing significant damage and staggering nearby enemies when he lands.', 0, 20),
(94, 'Barrier Projector', 'Winston\'s barrier projector extends a bubble-shaped field that absorbs damage until it\'s destroyed. Allies protected by the barrier can return fire from within it.', 0, 20),
(95, 'Primal Rage', 'Winston embraces his animal nature, significantly boosting his health and making him very difficult to kill, strengthening his melee attack, and allowing him to use his Jump Pack ability more frequently. While raging, Winston can only make melee and Jump Pack attacks.', 1, 20),
(96, 'Particle Cannon', 'Zarya’s mighty Particle Cannon unleashes a short-range beam of destructive energy. Alternatively, Zarya can lob an explosive charge to strike multiple opponents.', 0, 21),
(97, 'Particle Barrier', 'The Particle Cannon can emit a personal barrier that shields Zarya against incoming attacks, redirecting their energy to enhance her weapon’s damage and the width of its beam.', 0, 21),
(98, 'Projected Barrier', 'Zarya surrounds one of her teammates with an energy barrier that simultaneously absorbs fire and boosts the power of her Particle Cannon.', 0, 21),
(99, 'Energy', 'Damage blocked increases Particle Cannon damage.', 0, 21),
(100, 'Graviton Surge', 'Zarya launches a gravity bomb that draws in enemy combatants and deals damage while they’re trapped.', 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `hero`
--

DROP TABLE IF EXISTS `hero`;
CREATE TABLE IF NOT EXISTS `hero` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `real_name` varchar(100) NOT NULL,
  `health` int(11) NOT NULL,
  `armour` int(11) NOT NULL,
  `shield` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hero`
--

INSERT INTO `hero` (`id`, `name`, `real_name`, `health`, `armour`, `shield`) VALUES
(1, 'Ana', 'Ana Amari', 200, 0, 0),
(2, 'Bastion', 'SST Laboratories Siege Automaton E54', 200, 100, 0),
(3, 'D.Va', 'Hana Song', 200, 400, 0),
(4, 'Genji', 'Genji Shimada', 200, 0, 0),
(5, 'Hanzo', 'Hanzo Shimada', 200, 0, 0),
(6, 'Junkrat', 'Jamison Fawkes', 200, 0, 0),
(7, 'Lúcio', 'Lúcio Correia dos Santos', 200, 0, 0),
(8, 'McCree', 'Jesse McCree', 200, 0, 0),
(9, 'Mei', 'Mei-Link Zhou', 250, 0, 0),
(10, 'Mercy', 'Angela Ziegler', 200, 0, 0),
(11, 'Pharah', 'Fareeha Amari', 200, 0, 0),
(12, 'Reaper', 'Gabriel Reyes', 250, 0, 0),
(13, 'Reinhardt', 'Reinhardt Wilhelm', 300, 200, 0),
(14, 'Roadhog', 'Mako Rutledge', 600, 0, 0),
(15, 'Soldier: 76', 'Jack Morrison', 200, 0, 0),
(16, 'Symmetra', 'Satya Vaswani', 100, 0, 0),
(17, 'Torbjörn', 'Torbjörn Lindholm', 200, 0, 0),
(18, 'Tracer', 'Lena Oxton', 150, 0, 0),
(19, 'Widowmaker', 'Amélie Lacroix', 200, 0, 0),
(20, 'Winston', 'Winston', 400, 100, 0),
(21, 'Zarya', 'Aleksandra Zaryanova', 200, 0, 200),
(22, 'Zenyatta', 'Tekhartha Zenyatta', 50, 0, 150),
(23, 'Sombra', '??????', 200, 0, 0),
(24, 'Orisa', 'Orisa', 200, 200, 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ability`
--
ALTER TABLE `ability`
  ADD CONSTRAINT `ability_ibfk_1` FOREIGN KEY (`fk_hero`) REFERENCES `hero` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
