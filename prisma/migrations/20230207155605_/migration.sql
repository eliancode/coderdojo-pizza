/*
  Warnings:

  - You are about to drop the column `name` on the `Pizza` table. All the data in the column will be lost.
  - Added the required column `Pizzaname` to the `Pizza` table without a default value. This is not possible if the table is not empty.
  - Added the required column `personName` to the `Pizza` table without a default value. This is not possible if the table is not empty.
  - Added the required column `quantity` to the `Pizza` table without a default value. This is not possible if the table is not empty.
  - Added the required column `size` to the `Pizza` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Pizza" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Pizzaname" TEXT NOT NULL,
    "personName" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL
);
INSERT INTO "new_Pizza" ("id") SELECT "id" FROM "Pizza";
DROP TABLE "Pizza";
ALTER TABLE "new_Pizza" RENAME TO "Pizza";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
