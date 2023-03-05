/*
  Warnings:

  - You are about to drop the column `test` on the `Pizza` table. All the data in the column will be lost.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Pizza" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" INTEGER NOT NULL
);
INSERT INTO "new_Pizza" ("id", "name") SELECT "id", "name" FROM "Pizza";
DROP TABLE "Pizza";
ALTER TABLE "new_Pizza" RENAME TO "Pizza";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
