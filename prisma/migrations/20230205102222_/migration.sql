/*
  Warnings:

  - Added the required column `name` to the `Pizza` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Pizza" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);
INSERT INTO "new_Pizza" ("id") SELECT "id" FROM "Pizza";
DROP TABLE "Pizza";
ALTER TABLE "new_Pizza" RENAME TO "Pizza";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;