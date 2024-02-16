-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) NOT NULL,
    `area` VARCHAR(45) NOT NULL,
    `password` VARCHAR(45) NOT NULL,
    `rol` VARCHAR(45) NOT NULL,
    `usuario` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
