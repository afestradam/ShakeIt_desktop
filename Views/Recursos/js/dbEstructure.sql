-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: shakeitdata_des
-- ------------------------------------------------------
-- Server version	5.7.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alertas`
--

DROP TABLE IF EXISTS `alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alertas` (
  `id_alerta` int(11) NOT NULL AUTO_INCREMENT,
  `nom_alerta` varchar(100) CHARACTER SET utf8 NOT NULL,
  `desc_alerta` varchar(500) CHARACTER SET utf8 NOT NULL,
  `fk_estado` int(11) NOT NULL,
  PRIMARY KEY (`id_alerta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `caja`
--

DROP TABLE IF EXISTS `caja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL AUTO_INCREMENT,
  `valor_caja` double NOT NULL,
  `estado_caja` int(11) NOT NULL,
  `sede_caja` int(11) NOT NULL,
  PRIMARY KEY (`id_caja`,`sede_caja`),
  UNIQUE KEY `sede_caja_UNIQUE` (`sede_caja`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomcategoria` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `tipcategoria` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `doc_cliente` double DEFAULT NULL,
  `nom_cliente` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `ape_cliente` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dir_cliente` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `barrio_cliente` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_municipio` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `tel_cliente` double NOT NULL,
  `us_cliente` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pass_cliente` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `email_cliente` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  `nac_cliente` date DEFAULT NULL,
  `registro_cliente` varchar(1000) COLLATE utf8_unicode_ci DEFAULT 'Local',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`,`tel_cliente`),
  UNIQUE KEY `doc_cliente_UNIQUE` (`doc_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms`
--

DROP TABLE IF EXISTS `cms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms` (
  `idcms` int(11) NOT NULL AUTO_INCREMENT,
  `contenido_cms` varchar(4000) COLLATE utf8_spanish_ci NOT NULL,
  `titulo_cms` varchar(2000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `adicional_cms` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `adicional2_cms` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_cms` date DEFAULT NULL,
  `tcontenido_cms` int(11) NOT NULL,
  `estado_cms` int(11) DEFAULT NULL,
  PRIMARY KEY (`idcms`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_seccion`
--

DROP TABLE IF EXISTS `cms_seccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_seccion` (
  `idseccion` int(11) NOT NULL AUTO_INCREMENT,
  `nom_seccion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `estado_seccion` int(11) NOT NULL,
  PRIMARY KEY (`idseccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cms_tcontenido`
--

DROP TABLE IF EXISTS `cms_tcontenido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_tcontenido` (
  `id_tcontenido` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tcontenido` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tcontenido`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comun_estados`
--

DROP TABLE IF EXISTS `comun_estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comun_estados` (
  `idcomun_estado` int(11) NOT NULL AUTO_INCREMENT,
  `nomcomun_estado` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idcomun_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consumo` (
  `id_consumo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_consumo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_consumo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `con_id` int(11) NOT NULL AUTO_INCREMENT,
  `con_nombre` varchar(100) NOT NULL,
  `con_email` varchar(100) NOT NULL,
  `con_mensaje` varchar(3000) NOT NULL,
  `con_fecha` date NOT NULL,
  `con_estado` varchar(45) NOT NULL,
  PRIMARY KEY (`con_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id_departamento` int(11) NOT NULL,
  `nom_departamento` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entidadespago`
--

DROP TABLE IF EXISTS `entidadespago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entidadespago` (
  `id_entidad` int(11) NOT NULL AUTO_INCREMENT,
  `nom_entidad` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_entidad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estados_generales`
--

DROP TABLE IF EXISTS `estados_generales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estados_generales` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `nom_estado` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumos` (
  `id_insumo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_insumo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_unidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_insumo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumos_rel`
--

DROP TABLE IF EXISTS `insumos_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumos_rel` (
  `fk_producto` int(11) NOT NULL,
  `fk_insumo` int(11) NOT NULL,
  `insumoUnidad_rel` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`fk_producto`,`fk_insumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `insumos_vendidos`
--

DROP TABLE IF EXISTS `insumos_vendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumos_vendidos` (
  `id_insumosv` int(11) NOT NULL AUTO_INCREMENT,
  `fk_insumo` int(11) DEFAULT NULL,
  `cant_insumosv` int(11) DEFAULT NULL,
  `fecha_insumosv` datetime DEFAULT NULL,
  `fk_sede` int(11) DEFAULT NULL,
  `web` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_insumosv`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `fk_insumo` int(11) NOT NULL,
  `cantidad_inventario` decimal(10,2) NOT NULL,
  `fecha_inventario` datetime NOT NULL,
  `sede_inventario` int(11) NOT NULL,
  PRIMARY KEY (`id_inventario`,`sede_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventario_día`
--

DROP TABLE IF EXISTS `inventario_día`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_día` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `fk_insumo` int(11) DEFAULT NULL,
  `cantidad1_inventario` int(11) DEFAULT NULL,
  `fecha1_inventario` datetime DEFAULT NULL,
  `cantidad2_inventario` int(11) DEFAULT NULL,
  `fecha2_inventario` datetime DEFAULT NULL,
  `fk_ideninventario` int(11) DEFAULT NULL,
  `fecha_inventario` datetime DEFAULT NULL,
  PRIMARY KEY (`id_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventario_identificador`
--

DROP TABLE IF EXISTS `inventario_identificador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_identificador` (
  `id_identificador` int(11) NOT NULL AUTO_INCREMENT,
  `iden_identificador` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_estado` int(11) DEFAULT NULL,
  `fecha_identificador` datetime DEFAULT NULL,
  PRIMARY KEY (`id_identificador`),
  UNIQUE KEY `iden_identificador_UNIQUE` (`iden_identificador`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `inventario_movimientos`
--

DROP TABLE IF EXISTS `inventario_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_movimientos` (
  `idmovimiento` int(11) NOT NULL AUTO_INCREMENT,
  `fktipo_movimiento` int(11) DEFAULT NULL,
  `descripcion_movimiento` varchar(1000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fkusuario_movimiento` int(11) DEFAULT NULL,
  `fksede_movimiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`idmovimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `medio_pago`
--

DROP TABLE IF EXISTS `medio_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medio_pago` (
  `idmedio_pago` int(11) NOT NULL AUTO_INCREMENT,
  `nommedio_pago` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idmedio_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimientos`
--

DROP TABLE IF EXISTS `movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos` (
  `id_movimiento` int(11) NOT NULL,
  `fk_tipo` int(11) NOT NULL,
  `fk_concepto` int(11) NOT NULL,
  `val_movimiento` double NOT NULL,
  `fk_usuario` int(11) DEFAULT NULL,
  `fk_sede` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_movimiento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimientos_concepto`
--

DROP TABLE IF EXISTS `movimientos_concepto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_concepto` (
  `id_concepto` int(11) NOT NULL,
  `nom_concepto` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_concepto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movimientos_tipo`
--

DROP TABLE IF EXISTS `movimientos_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movimientos_tipo` (
  `id_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tipo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `id_municipio` int(11) NOT NULL,
  `nom_municipio` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fk_estado` int(11) DEFAULT NULL,
  `fk_departamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `cant_pedido` int(11) NOT NULL,
  `fk_sede` int(11) NOT NULL,
  `fk_estado` int(11) NOT NULL,
  `fk_cliente` int(11) NOT NULL,
  `ref_pedido` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_pedido`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos_productos`
--

DROP TABLE IF EXISTS `pedidos_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `fk_producto` int(11) NOT NULL,
  `cant_producto` int(11) NOT NULL,
  `ref_pedido` varchar(1000) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nom_producto` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nomG_producto` varchar(1000) CHARACTER SET utf8 DEFAULT 'No Data',
  `precio_producto` double DEFAULT NULL,
  `mprima_producto` double DEFAULT NULL,
  `comision_producto` double DEFAULT NULL,
  `fk_categoria` int(11) DEFAULT NULL,
  `descripcion_producto` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  `imagen_producto` varchar(1000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `productos_vendidos`
--

DROP TABLE IF EXISTS `productos_vendidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_vendidos` (
  `id_vendido` int(11) NOT NULL AUTO_INCREMENT,
  `fk_producto` int(11) DEFAULT NULL,
  `cant_vendido` int(11) DEFAULT NULL,
  `desc_vendido` decimal(10,2) DEFAULT NULL,
  `fecha_vendido` datetime DEFAULT NULL,
  `fk_factura` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `fk_sede` int(11) DEFAULT NULL,
  `web` int(11) NOT NULL,
  PRIMARY KEY (`id_vendido`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reportes`
--

DROP TABLE IF EXISTS `reportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reportes` (
  `id_reportes` int(11) NOT NULL AUTO_INCREMENT,
  `iden_reporte` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `val_reporte` double DEFAULT NULL,
  `fk_sede` int(11) DEFAULT NULL,
  `fecha_reporte` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reportes`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sedes`
--

DROP TABLE IF EXISTS `sedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sedes` (
  `id_sede` int(11) NOT NULL AUTO_INCREMENT,
  `nit_sede` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `nom_sede` varchar(45) CHARACTER SET utf8 NOT NULL,
  `dir_sede` varchar(100) CHARACTER SET utf8 NOT NULL,
  `fk_municipio` int(11) DEFAULT NULL,
  `tel1_sede` double DEFAULT NULL,
  `tel2_sede` double DEFAULT NULL,
  `tel3_sede` double DEFAULT NULL,
  `long_sede` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `lat_sede` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `iden_sede` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_sede`),
  UNIQUE KEY `iden_sede_UNIQUE` (`iden_sede`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id_token` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pproyecto` int(11) DEFAULT NULL,
  `desc_token` varchar(8000) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_token` datetime DEFAULT NULL,
  `fk_estado` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidades` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `nomSI_unidad` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `simbolo_unidad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `doc_usuario` double NOT NULL,
  `nom_usuario` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ape_usuario` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `tel_usuario` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `email_usuario` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `pass_usuario` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `tipo_usuario` int(11) DEFAULT NULL,
  `estado_usuario` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuarios_tipo`
--

DROP TABLE IF EXISTS `usuarios_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios_tipo` (
  `idusuarios_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_tipo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idusuarios_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL AUTO_INCREMENT,
  `cant_productos` int(11) NOT NULL,
  `num_factura` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fk_sede` int(11) DEFAULT NULL,
  `fk_consumo` int(11) DEFAULT NULL,
  `fk_pago` int(11) DEFAULT NULL,
  `fk_entidad` int(11) DEFAULT NULL,
  `val_venta` double NOT NULL,
  `facha_venta` datetime DEFAULT NULL,
  `web` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'shakeitdata_des'
--
/*!50003 DROP PROCEDURE IF EXISTS `Caja_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Caja_Add`(in val double, in estado int, in sede int)
BEGIN

declare sid int;
declare scont int;

select
count(caja.sede_caja),
ifnull(caja.id_caja, 0)
into
scont,
sid
from caja
where caja.sede_caja = sede;

if scont > 0 then
CALL Caja_Update(sid, val, estado, sede);
else
INSERT INTO `caja`
(
`valor_caja`,
`estado_caja`,
`sede_caja`
)
VALUES
(
val,
estado,
sede
);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Caja_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Caja_Delete`(in id int)
BEGIN

DELETE FROM `caja`
WHERE caja.id_caja = id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Caja_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Caja_Get`()
BEGIN

SELECT caja.id_caja,
    caja.valor_caja,
    caja.estado_caja,
    estados_generales.nom_estado,
    caja.sede_caja
FROM `caja`
inner join estados_generales on estados_generales.idestado = caja.estado_caja;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Caja_GetXId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Caja_GetXId`(in id int)
BEGIN

SELECT caja.id_caja,
    caja.valor_caja,
    caja.estado_caja,
    caja.sede_caja
FROM `caja`
inner join estados_generales on estados_generales.idestado = caja.estado_caja
where caja.id_caja = id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Caja_GetXSede` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Caja_GetXSede`(in sede int)
BEGIN

SELECT caja.id_caja,
    caja.valor_caja,
    caja.estado_caja,
    caja.sede_caja
FROM `caja`
inner join estados_generales on estados_generales.idestado = caja.estado_caja
where caja.sede_caja = sede;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Caja_GeXSede` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Caja_GeXSede`(in sed int)
BEGIN

SELECT caja.id_caja,
    caja.valor_caja,
    caja.estado_caja,
    estados_generales.nom_estado,
    caja.sede_caja,
    sedes.nom_sede
FROM `caja`
inner join estados_generales on estados_generales.idestado = caja.estado_caja
inner join sedes on sedes.id_sede = caja.sede_caja
where caja.sede_caja = sed;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Caja_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Caja_Update`(in id int, in val double, in estado int, in sede int)
BEGIN

UPDATE `caja`
SET
`valor_caja` = val,
`estado_caja` = estado
WHERE `id_caja` = id AND `sede_caja` = sede;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Categorias_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Categorias_Get`()
BEGIN

select
categorias.idcategoria as id,
categorias.nomcategoria as nom
from categorias;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Categorias_GetPrincipales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Categorias_GetPrincipales`()
BEGIN



select

categorias.idcategoria,

categorias.nomcategoria

from categorias

where

categorias.tipcategoria = 1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Categorias_GetSecundarias` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Categorias_GetSecundarias`()
BEGIN



select

categorias.idcategoria,

categorias.nomcategoria

from categorias

where

categorias.tipcategoria != 1;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_Add`(
in doc double,
in nom varchar(100),
in ape varchar(100),
in dir varchar(100),
in barr varchar(100),
in mun int,
in tel double,
in us varchar(100),
in pass varchar(1000),
in email varchar(1000),
in nac datetime
)
BEGIN

INSERT INTO `clientes`
(
`doc_cliente`,
`nom_cliente`,
`ape_cliente`,
`dir_cliente`,
`barrio_cliente`,
`fk_municipio`,
`tel_cliente`,
`us_cliente`,
`pass_cliente`,
`email_cliente`,
`nac_cliente`,
`registro_cliente`,
`fecha_registro`
)
VALUES
(
doc,
nom,
ape,
dir,
barr,
mun,
tel,
us,
pass,
email,
nac,
'App',
now()
);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_AddLocal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_AddLocal`(
in doc double,
in nom varchar(100),
in ape varchar(100),
in dir varchar(100),
in barr varchar(100),
in mun int,
in tel double,
in email varchar(1000),
in nac datetime
)
BEGIN

INSERT INTO `clientes`
(
`doc_cliente`,
`nom_cliente`,
`ape_cliente`,
`dir_cliente`,
`barrio_cliente`,
`fk_municipio`,
`tel_cliente`,
`email_cliente`,
`nac_cliente`,
`registro_cliente`,
`fecha_registro`
)
VALUES
(
doc,
nom,
ape,
dir,
barr,
mun,
tel,
email,
nac,
'Local',
now()
);


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_AddVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_AddVenta`(
in nom varchar(100),
in ape varchar(100),
in dir varchar(100),
in barr varchar(100),
in mun int,
in tel double
)
BEGIN

declare sid int;
declare scant int;

select
ifnull(clientes.id_cliente, 0),
count(clientes.tel_cliente)
into
sid,
scant
from
clientes
where clientes.tel_cliente = tel;

if scant > 0 then

CALL `Cliente_UpdateVenta`(sid, nom, ape, dir, barr, mun, tel);

else

INSERT INTO `clientes`
(
`nom_cliente`,
`ape_cliente`,
`dir_cliente`,
`barrio_cliente`,
`fk_municipio`,
`tel_cliente`,
`registro_cliente`,
`fecha_registro`)
VALUES
(
nom,
ape,
dir,
barr,
mun,
tel,
'Venta',
now()
);

end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_Get`()
BEGIN

SELECT `clientes`.`id_cliente`,
    `clientes`.`doc_cliente`,
    `clientes`.`nom_cliente`,
    `clientes`.`ape_cliente`,
    `clientes`.`dir_cliente`,
    `clientes`.`barrio_cliente`,
    `clientes`.`fk_municipio`,
    `clientes`.`tel_cliente`,
    `clientes`.`email_cliente`,
    `clientes`.`registro_cliente`,
    `clientes`.`fecha_registro`
FROM `clientes`;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_GetXDoc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_GetXDoc`(
in doc double
)
BEGIN

SELECT `clientes`.`id_cliente`,
    `clientes`.`doc_cliente`,
    `clientes`.`nom_cliente`,
    `clientes`.`ape_cliente`,
    `clientes`.`dir_cliente`,
    `clientes`.`barrio_cliente`,
    `clientes`.`fk_municipio`,
    `clientes`.`tel_cliente`,
    `clientes`.`us_cliente`,
    `clientes`.`pass_cliente`,
    `clientes`.`email_cliente`,
    `clientes`.`nac_cliente`,
    `clientes`.`registro_cliente`,
    `clientes`.`fecha_registro`
FROM `clientes`
WHERE clientes.doc_cliente like concat('"%', doc, '%"');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_GetXId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_GetXId`(
in id int
)
BEGIN

SELECT `clientes`.`id_cliente`,
    `clientes`.`doc_cliente`,
    `clientes`.`nom_cliente`,
    `clientes`.`ape_cliente`,
    `clientes`.`dir_cliente`,
    `clientes`.`barrio_cliente`,
    `clientes`.`fk_municipio`,
    `clientes`.`tel_cliente`,
    `clientes`.`us_cliente`,
    `clientes`.`pass_cliente`,
    `clientes`.`email_cliente`,
    `clientes`.`nac_cliente`,
    `clientes`.`registro_cliente`,
    `clientes`.`fecha_registro`
FROM `clientes`
WHERE clientes.id_cliente = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_GetXTel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_GetXTel`(
in tel double
)
BEGIN

SELECT `clientes`.`id_cliente`,
    `clientes`.`doc_cliente`,
    `clientes`.`nom_cliente`,
    `clientes`.`ape_cliente`,
    `clientes`.`dir_cliente`,
    `clientes`.`barrio_cliente`,
    `clientes`.`fk_municipio`,
    `clientes`.`tel_cliente`,
    `clientes`.`us_cliente`,
    `clientes`.`pass_cliente`,
    `clientes`.`email_cliente`,
    `clientes`.`nac_cliente`,
    `clientes`.`registro_cliente`,
    `clientes`.`fecha_registro`
FROM `clientes`
WHERE clientes.doc_cliente like concat('"%', tel, '%"');

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_Update`(
in id int,
in doc double,
in nom varchar(100),
in ape varchar(100),
in dir varchar(100),
in barr varchar(100),
in mun int,
in tel double,
in us varchar(45),
in pass varchar(1000),
in email varchar(1000),
in nac datetime
)
BEGIN

UPDATE `clientes`
SET
`doc_cliente` = doc,
`nom_cliente` = nom,
`ape_cliente` = ape,
`dir_cliente` = dir,
`barrio_cliente` = barr,
`fk_municipio` = mun,
`tel_cliente` = tel,
`us_cliente` = us,
`pass_cliente` = pass,
`email_cliente` = email,
`nac_cliente` = nac,
`registro_cliente` = 'App',
`fecha_registro` = now()
WHERE `id_cliente` = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_UpdateLocal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_UpdateLocal`(
in id int,
in doc double,
in nom varchar(100),
in ape varchar(100),
in dir varchar(100),
in barr varchar(100),
in mun int,
in tel double,
in email varchar(1000),
in nac datetime
)
BEGIN

UPDATE `clientes`
SET
`doc_cliente` = doc,
`nom_cliente` = nom,
`ape_cliente` = ape,
`dir_cliente` = dir,
`barrio_cliente` = barr,
`fk_municipio` = mun,
`tel_cliente` = tel,
`email_cliente` = email,
`nac_cliente` = nac,
`registro_cliente` = 'Local',
`fecha_registro` = now()
WHERE `id_cliente` = id AND `tel_cliente` = tel;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Cliente_UpdateVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Cliente_UpdateVenta`(
in id int,
in nom varchar(100),
in ape varchar(100),
in dir varchar(100),
in barr varchar(100),
in mun int,
in tel double
)
BEGIN

UPDATE `clientes`
SET
`nom_cliente` = nom,
`ape_cliente` = ape,
`dir_cliente` = dir,
`barrio_cliente` = barr,
`fk_municipio` = mun,
`tel_cliente` = tel,
`registro_cliente` = 'Venta',
`fecha_registro` = now()
WHERE `id_cliente` = id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Consumo_GetSel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Consumo_GetSel`()
BEGIN



SELECT

consumo.id_consumo as id,

consumo.nom_consumo as nom

FROM consumo;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Departamentos_GetSel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Departamentos_GetSel`()
BEGIN

select
departamentos.id_departamento as id,
departamentos.nom_departamento as nom
from departamentos
order by departamentos.nom_departamento asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Entidades_GetSel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Entidades_GetSel`()
BEGIN

select
entidadespago.id_entidad as id,
entidadespago.nom_entidad as nom
from entidadespago
order by entidadespago.nom_entidad asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Facturas_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Facturas_Add`(in nproductos int,
in valor double,
in mediopago int,
in consumo int,
in sede int,
in numero int)
BEGIN

insert into
facturas
(
facturas.num_productos,
facturas.val_factura,
facturas.fk_mediopago,
facturas.fk_consumo,
facturas.fk_sede,
facturas.num_factura
)
values
(
nproductos,
valor,
mediopago,
consumo,
sede,
numero
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsumosV_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `InsumosV_Add`(IN ins int, IN cant int, in sede int, in web int)
BEGIN

insert into
insumos_vendidos 
(
insumos_vendidos.fk_insumo,
insumos_vendidos.cant_insumosv,
insumos_vendidos.fecha_insumosv,
insumos_vendidos.fk_sede,
insumos_vendidos.web
)values
(
ins,
cant,
now(),
sede,
web
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insumos_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Insumos_Add`(in nom varchar(100),
in uni int)
BEGIN

insert
into
insumos
(insumos.nom_insumo, insumos.fk_unidad)
values
(nom, uni);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insumos_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Insumos_Delete`(in id int)
BEGIN

delete
from
insumos
where insumos.id_insumo = id;

delete
from
insumos_rel
where insumos_rel.fk_insumo = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insumos_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Insumos_Get`()
BEGIN

Select
insumos.id_insumo,
insumos.nom_insumo,
unidades.nomSI_unidad
from
insumos
inner join unidades on unidades.id_unidad = insumos.fk_unidad;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insumos_GetSel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Insumos_GetSel`()
BEGIN

select
insumos.id_insumo as id,
insumos.nom_insumo as nom
from insumos
order by insumos.nom_insumo asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insumos_GetXId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Insumos_GetXId`(in id int)
BEGIN

Select
insumos.id_insumo,
insumos.nom_insumo,
unidades.id_unidad,
unidades.nomSI_unidad
from
insumos
inner join unidades on unidades.id_unidad = insumos.fk_unidad
where insumos.id_insumo = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Insumos_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Insumos_Update`(in id int,
in nom varchar(100),
in uni int)
BEGIN

update
insumos
set
insumos.nom_insumo = nom,
insumos.fk_unidad = uni
where insumos.id_insumo = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InventarioIden_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `InventarioIden_Add`(in iden varchar(45), in est int)
BEGIN

declare scont int;

select
count(inventario_identificador.iden_identificador)
into
scont
from inventario_identificador
where inventario_identificador.iden_identificador = iden;

if scont > 0 then
CALL`InventarioIden_Update`(iden, est);
else
INSERT INTO `inventario_identificador`
(
`iden_identificador`,
`fk_estado`,
`fecha_identificador`
)
VALUES
(
iden,
est,
now()
);
end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InventarioIden_GetXIden` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `InventarioIden_GetXIden`(in iden varchar(45))
BEGIN

SELECT `inventario_identificador`.`id_identificador`,
    `inventario_identificador`.`iden_identificador`,
    `inventario_identificador`.`fk_estado`,
    `inventario_identificador`.`fecha_identificador`
FROM `inventario_identificador`
where inventario_identificador.iden_identificador = iden
and
date(inventario_identificador.fecha_identificador) = date(now());


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InventarioIden_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `InventarioIden_Update`(in iden varchar(45), in est int)
BEGIN

UPDATE `inventario_identificador`
SET
`fk_estado` = est
WHERE inventario_identificador.iden_identificador = iden;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Inventario_Add`(IN ins int, in cant decimal(10,2), in sede int)
BEGIN

declare scant int;
declare sid int;

select
ifnull(inventario.id_inventario, 0),
count(inventario.fk_insumo)
into
sid,
scant
from
inventario
where inventario.fk_insumo = ins
and
inventario.sede_inventario = sede;

if scant = 0 then

INSERT INTO inventario
(`fk_insumo`,
`cantidad_inventario`,
`fecha_inventario`,
`sede_inventario`)
VALUES
(ins,
cant,
now(),
sede);
select 'saved', scant;

else
CALL Inventario_Update(sid, ins, cant, sede);
select 'updated', scant;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario_AddPrueba` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Inventario_AddPrueba`(IN ins int, in cant decimal(10,2), in sede int)
BEGIN

declare scant int;
declare sid int;

select
ifnull(inventario.id_inventario, 0),
count(inventario.fk_insumo)
into
sid,
scant
from
inventario
where inventario.fk_insumo = ins
and
inventario.sede_inventario = sede;

if scant = 0 then

INSERT INTO inventario
(`fk_insumo`,
`cantidad_inventario`,
`fecha_inventario`,
`sede_inventario`)
VALUES
(ins,
cant,
now(),
sede);
select 'saved', scant;

else
CALL Inventario_Update(sid, ins, cant, sede);
select 'updated', scant;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Inventario_Delete`(in id int)
BEGIN

DELETE FROM `inventario`
WHERE inventario.id_inventario = id;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Inventario_Get`()
BEGIN

SELECT
inventario.id_inventario,
insumos.nom_insumo,
inventario.cantidad_inventario,
concat(unidades.nomSI_unidad, '(', unidades.simbolo_unidad, ')') as unidad,
sedes.nom_sede
FROM
inventario
inner join insumos on insumos.id_insumo = inventario.fk_insumo
inner join unidades on unidades.id_unidad = insumos.fk_unidad
inner join sedes on sedes.id_sede = inventario.sede_inventario;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario_GetXId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Inventario_GetXId`(in id int)
BEGIN

SELECT `inventario`.`id_inventario`,
    `inventario`.`fk_insumo`,
    `inventario`.`cantidad_inventario`,
    `inventario`.`fecha_inventario`,
    `inventario`.`sede_inventario`,
    concat(unidades.nomSI_unidad, '(', unidades.simbolo_unidad, ')') as unidad
FROM `inventario`
inner join insumos on insumos.id_insumo = inventario.fk_insumo
inner join unidades on unidades.id_unidad = insumos.fk_unidad
where inventario.id_inventario = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario_GetXSede` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Inventario_GetXSede`(in idsede int)
BEGIN

SELECT
inventario.id_inventario,
insumos.nom_insumo,
inventario.cantidad_inventario,
concat(unidades.nomSI_unidad, '(', unidades.simbolo_unidad, ')') as unidad,
sedes.nom_sede
FROM
inventario
inner join insumos on insumos.id_insumo = inventario.fk_insumo
inner join unidades on unidades.id_unidad = insumos.fk_unidad
inner join sedes on sedes.id_sede = inventario.sede_inventario
where sedes.id_sede = idsede;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario_RestarCant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Inventario_RestarCant`(IN ins int, in cant decimal(10,2), in cantp int, in sede int)
BEGIN

declare scant int;
declare sid int;

select
(inventario.cantidad_inventario - (cant*cantp)),
inventario.id_inventario
into
scant,
sid
from
inventario
where inventario.fk_insumo = ins
and
inventario.sede_inventario = sede;

if scant <  0 then
CALL Inventario_Update(sid, ins, 0, sede);
else
CALL Inventario_Update(sid, ins, scant, sede);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Inventario_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Inventario_Update`(in id int, IN ins int, in cant decimal(10,2), in sede int)
BEGIN

UPDATE `inventario`
SET
`fk_insumo` = ins,
`cantidad_inventario` = cant,
`fecha_inventario` = now(),
`sede_inventario` = sede
WHERE `id_inventario` = id AND `sede_inventario` = sede;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Municipios_GetSel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Municipios_GetSel`(in iddep int)
BEGIN

select
municipios.id_municipio as id,
municipios.nom_municipio as nom
from municipios
where municipios.fk_departamento = iddep
order by municipios.nom_municipio asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProductosV_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ProductosV_Add`(IN pro int, IN cant int, IN des decimal(10,2), in fac varchar(45), in sede int, in web int)
BEGIN

insert into
productos_vendidos 
(
productos_vendidos.fk_producto,
productos_vendidos.cant_vendido,
productos_vendidos.desc_vendido,
productos_vendidos.fecha_vendido,
productos_vendidos.fk_factura,
productos_vendidos.fk_sede,
productos_vendidos.web
)values
(
pro,
cant,
des,
now(),
fac,
sede,
web
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProductosV_GetTotalVentas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `ProductosV_GetTotalVentas`(in sede int)
BEGIN

SELECT
ifnull(sum((productos.precio_producto-(productos.precio_producto*productos_vendidos.desc_vendido))*productos_vendidos.cant_vendido), 0) as total_ventas
FROM productos_vendidos
inner join productos on productos.id_producto = productos_vendidos.fk_producto
where date(productos_vendidos.fecha_vendido) = date(now())
AND
productos_vendidos.fk_sede = sede;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Productos_Add`(IN id int, IN nom varchar(45), in nomg varchar(1000), in precio double, in cat int, in descr varchar(4000))
BEGIN

insert into
productos
(
productos.id_producto,
productos.nom_producto,
productos.nomG_producto,
productos.precio_producto,
productos.fk_categoria,
productos.descripcion_producto
)
values
(
id,
nom,
nomG,
precio,
cat,
descr
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Productos_Delete`(IN `id` INT)
BEGIN


delete
from
productos
where
productos.id_producto = id;

delete
from
insumos_rel
where insumos_rel.fk_producto = id;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Productos_Get`()
BEGIN
SELECT
productos.id_producto,
productos.nom_producto,
productos.nomG_producto,
productos.precio_producto,
categorias.nomcategoria
FROM productos
INNER JOIN categorias on categorias.idcategoria = productos.fk_categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_GetNuevoId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Productos_GetNuevoId`()
BEGIN
SELECT 
max(id_producto)+1 as nid 
FROM 
productos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_GetXCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Productos_GetXCategoria`(IN `id` INT)
BEGIN



select

productos.id_producto,

productos.nom_producto,

categorias.nomcategoria,

productos.precio_producto,

productos.mprima_producto,

productos.comision_producto

from

productos

inner join categorias on categorias.idcategoria = productos.fk_categoria

where

productos.fk_categoria = id;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_GetXId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Productos_GetXId`(IN `id` INT)
BEGIN


select
productos.id_producto,
productos.nom_producto,
productos.nomG_producto,
productos.precio_producto,
productos.fk_categoria,
productos.descripcion_producto,
categorias.nomcategoria
from
productos
inner join categorias on categorias.idcategoria = productos.fk_categoria

where

productos.id_producto = id;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Productos_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Productos_Update`(in id int, in nom varchar(45), in nomg varchar(1000), in precio double, in cat int, in descr varchar(4000))
BEGIN

update
productos
set
productos.nom_producto = nom,
productos.nomG_producto = nomG,
productos.precio_producto = precio,
productos.fk_categoria = cat,
productos.descripcion_producto = descr
where productos.id_producto = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Relacion_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Relacion_Add`(IN idpro INT, IN idins INT, IN cant decimal(10,5))
BEGIN

insert
into
insumos_rel
(insumos_rel.fk_producto, insumos_rel.fk_insumo, insumos_rel.insumoUnidad_rel)
values
(idpro, idins, cant);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Relacion_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Relacion_Delete`(IN idpro INT, IN idins INT)
BEGIN

delete from
insumos_rel
where
insumos_rel.fk_producto = idpro
and
insumos_rel.fk_insumo = idins;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Relacion_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Relacion_Get`()
BEGIN

select
insumos.nom_insumo,
insumos_rel.insumoUnidad_rel as cantidad,
unidades.simbolo_unidad,
unidades.nomSI_unidad,
productos.nom_producto,
insumos_rel.fk_insumo,
insumos_rel.fk_producto
from insumos_rel
inner join insumos on insumos.id_insumo = insumos_rel.fk_insumo
inner join productos on productos.id_producto = insumos_rel.fk_producto
inner join unidades on unidades.id_unidad = insumos.fk_unidad;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Relacion_GetXProd` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Relacion_GetXProd`(IN `id` INT)
BEGIN

select
insumos.nom_insumo,
insumos_rel.insumoUnidad_rel,
unidades.simbolo_unidad,
unidades.nomSI_unidad,
insumos_rel.fk_insumo,
insumos_rel.fk_producto
from insumos_rel
inner join insumos on insumos.id_insumo = insumos_rel.fk_insumo
inner join unidades on unidades.id_unidad = insumos.fk_unidad
where insumos_rel.fk_producto = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Relacion_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Relacion_Update`(IN idpro INT, IN idins INT, IN cant decimal(10,5))
BEGIN

update
insumos_rel
set
insumos_rel.insumoUnidad_rel = cant
where
insumos_rel.fk_producto = idpro
and
insumos_rel.fk_insumo = idins;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Reportes_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Reportes_Add`(in iden varchar(45), in val double, in sede int)
BEGIN

declare scont int;

select
count(reportes.iden_reporte)
into
scont
from reportes
where reportes.iden_reporte = iden and reportes.fk_sede = sede;

if scont > 0 then
CALL`Reportes_Update`(iden, val, sede);
else
INSERT INTO `reportes`
(
`iden_reporte`,
`val_reporte`,
`fk_sede`,
`fecha_reporte`)
VALUES
(
iden,
val,
sede,
now()
);
end if;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Reportes_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Reportes_Get`()
BEGIN

SELECT `reportes`.`id_reportes`,
    `reportes`.`iden_reporte`,
    `reportes`.`val_reporte`,
    `reportes`.`fk_sede`,
    sedes.nom_sede,
    `reportes`.`fecha_reporte`
FROM `reportes`
inner join sedes on sedes.id_sede = reportes.fk_sede;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Reportes_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Reportes_Update`(in iden varchar(45), in val double, in sede int)
BEGIN

UPDATE `reportes`
SET
`val_reporte` = val
WHERE `iden_reporte` = iden and reportes.fk_sede = sede;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sedes_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Sedes_Add`(in nit varchar(100),
in nom varchar(45),
in dir varchar(100),
in mun int,
in tel1 double,
in tel2 double,
in tel3 double,
in longi varchar(100),
in lat varchar(100))
BEGIN

declare nid int;

select max(sedes.id_sede)+1 into nid
from sedes;


insert into
sedes
(
sedes.nit_sede,
sedes.nom_sede,
sedes.dir_sede,
sedes.fk_municipio,
sedes.tel1_sede,
sedes.tel2_sede,
sedes.tel3_sede,
sedes.long_sede,
sedes.lat_sede,
sedes.iden_sede
)
values
(
nit,
nom,
dir,
mun,
tel1,
tel2,
tel3,
longi,
lat,
concat('shsed', nid)
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sedes_Delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Sedes_Delete`(in id int)
BEGIN

delete from
sedes
where
sedes.id_sede = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sedes_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Sedes_Get`(in id int)
BEGIN

select
sedes.nom_sede,
sedes.dir_sede,
sedes.tel1_sede,
sedes.tel2_sede,
sedes.tel3_sede
from
sedes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sedes_GetSel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Sedes_GetSel`()
BEGIN

select
sedes.id_sede as id,
sedes.nom_sede as nom
from sedes
order by sedes.nom_sede asc;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sedes_GetXId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Sedes_GetXId`(in id int)
BEGIN

select
sedes.id_sede, 
sedes.nit_sede,
sedes.nom_sede,
sedes.dir_sede,
sedes.tel1_sede,
sedes.tel2_sede,
sedes.tel3_sede,
sedes.long_sede,
sedes.lat_sede
from
sedes
where
sedes.id_sede = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sedes_GetXNom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Sedes_GetXNom`(in nom varchar(45))
BEGIN

select
sedes.id_sede, 
sedes.nit_sede,
sedes.nom_sede,
sedes.dir_sede,
municipios.id_municipio,
municipios.nom_municipio,
departamentos.id_departamento,
departamentos.nom_departamento,
sedes.tel1_sede,
sedes.tel2_sede,
sedes.tel3_sede,
sedes.long_sede,
sedes.lat_sede,
sedes.iden_sede
from
sedes
inner join municipios on municipios.id_municipio = sedes.fk_municipio
inner join departamentos on departamentos.id_departamento = municipios.fk_departamento
where
sedes.nom_sede = nom collate 'utf8_spanish_ci';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Sedes_Update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Sedes_Update`(in id int,
in nit varchar(100),
in nom varchar(45),
in dir varchar(100),
in mun int,
in tel1 double,
in tel2 double,
in tel3 double,
in longi varchar(100),
in lat varchar(100))
BEGIN

update
sedes
set
sedes.nit_sede =nit,
sedes.nom_sede = nom,
sedes.dir_sede = dir,
sedes.fk_municipio = mun,
sedes.tel1_sede = tel1,
sedes.tel2_sede = tel2,
sedes.tel3_sede = tel3,
sedes.long_sede = longi,
sedes.lat_sede = lat
where
sedes.id_sede = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Unidades_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Unidades_Get`()
BEGIN

select
unidades.id_unidad as id,
unidades.nomSI_unidad as nom
from unidades;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Usuarios_Add`(IN `documento` DOUBLE, IN `nombres` VARCHAR(100), IN `apellidos` VARCHAR(100), IN `tel` VARCHAR(10), IN `email` VARCHAR(500), IN `pass` VARCHAR(45), IN `tipo` INT, IN `estado` INT)
BEGIN



INSERT INTO

usuarios

(usuarios.doc_usuario,

usuarios.nom_usuario,

usuarios.ape_usuario,

usuarios.tel_usuario,

usuarios.email_usuario,

usuarios.pass_usuario,

usuarios.tipo_usuario,

usuarios.estado_usuario)

values

(documento,

nombres collate 'utf8_spanish_ci',

apellidos collate 'utf8_spanish_ci',

tel collate 'utf8_spanish_ci',

email collate 'utf8_spanish_ci',

pass collate 'utf8_spanish_ci',

tipo,

estado);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios_Get` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Usuarios_Get`()
BEGIN



select

usuarios.id_usuario,

usuarios.doc_usuario,

usuarios.nom_usuario,

usuarios.ape_usuario,

usuarios.tel_usuario,

usuarios.email_usuario,

usuarios_tipo.nom_tipo,

comun_estados.nomcomun_estado

from

usuarios

inner join usuarios_tipo on usuarios_tipo.idusuarios_tipo = usuarios.tipo_usuario

inner join comun_estados on comun_estados.idcomun_estado = usuarios.estado_usuario

order by usuarios.id_usuario asc;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios_GetXId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Usuarios_GetXId`(IN `id` INT)
BEGIN



select

usuarios.id_usuario,

usuarios.doc_usuario,

usuarios.nom_usuario,

usuarios.ape_usuario,

usuarios.tel_usuario,

usuarios.email_usuario,

usuarios.pass_usuario,

usuarios.tipo_usuario,

usuarios.estado_usuario

from

usuarios

inner join usuarios_tipo on usuarios_tipo.idusuarios_tipo = usuarios.tipo_usuario

inner join comun_estados on comun_estados.idcomun_estado = usuarios.estado_usuario

where usuarios.id_usuario =id;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Usuarios_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Usuarios_Login`(IN `doc` DOUBLE, IN `pass` VARCHAR(45))
BEGIN

SET collation_connection = 'utf8_spanish_ci';



select

usuarios.id_usuario,

usuarios.doc_usuario,

usuarios.nom_usuario,

usuarios.ape_usuario,

usuarios.tel_usuario,

usuarios.email_usuario,

usuarios.tipo_usuario,

usuarios_tipo.nom_tipo,

usuarios.estado_usuario,

comun_estados.nomcomun_estado

from

usuarios

inner join usuarios_tipo on usuarios_tipo.idusuarios_tipo = usuarios.tipo_usuario

inner join comun_estados on comun_estados.idcomun_estado = usuarios.estado_usuario

where usuarios.doc_usuario = doc

and usuarios.pass_usuario= pass collate 'utf8_spanish_ci'

/*and (usuarios.estado_usuario = 1 or usuarios.estado_usuario = 3)

and (usuarios.tipo_usuario = 2 or usuarios.tipo_usuario = 3)*/

order by usuarios.id_usuario asc;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ventas_Add` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Ventas_Add`(
in cant int,
in fac varchar(100),
in sede int,
in consumo int,
in pago int,
in ent int,
in val double,
in web int
)
BEGIN

insert
into
ventas
(
ventas.cant_productos,
ventas.num_factura,
ventas.fk_sede,
ventas.fk_consumo,
ventas.fk_pago,
ventas.fk_entidad,
ventas.val_venta,
ventas.facha_venta,
ventas.web
)
values
(
cant,
fac,
sede,
consumo,
pago,
ent,
val,
now(),
web
);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Ventas_GetTotal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE  PROCEDURE `Ventas_GetTotal`(in sede int)
BEGIN

SELECT
ifnull(sum(ventas.val_venta),  0) as total_ventas
FROM ventas
where date(ventas.facha_venta) = date(now())
AND
ventas.fk_sede = sede;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-25  8:52:50
