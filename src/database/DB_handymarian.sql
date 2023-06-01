git-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: handymarian
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `idcategorias` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcategorias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_insumos`
--

DROP TABLE IF EXISTS `detalle_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_insumos` (
  `iddetalle_insumos` int NOT NULL AUTO_INCREMENT,
  `detalleinsumos_productos_id` int NOT NULL,
  `detalleinsumos_insumos_id` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`iddetalle_insumos`),
  KEY `fk_id_productos_idx` (`detalleinsumos_productos_id`),
  KEY `fk_id_insumos_idx` (`detalleinsumos_insumos_id`),
  CONSTRAINT `fk_detalleinsumos_insumos_id` FOREIGN KEY (`detalleinsumos_insumos_id`) REFERENCES `insumos` (`id_insumos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_detalleinsumos_productos_id` FOREIGN KEY (`detalleinsumos_productos_id`) REFERENCES `Productos` (`idProductos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_insumos`
--

LOCK TABLES `detalle_insumos` WRITE;
/*!40000 ALTER TABLE `detalle_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagenes` (
  `id_imagenes` int NOT NULL AUTO_INCREMENT,
  `imagenes_producto_id` int NOT NULL,
  `imagen_portada` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_alt` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_1` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_2` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_3` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_4` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `imagen_5` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_imagenes`),
  KEY `fk_id_productos_idx` (`imagenes_producto_id`),
  CONSTRAINT `fk_imagenes_producto_id` FOREIGN KEY (`imagenes_producto_id`) REFERENCES `Productos` (`idProductos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `id_insumos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_insumos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos_proveedores`
--

DROP TABLE IF EXISTS `insumos_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos_proveedores` (
  `id_insumos_proveedores` int NOT NULL AUTO_INCREMENT,
  `insumosproveedores_insumos_id` int NOT NULL,
  `insumosproveedores_proveedores_id` int NOT NULL,
  `precio` int NOT NULL,
  `fecha` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_insumos_proveedores`),
  KEY `fk_id_insumos_idx` (`insumosproveedores_insumos_id`),
  KEY `fk_id_proveedores_idx` (`insumosproveedores_proveedores_id`),
  CONSTRAINT `fk_insumosproveedores_insumos_id` FOREIGN KEY (`insumosproveedores_insumos_id`) REFERENCES `insumos` (`id_insumos`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_insumosproveedores_proveedores_id` FOREIGN KEY (`insumosproveedores_proveedores_id`) REFERENCES `proveedores` (`id_proveedores`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos_proveedores`
--

LOCK TABLES `insumos_proveedores` WRITE;
/*!40000 ALTER TABLE `insumos_proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `insumos_proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProductos` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `fecha_de_creacion` date NOT NULL,
  `detalles_constructivs` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `medidas` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idProductos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,'velador Tangible','Velador de amurar en paraíso y cemento blanco','2023-05-10',NULL,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_categorias`
--

DROP TABLE IF EXISTS `productos_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_categorias` (
  `id_productos_categorias` int NOT NULL AUTO_INCREMENT,
  `productoscategorias_productos_id` int NOT NULL,
  `productoscategorias_categorias_id` int NOT NULL,
  PRIMARY KEY (`id_productos_categorias`),
  KEY `fk_id_producto_idx` (`productoscategorias_productos_id`),
  KEY `fk_id_categoria_idx` (`productoscategorias_categorias_id`),
  CONSTRAINT `fk_productoscategorias_categorias_id` FOREIGN KEY (`productoscategorias_categorias_id`) REFERENCES `categorias` (`idcategorias`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_productoscategorias_productos_id` FOREIGN KEY (`productoscategorias_productos_id`) REFERENCES `Productos` (`idProductos`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_categorias`
--

LOCK TABLES `productos_categorias` WRITE;
/*!40000 ALTER TABLE `productos_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedores` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `mail` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `web` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_proveedores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30  8:40:17
