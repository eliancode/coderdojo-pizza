/*
  Warnings:

  - You are about to drop the column `pizzaName` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `size` on the `order` table. All the data in the column will be lost.
  - Added the required column `orderName` to the `order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderPrice` to the `order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `orderSize` to the `order` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "personName" TEXT NOT NULL,
    "orderName" TEXT NOT NULL,
    "orderSize" TEXT NOT NULL,
    "orderPrice" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "paid" BOOLEAN NOT NULL DEFAULT false
);
INSERT INTO "new_order" ("archived", "createdAt", "id", "personName") SELECT "archived", "createdAt", "id", "personName" FROM "order";
DROP TABLE "order";
ALTER TABLE "new_order" RENAME TO "order";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
