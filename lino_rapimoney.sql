-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql-lino.alwaysdata.net
-- Generation Time: Jan 13, 2024 at 02:10 AM
-- Server version: 10.6.14-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lino_rapimoney`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `names` varchar(255) NOT NULL,
  `last_names` varchar(255) NOT NULL,
  `birthdate` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `cci_number` varchar(255) NOT NULL,
  `bonus_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `dni`, `names`, `last_names`, `birthdate`, `phone`, `email`, `bank`, `cci_number`, `bonus_password`) VALUES
(1, '74485522', 'Andrea ', 'González Flores', '1996-05-23', '912345678', 'andrea.gonzalez@gmail.com', 'Banco de Crédito del Perú', '41029563871254389076', '$2b$10$WS1Lyc540Y1atwfHDHJmMO6FWS9c/tXlWJbAbcy3Pn2WFrGCOtcBO'),
(2, '74485523', 'Carlos', 'Martínez Ruiz', '2000-05-15', '934567890', 'carlos.martinez@gmail.com', 'Interbank', '89234567891245670389', '$2b$10$A3.q0zc7SqWpXBST06sjTONThOVy943A1O1EveRffsR7J/buQKL/C'),
(3, '70783038', 'Valeria ', 'Herrera Sánchez', '1980-06-19', '956789012', 'valeria.herrera@gmail.com', 'Banco de la Nación', '63450987125678901234', '$2b$10$PuhArQD7Pt0Lqw3/gDt4U.Gfs.yRS5ZjUWO5DWyqJoRmM50Kmh1ve'),
(4, '74485552', 'Alejandro ', ' Ramírez Castro', '1988-02-04', '998765432', 'alejandro.ramirez@gmail.com', 'MiBanco', '98765432123456789012', '$2b$10$EBSiRs7tCny4jXriUfb.cuAVnUrt2PDCLTPRWRyLFjG/adHy9JfCy'),
(5, '75145896', 'Sofía ', 'Mendoza López', '1999-12-31', '945678123', 'sofia.mendoza@gmail.com', 'Banco Ripley', '12345678901234567890', '$2b$10$HRxKSCmbVh1j.qfVHtYJouQlmFkV5JLD8BO8ElPhpwbUy9wt4De76'),
(6, '70783051', 'Sebastián ', 'Pérez Vargas', '2002-02-15', '923456789', 'sebastian.perez@gmail.com', 'J.P Banco de Inversión', '56789012341234567890', '$2b$10$TZoQsrR3vWEsgAn3JWM19Ol5H2UhKSgkVOu7EJtJ51CmjPuNSU9d6'),
(7, '74905121', 'Isabella ', 'Jiménez Torres', '2001-12-15', '987654321', 'isabella.jimenez@gmail.com', 'Banco de Crédito del Perú', '89012345678901234567', '$2b$10$9yynCcGdvhi2BugWkTRIgOTousxbSTYSn5QDBcOLaIGgyL5/Nz4sC'),
(8, '47752195', 'Juan ', 'Morales Gómez', '1998-07-05', '978901234', 'juan.morales@gmail.com', 'BBVA', '34127896549012356789', '$2b$10$YBr/AlDz6kMqLtaf.u3Vb.3QCfPaCxWf8YDtel8lV9OoOtvJmSpzO'),
(9, '47752199', 'Valentina ', 'Silva Cruz', '1999-10-05', ' 965432178', 'valentina.silva@gmail.com', 'Scotiabank Perú', ' 98765432123456789012', '$2b$10$XUdxsqt3q1FR3hZGtjfbQ.wRfvo8NaLZk2695xBKFIySELJoBkWmC'),
(10, '74488895', 'Francisco ', 'Ortega Medina', '1970-03-06', '956781234', 'francisco.ortega@gmail.com', 'Banco Falabella', '10987654321234567890', '$2b$10$6hPE1YxZeHGmzaKrKGYj.uCbg.jYWo/MTmmcRBM/i09ZcFIgYmIyy'),
(11, '74905162', 'Paulino Alfonso', 'Contreras Gomez', '1999-10-23', '981632216', 'contrerasalfonso.lino@gmail.com', 'Banco de Crédito del Perú', '18765432123456781111', '$2b$10$Stx9MgvzNs3vD9MFxwXKv.W.JyqPObAnpsaBgQ1JqC5NywaO2ZyM6');

-- --------------------------------------------------------

--
-- Table structure for table `operation_categories`
--

CREATE TABLE `operation_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `operation_categories`
--

INSERT INTO `operation_categories` (`id`, `category_name`) VALUES
(1, 'Retiro de efectivo'),
(2, 'Préstamo con evaluación'),
(3, 'Préstamo con garantía'),
(4, 'Pago con descuento');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `operation_date` datetime DEFAULT current_timestamp(),
  `amount_paid` float NOT NULL,
  `deposited_amount` float NOT NULL,
  `customerId` int(11) DEFAULT NULL,
  `operationCategoryId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `operation_date`, `amount_paid`, `deposited_amount`, `customerId`, `operationCategoryId`) VALUES
('0039bfa0-aeee-4684-b741-e30fa9194ebe', '2024-01-12 19:54:36', 1303, 1185.73, 3, 3),
('00f8a32d-c6da-4fa4-9d78-a30a6f7983bc', '2024-01-12 19:54:06', 676, 615.16, 9, 4),
('02274024-8154-424c-be11-89018a782534', '2024-01-12 20:00:07', 1116, 1015.56, 1, 2),
('03dc895f-c2b3-4942-a532-1066f6159aaf', '2024-01-12 19:51:27', 101, 91.91, 8, 4),
('07b5f682-5aa8-4442-8d58-e7eafa5c5e67', '2024-01-12 19:54:36', 1241, 1129.31, 6, 3),
('09737d61-212e-4490-a803-92f5f1d06b9a', '2024-01-12 19:45:47', 570, 518.7, 2, 1),
('0df579ba-8098-4eae-a958-96369ad69992', '2024-01-12 20:01:32', 1449, 1318.59, 2, 3),
('0eb9c5e2-86e7-4e66-b520-24b3dd5da9a0', '2024-01-12 19:51:27', 850, 773.5, 5, 4),
('0f5d2d27-f43a-49e2-8b2a-9101e0629f17', '2024-01-12 19:49:32', 1057, 961.87, 6, 2),
('118f7d8e-30c2-42a4-80c7-062a4c04f7a1', '2024-01-12 19:49:32', 1469, 1336.79, 2, 2),
('13bf2e11-2f87-44c7-a1b3-6783e8f41592', '2024-01-12 19:51:27', 1461, 1329.51, 2, 4),
('13c6306d-caf8-4f00-90c3-9d9b3b3e4dd7', '2024-01-12 20:02:44', 1442, 1312.22, 6, 4),
('168e5bed-3eb3-45e5-8205-34562452f65e', '2024-01-12 20:04:15', 897, 816.27, 7, 3),
('1762e621-cd8a-457d-992f-dd9f258c170a', '2024-01-12 19:50:48', 1026, 933.66, 10, 3),
('1966671e-4f67-4407-94f0-bab6474b2f78', '2024-01-12 20:04:15', 1387, 1262.17, 5, 3),
('1a1161cc-e939-437a-9f54-320501bbded6', '2024-01-12 19:49:32', 1200, 1092, 5, 2),
('2264bc05-bbaf-474d-8009-110faf64a55a', '2024-01-12 19:54:36', 1352, 1230.32, 5, 3),
('23133fe0-1919-4eab-bd9e-c8b5487ef85a', '2024-01-12 19:54:36', 1228, 1117.48, 2, 3),
('237f5831-0494-4a06-a3f2-f120b8358169', '2024-01-12 20:01:32', 806, 733.46, 3, 3),
('26406fa0-7b51-47a2-8fab-8466bae3f197', '2024-01-12 19:45:47', 700, 637, 11, 1),
('29ad91eb-c2b2-417a-96f3-f1f5dcdd09c2', '2024-01-12 20:04:15', 1490, 1355.9, 10, 3),
('2c7f8b36-ea1a-43bb-8afc-6a1bd86dfa24', '2024-01-12 19:45:47', 590, 536.9, 5, 1),
('2dcd43ad-0aa1-48b0-984b-c6d034673f54', '2024-01-12 19:54:36', 1002, 911.82, 1, 3),
('2ec3e6cc-729c-4f8b-a3f1-3112b4a7d11b', '2024-01-12 20:07:27', 1888, 1718.08, 11, 1),
('2ff4b4c8-dab9-4329-9676-6fd86badf727', '2024-01-12 19:50:48', 1479, 1345.89, 6, 3),
('31b17cc3-4f2a-4cc7-a4dd-7638d241acd5', '2024-01-12 20:04:15', 812, 738.92, 11, 3),
('3204f9f4-3568-4d04-8bba-0a2d3196181d', '2024-01-12 19:51:27', 1122, 1021.02, 1, 4),
('36b73772-206d-446e-bc9f-bdac5b9855a8', '2024-01-12 19:51:27', 594, 540.54, 3, 4),
('370002ff-a88a-4c89-8c47-3b04c9c15478', '2024-01-12 19:45:47', 150, 136.5, 10, 1),
('3b4b94d0-f5cb-4586-bf46-2a1915224653', '2024-01-12 19:57:25', 1007, 916.37, 10, 2),
('3cabd1ba-824d-4ccb-ae17-785b5026e32e', '2024-01-12 20:00:07', 1385, 1260.35, 7, 2),
('427afe92-9fa7-41d7-b9a4-f0c1159ce509', '2024-01-12 19:54:36', 1458, 1326.78, 7, 3),
('42e582a3-c137-4a1f-8ea0-d67c8b336d02', '2024-01-12 19:58:39', 595, 541.45, 8, 1),
('4465093d-a5af-4b52-9c39-adfc4cbbc9b8', '2024-01-12 19:45:47', 980, 891.8, 1, 1),
('4495bd23-4a6a-4f0f-b100-ee42ec53cc54', '2024-01-12 19:45:47', 70, 63.7, 8, 1),
('44b9f437-d02b-4553-9693-9adc72f669d7', '2024-01-12 19:49:32', 248, 225.68, 10, 2),
('4c643b4a-8efa-4a20-870b-ddce097f615b', '2024-01-12 20:04:15', 1335, 1214.85, 4, 3),
('502d7f3b-31e0-4107-aa76-07082968e1d7', '2024-01-12 19:57:25', 976, 888.16, 7, 2),
('52ebbf3d-6030-4e43-9179-c6ebf5fb9324', '2024-01-12 20:02:44', 1234, 1122.94, 4, 4),
('538fd303-7c2a-446a-b4ba-cfd81a1d03cf', '2024-01-12 19:49:32', 539, 490.49, 4, 2),
('54c2ea00-c55e-4b13-b639-364dda182fe0', '2024-01-12 20:02:44', 1423, 1294.93, 2, 4),
('56e8d798-3aea-4531-8bec-246cb7e043e4', '2024-01-12 19:54:36', 976, 888.16, 9, 3),
('5c069450-2e0d-445b-b4dc-2bd224c1541d', '2024-01-12 20:00:07', 1271, 1156.61, 8, 2),
('5d21ce05-9ef6-4c35-9c19-977a3ceb8f19', '2024-01-12 19:50:48', 442, 402.22, 3, 3),
('5dff15b9-af28-44dd-b3e4-3779f9bb3238', '2024-01-12 20:02:44', 1495, 1360.45, 9, 4),
('5f808995-37e9-441c-993e-3caab5eeb5a6', '2024-01-12 19:58:39', 908, 826.28, 2, 1),
('60d83fb0-e89c-49b6-a99b-1a9bf6598a79', '2024-01-12 20:04:15', 1294, 1177.54, 9, 3),
('6103530b-a168-4bf7-9d06-4839f65b550b', '2024-01-12 19:54:06', 1241, 1129.31, 6, 4),
('63ee8e11-f9ff-423b-a63b-2c37704ada5d', '2024-01-12 19:54:36', 1334, 1213.94, 10, 3),
('64a299c1-afe3-4c51-99d3-99897864b862', '2024-01-12 20:02:44', 1172, 1066.52, 3, 4),
('667342f6-54a3-4ae0-8be7-04d55cb28b1d', '2024-01-12 20:01:32', 1387, 1262.17, 5, 3),
('6693596e-439b-4aa0-88bd-fa9fc6200cd7', '2024-01-12 20:00:07', 1054, 959.14, 2, 2),
('67e694f7-55d7-43fb-90b0-4753340ed0aa', '2024-01-12 19:54:06', 1247, 1134.77, 1, 4),
('691d7e6f-6467-48cc-848c-7024347a6a24', '2024-01-12 20:01:32', 812, 738.92, 11, 3),
('6a580ae2-090b-4f12-b7e4-28538efda407', '2024-01-12 19:57:25', 1321, 1202.11, 4, 2),
('6a86eb31-4558-4a7d-accc-4d31e29d1f9d', '2024-01-12 19:54:06', 1360, 1237.6, 10, 4),
('6b36ad63-0385-443f-9e59-57d0ef92f294', '2024-01-12 20:00:07', 1142, 1039.22, 4, 2),
('6d613b5e-d275-42ae-b690-79669691a67e', '2024-01-12 19:57:25', 750, 682.5, 3, 2),
('6fbc906f-df8c-4028-aede-89c1d87a46e7', '2024-01-12 20:01:32', 1490, 1355.9, 10, 3),
('72a60f79-00b4-4b8d-bfa7-da43d22fd0ee', '2024-01-12 19:58:39', 1057, 961.87, 1, 1),
('781c55c2-4b06-47a2-8f6d-de9a71ad4634', '2024-01-12 20:01:32', 1415, 1287.65, 6, 3),
('79932f4c-41b4-4570-b5d2-8d3f3e6bd0db', '2024-01-12 19:58:39', 1027, 934.57, 9, 1),
('7c5f49e9-4088-4686-a9ee-157e25f1791f', '2024-01-12 19:51:27', 1123, 1021.93, 7, 4),
('7d0891f6-c942-456f-98cb-317a6ad6bc9f', '2024-01-12 19:54:36', 1009, 918.19, 11, 3),
('7f2a01d4-d71f-43e7-a8cd-e8924fef0987', '2024-01-12 19:54:06', 603, 548.73, 3, 4),
('80dc8cf1-5aa5-4a43-a0c8-d361a5292156', '2024-01-12 19:49:32', 574, 522.34, 3, 2),
('819f53d3-5a90-4a1b-ba21-62dcd122c5c0', '2024-01-12 19:58:39', 956, 869.96, 5, 1),
('81cb8786-a28e-4ea2-b38b-550bd793bb02', '2024-01-12 20:04:15', 1415, 1287.65, 6, 3),
('820ad2cb-b25f-4183-964d-c06286e6f887', '2024-01-12 20:07:27', 1500, 1365, 11, 2),
('820fb182-141e-46ad-aac9-be50aa0359c2', '2024-01-12 19:45:47', 785, 714.35, 4, 1),
('842ec614-f0fc-4269-9bf7-2aa6d12ce6b3', '2024-01-12 20:00:07', 1113, 1012.83, 10, 2),
('85d9946b-53db-4ea8-b751-3a0e719ce596', '2024-01-12 19:57:25', 1174, 1068.34, 9, 2),
('8775204a-7c40-48dc-a926-d95af1f8ecc8', '2024-01-12 20:04:15', 1181, 1074.71, 8, 3),
('87841fa5-e47d-460f-a81f-57cc502c2cea', '2024-01-12 20:02:44', 935, 850.85, 1, 4),
('8a420c50-be02-4b6a-823a-544559d852bd', '2024-01-12 19:50:48', 1343, 1222.13, 4, 3),
('8b024a35-b6d1-4529-ae80-8ffcea8f3190', '2024-01-12 19:45:47', 550, 500.5, 7, 1),
('8c30906c-264a-4288-a2f2-190e39b8968c', '2024-01-12 19:51:27', 1481, 1347.71, 11, 4),
('8e7b837d-3098-4c71-8b99-0897c915dec8', '2024-01-12 19:58:39', 807, 734.37, 4, 1),
('9063eade-eac2-4065-9f94-0845e89aea08', '2024-01-12 20:01:32', 1369, 1245.79, 1, 3),
('91921658-5aaf-4f38-993e-6530b69761a5', '2024-01-12 19:54:36', 432, 393.12, 4, 3),
('938abd18-1618-4269-bbdc-f425636cc24e', '2024-01-12 19:51:27', 976, 888.16, 6, 4),
('93f67b62-3525-4db0-b9ff-d5a29708e777', '2024-01-12 19:50:48', 1092, 993.72, 7, 3),
('93fa2ff3-07cd-4ad5-bb81-ffd5c547043c', '2024-01-12 19:50:48', 1186, 1079.26, 1, 3),
('9531ca28-e1bf-4215-bbd9-be689f6384d8', '2024-01-12 19:45:47', 600, 546, 3, 1),
('954b536a-28e6-4c09-bb03-824ce70f31eb', '2024-01-12 19:45:47', 380, 345.8, 6, 1),
('9a023ce2-8c33-4e86-a740-829fdcd40e4b', '2024-01-12 19:50:48', 556, 505.96, 5, 3),
('9df910a7-df9f-4fdd-91ac-19c3d7b1932e', '2024-01-12 20:00:07', 1422, 1294.02, 6, 2),
('9f50fe66-1742-40ea-9ded-52bd30493c97', '2024-01-12 19:54:36', 1317, 1198.47, 8, 3),
('a16e937b-81be-44f2-b680-c3f3c8223d1f', '2024-01-12 19:57:25', 1089, 990.99, 2, 2),
('a24a45e1-7aee-4106-bc4c-f51c0877ce10', '2024-01-12 19:50:48', 351, 319.41, 2, 3),
('a48a3dfc-63a8-476f-8641-973d6cd2562f', '2024-01-12 19:54:06', 1069, 972.79, 11, 4),
('a520666e-7291-43a8-83f5-947e7f102810', '2024-01-12 19:51:27', 1426, 1297.66, 9, 4),
('a7637b9a-059c-41c8-ae83-1f0a0f3a4014', '2024-01-12 20:02:44', 1394, 1268.54, 10, 4),
('ab48d42e-1dfb-4f3e-ae37-7ec49a5fde8c', '2024-01-12 19:51:27', 1225, 1114.75, 4, 4),
('abc8faae-a186-420a-b542-3d2832015754', '2024-01-12 20:07:27', 1150, 1046.5, 11, 2),
('ac42dd01-90cf-437d-8a70-af0cb29848f8', '2024-01-12 19:49:32', 1208, 1099.28, 8, 2),
('b0b5bc14-6409-479f-bd10-3fdf7af3483f', '2024-01-12 20:00:07', 1307, 1189.37, 9, 2),
('b13c7a11-2b09-49e6-8206-fb6b3056281f', '2024-01-12 20:02:44', 1340, 1219.4, 11, 4),
('b3b2b8e2-4a89-426e-9a13-2781c5bdd1d8', '2024-01-12 20:02:44', 1325, 1205.75, 7, 4),
('b3cf6f18-fea8-4282-9409-68bc809f382d', '2024-01-12 20:06:20', 1129, 1027.39, 1, 3),
('b870f62b-0411-404e-a20b-d4f08174b913', '2024-01-12 20:06:20', 944, 859.04, 1, 2),
('c06b3c41-5fdd-4cca-befd-b342e69b7128', '2024-01-12 19:54:06', 1478, 1344.98, 2, 4),
('c189a4cd-96bc-47f9-9ff3-807cb409f16c', '2024-01-12 20:04:15', 1369, 1245.79, 1, 3),
('c2115c37-9de9-437a-98a3-79639a709fc7', '2024-01-12 19:49:32', 1162, 1057.42, 1, 2),
('c2403ee9-ca9d-42f8-96d0-6a175fe1fbc3', '2024-01-12 19:58:39', 1226, 1115.66, 11, 1),
('c27b276c-006c-4a28-8cee-1ac51a635e91', '2024-01-12 19:57:25', 1128, 1026.48, 6, 2),
('c6596400-b3af-4c78-81fd-60bf046b889c', '2024-01-12 19:54:06', 1133, 1031.03, 7, 4),
('ca93a7a5-c030-4990-add8-9844b7f1331e', '2024-01-12 19:49:32', 1074, 977.34, 7, 2),
('cdfbcc39-2153-49f7-ba5a-0ef53e8e2ef1', '2024-01-12 19:50:48', 1309, 1191.19, 9, 3),
('d0abda60-c36d-40f3-9345-da2babe5bed9', '2024-01-12 19:50:48', 1321, 1202.11, 11, 3),
('d16d0b47-2666-4664-804a-90314f892d9d', '2024-01-12 19:58:39', 1291, 1174.81, 6, 1),
('d1eb41d8-4b0e-48e2-8c70-15295ec0f974', '2024-01-12 19:45:47', 390, 354.9, 9, 1),
('d595d977-ef7d-4825-9550-598859142bb4', '2024-01-12 19:54:06', 1432, 1303.12, 5, 4),
('d61f684c-2f41-459f-95de-404786369412', '2024-01-12 20:01:32', 1181, 1074.71, 8, 3),
('d625bb10-d84a-44e9-8ad9-d2f8f9cbbd5f', '2024-01-12 19:49:32', 944, 859.04, 9, 2),
('d86e17b5-cae2-4cd0-bd91-3b260a234c77', '2024-01-12 20:07:27', 1950, 1774.5, 11, 3),
('d8c874a1-baf6-40fa-a021-3dc108e682e8', '2024-01-12 19:51:27', 465, 423.15, 10, 4),
('db585704-4cac-406f-bd15-a1eb25b8b8d8', '2024-01-12 19:58:39', 1031, 938.21, 7, 1),
('dbb0d1be-ca72-42f4-a415-e27c64280024', '2024-01-12 20:02:44', 1217, 1107.47, 8, 4),
('dccf936c-47b2-46fa-9f84-84fcd1f18eb6', '2024-01-12 20:01:32', 897, 816.27, 7, 3),
('dfd74438-12e1-44f3-86d4-6e202fb49931', '2024-01-12 20:06:20', 1346, 1224.86, 1, 1),
('e086ebaa-0815-45cc-a99d-0f822f4a77d4', '2024-01-12 19:54:06', 838, 762.58, 4, 4),
('e136167f-c683-4a7e-aa17-0607bcf62cf8', '2024-01-12 19:58:39', 1320, 1201.2, 10, 1),
('e23e3d52-3e43-4a61-8ccf-008fa0997d74', '2024-01-12 20:04:15', 1449, 1318.59, 2, 3),
('e335a00e-ad8a-4b6b-a704-5289c7530b02', '2024-01-12 19:57:25', 1314, 1195.74, 11, 2),
('e547fe3f-90ac-4a8d-b576-5c76347f58d4', '2024-01-12 20:01:32', 1335, 1214.85, 4, 3),
('ec469307-0963-40d0-9c44-c38281ffc591', '2024-01-12 19:49:32', 1480, 1346.8, 11, 2),
('ed898539-1136-4827-b8cb-c786eeef14b2', '2024-01-12 19:50:48', 767, 697.97, 8, 3),
('eda73807-7d63-40eb-91ee-909f839c6159', '2024-01-12 20:00:07', 1355, 1233.05, 3, 2),
('ee4045e6-a370-4637-971d-250ca443bbe0', '2024-01-12 19:58:39', 1136, 1033.76, 3, 1),
('f2b615b0-739e-4ef7-ba25-948895ed8596', '2024-01-12 19:54:06', 1077, 980.07, 8, 4),
('f4410c4f-1bfc-4e6e-9c59-0606ff764ef3', '2024-01-12 19:57:25', 1433, 1304.03, 8, 2),
('f863a5b2-0714-4873-8d66-aed64f572b9f', '2024-01-12 20:02:44', 1419, 1291.29, 5, 4),
('f92692d9-a658-4dfc-b809-53d9319b6531', '2024-01-12 19:57:25', 1482, 1348.62, 5, 2),
('f9c2f26e-43a5-4dab-b61e-7d248f35701b', '2024-01-12 20:00:07', 1303, 1185.73, 11, 2),
('fa532b27-265e-4d66-a82a-deef9eb3acda', '2024-01-12 20:01:32', 1294, 1177.54, 9, 3),
('fb59a594-8930-4e26-b6a6-e2a2363c8790', '2024-01-12 20:04:15', 806, 733.46, 3, 3),
('fda7d2b5-a676-43ad-8094-01a01408e3cb', '2024-01-12 20:00:07', 1108, 1008.28, 5, 2),
('fdb4bb85-44a8-4c02-ac4a-6e2751e13b13', '2024-01-12 20:06:20', 1197, 1089.27, 1, 2),
('fe394bf2-e012-40ae-9f6f-965bcd11c272', '2024-01-12 19:57:25', 942, 857.22, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operation_categories`
--
ALTER TABLE `operation_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerId` (`customerId`),
  ADD KEY `operationCategoryId` (`operationCategoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `operation_categories`
--
ALTER TABLE `operation_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`operationCategoryId`) REFERENCES `operation_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
