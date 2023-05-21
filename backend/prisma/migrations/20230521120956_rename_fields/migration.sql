/*
  Warnings:

  - You are about to drop the column `orderName` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `orderPrice` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `orderSize` on the `order` table. All the data in the column will be lost.
  - Added the required column `articleName` to the `order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `articlePrice` to the `order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `articleSize` to the `order` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "personName" TEXT NOT NULL,
    "articleName" TEXT NOT NULL,
    "articleSize" TEXT NOT NULL,
    "articlePrice" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "paid" BOOLEAN NOT NULL DEFAULT false
);
INSERT INTO "new_order" ("archived", "createdAt", "id", "paid", "personName") SELECT "archived", "createdAt", "id", "paid", "personName" FROM "order";
DROP TABLE "order";
ALTER TABLE "new_order" RENAME TO "order";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
