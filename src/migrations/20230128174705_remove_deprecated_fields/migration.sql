/*
  Warnings:

  - You are about to drop the column `published` on the `Dynasty` table. All the data in the column will be lost.
  - You are about to drop the column `isOnline` on the `Events` table. All the data in the column will be lost.
  - You are about to drop the column `published` on the `Tags` table. All the data in the column will be lost.
  - You are about to drop the column `published` on the `Token` table. All the data in the column will be lost.
  - You are about to drop the column `published` on the `Type` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Dynasty" DROP COLUMN "published";

-- AlterTable
ALTER TABLE "Events" DROP COLUMN "isOnline";

-- AlterTable
ALTER TABLE "Tags" DROP COLUMN "published";

-- AlterTable
ALTER TABLE "Token" DROP COLUMN "published";

-- AlterTable
ALTER TABLE "Type" DROP COLUMN "published";
