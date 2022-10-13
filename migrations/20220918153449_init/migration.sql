/*
  Warnings:

  - You are about to drop the column `reward` on the `Quests` table. All the data in the column will be lost.
  - You are about to drop the column `dynastyId` on the `Tags` table. All the data in the column will be lost.
  - You are about to drop the column `description` on the `Token` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Tags" DROP CONSTRAINT "Tags_dynastyId_fkey";

-- AlterTable
ALTER TABLE "Events" ADD COLUMN     "priseTo" INTEGER,
ADD COLUMN     "tokenId" TEXT;

-- AlterTable
ALTER TABLE "Quests" DROP COLUMN "reward",
ADD COLUMN     "rewardFrom" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "rewardTo" INTEGER;

-- AlterTable
ALTER TABLE "Tags" DROP COLUMN "dynastyId";

-- AlterTable
ALTER TABLE "Token" DROP COLUMN "description";

-- AddForeignKey
ALTER TABLE "Events" ADD CONSTRAINT "Events_tokenId_fkey" FOREIGN KEY ("tokenId") REFERENCES "Token"("id") ON DELETE CASCADE ON UPDATE CASCADE;
