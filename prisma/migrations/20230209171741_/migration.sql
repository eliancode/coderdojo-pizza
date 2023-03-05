/*
  Warnings:

  - Added the required column `quantity` to the `Pizza` table without a default value. This is not possible if the table is not empty.
  - Added the required column `size` to the `Pizza` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Pizza" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "quantity" TEXT NOT NULL,
    "size" TEXT NOT NULL
);
INSERT INTO "new_Pizza" ("id", "name") SELECT "id", "name" FROM "Pizza";
DROP TABLE "Pizza";
ALTER TABLE "new_Pizza" RENAME TO "Pizza";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
