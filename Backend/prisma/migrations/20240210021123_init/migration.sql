/*
  Warnings:

  - You are about to drop the `user` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE `user`;

-- CreateTable
CREATE TABLE `Usuario` (
    `idUsuario` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) NULL,
    `area` VARCHAR(45) NULL,
    `password` VARCHAR(45) NOT NULL,
    `rol` ENUM('estandar', 'administrador', 'requisicion') NOT NULL DEFAULT 'estandar',
    `usuario` VARCHAR(45) NOT NULL,
    `createAt` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),

    UNIQUE INDEX `Usuario_usuario_key`(`usuario`),
    PRIMARY KEY (`idUsuario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Area` (
    `idArea` INTEGER NOT NULL AUTO_INCREMENT,
    `descripcion` VARCHAR(100) NULL,
    `empleadoId` INTEGER NOT NULL,

    UNIQUE INDEX `Area_empleadoId_key`(`empleadoId`),
    PRIMARY KEY (`idArea`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Escolaridad` (
    `idEscolaridad` INTEGER NOT NULL AUTO_INCREMENT,
    `escolaridad` ENUM('primaria', 'secundaria', 'preparatoria', 'tecnico_universitario', 'licenciatura', 'maestria', 'doctorado') NULL,
    `empleadoId` INTEGER NOT NULL,

    UNIQUE INDEX `Escolaridad_empleadoId_key`(`empleadoId`),
    PRIMARY KEY (`idEscolaridad`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Estado_Civil` (
    `idEstadoCivil` INTEGER NOT NULL AUTO_INCREMENT,
    `estado` ENUM('soltero', 'casado', 'divorciado', 'viudo', 'juntado') NULL,
    `empleadoId` INTEGER NOT NULL,

    UNIQUE INDEX `Estado_Civil_empleadoId_key`(`empleadoId`),
    PRIMARY KEY (`idEstadoCivil`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Empleado` (
    `idEmpleado` INTEGER NOT NULL AUTO_INCREMENT,
    `aPaterno` VARCHAR(100) NULL,
    `aMaterno` VARCHAR(100) NULL,
    `nombre` VARCHAR(100) NULL,
    `sexo` VARCHAR(45) NULL,
    `fechaNacimiento` DATE NULL,
    `fechaIngreso` DATE NULL,
    `cargo` VARCHAR(100) NULL,
    `sueldoBruto` DOUBLE NOT NULL,
    `sueldoNeto` DOUBLE NOT NULL,
    `regimen` VARCHAR(100) NULL,
    `observaciones` VARCHAR(255) NULL,
    `status` ENUM('activo', 'baja') NOT NULL DEFAULT 'baja',
    `createAt` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `llave` INTEGER NULL,
    `imagenEmpleado` VARCHAR(255) NULL,
    `usuarioId` INTEGER NOT NULL,

    PRIMARY KEY (`idEmpleado`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Formacion` (
    `idFormacion` INTEGER NOT NULL AUTO_INCREMENT,
    `nombreArchivo` VARCHAR(100) NOT NULL,
    `nombreImagen` VARCHAR(100) NOT NULL,
    `fechaCarga` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `createAt` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `empleadoId` INTEGER NOT NULL,

    PRIMARY KEY (`idFormacion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `incapacidad` (
    `idIncapacidad` INTEGER NOT NULL AUTO_INCREMENT,
    `observaciones` VARCHAR(200) NOT NULL,
    `nombreImagen` VARCHAR(100) NOT NULL,
    `fechaIncapacidad` DATE NULL,
    `diasIncapacitado` INTEGER NOT NULL,
    `tipo` VARCHAR(100) NOT NULL,
    `createAt` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `empleadoId` INTEGER NOT NULL,

    PRIMARY KEY (`idIncapacidad`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Permiso` (
    `idPermiso` INTEGER NOT NULL AUTO_INCREMENT,
    `observaciones` VARCHAR(200) NOT NULL,
    `nombreImagen` VARCHAR(100) NOT NULL,
    `fechaPermiso` DATE NULL,
    `fechaRegreso` DATE NULL,
    `createAt` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `empleadoId` INTEGER NOT NULL,

    PRIMARY KEY (`idPermiso`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Vacaciones` (
    `idVacaciones` INTEGER NOT NULL AUTO_INCREMENT,
    `periodo` VARCHAR(200) NOT NULL,
    `nombreImagen` VARCHAR(100) NOT NULL,
    `year` VARCHAR(100) NOT NULL,
    `fechaInicio` DATE NULL,
    `fechaTermino` DATE NULL,
    `integracion` DATE NULL,
    `createAt` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `empleadoId` INTEGER NOT NULL,

    PRIMARY KEY (`idVacaciones`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DiaEconomico` (
    `idDiaEconomico` INTEGER NOT NULL AUTO_INCREMENT,
    `observaciones` VARCHAR(200) NOT NULL,
    `nombreImagen` VARCHAR(100) NOT NULL,
    `fechaDias` DATE NULL,
    `fechaDiasRestantes` DATE NULL,
    `diasTotales` INTEGER NULL,
    `createAt` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `empleadoId` INTEGER NOT NULL,

    PRIMARY KEY (`idDiaEconomico`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Requisicion` (
    `idRequisicion` INTEGER NOT NULL AUTO_INCREMENT,
    `material` VARCHAR(255) NULL DEFAULT 'No agrego contenido el usuario',
    `nivelImportancia` VARCHAR(255) NULL DEFAULT 'No agrego contenido el usuario',
    `createAt` DATE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `usuarioId` INTEGER NOT NULL,

    PRIMARY KEY (`idRequisicion`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Area` ADD CONSTRAINT `Area_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `Empleado`(`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Escolaridad` ADD CONSTRAINT `Escolaridad_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `Empleado`(`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Estado_Civil` ADD CONSTRAINT `Estado_Civil_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `Empleado`(`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Empleado` ADD CONSTRAINT `Empleado_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Formacion` ADD CONSTRAINT `Formacion_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `Empleado`(`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `incapacidad` ADD CONSTRAINT `incapacidad_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `Empleado`(`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Permiso` ADD CONSTRAINT `Permiso_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `Empleado`(`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Vacaciones` ADD CONSTRAINT `Vacaciones_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `Empleado`(`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `DiaEconomico` ADD CONSTRAINT `DiaEconomico_empleadoId_fkey` FOREIGN KEY (`empleadoId`) REFERENCES `Empleado`(`idEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Requisicion` ADD CONSTRAINT `Requisicion_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
