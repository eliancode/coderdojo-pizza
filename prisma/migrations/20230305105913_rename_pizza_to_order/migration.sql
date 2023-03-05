/*
  Warnings:

  - You are about to drop the `pizza` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "pizza";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "personName" TEXT NOT NULL,
    "pizzaName" TEXT NOT NULL,
    "quantity" TEXT NOT NULL,
    "size" TEXT NOT NULL
);
