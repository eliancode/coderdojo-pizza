/*
  Warnings:

  - You are about to drop the column `Pizzaname` on the `Pizza` table. All the data in the column will be lost.
  - You are about to drop the column `personName` on the `Pizza` table. All the data in the column will be lost.
  - You are about to drop the column `quantity` on the `Pizza` table. All the data in the column will be lost.
  - You are about to drop the column `size` on the `Pizza` table. All the data in the column will be lost.
  - Added the required column `name` to the `Pizza` table without a default value. This is not possible if the table is not empty.
  - Added the required column `test` to the `Pizza` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Pizza" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" INTEGER NOT NULL,
    "test" INTEGER NOT NULL
);
INSERT INTO "new_Pizza" ("id") SELECT "id" FROM "Pizza";
DROP TABLE "Pizza";
ALTER TABLE "new_Pizza" RENAME TO "Pizza";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
