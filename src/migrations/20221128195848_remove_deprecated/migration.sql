/*
  Warnings:

  - You are about to drop the column `published` on the `Events` table. All the data in the column will be lost.
  - You are about to drop the column `published` on the `Quests` table. All the data in the column will be lost.
  - You are about to drop the column `categoryId` on the `Type` table. All the data in the column will be lost.
  - You are about to drop the column `hideFromExplore` on the `Type` table. All the data in the column will be lost.
  - You are about to drop the `Category` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Type" DROP CONSTRAINT "Type_categoryId_fkey";

-- AlterTable
ALTER TABLE "Events" DROP COLUMN "published";

-- AlterTable
ALTER TABLE "Quests" DROP COLUMN "published";

-- AlterTable
ALTER TABLE "Type" DROP COLUMN "categoryId",
DROP COLUMN "hideFromExplore";

-- DropTable
DROP TABLE "Category";
