/*
  Warnings:

  - You are about to drop the column `tokenReward` on the `Quests` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Quests" DROP COLUMN "tokenReward",
ADD COLUMN     "tokenRewardId" TEXT;

-- AddForeignKey
ALTER TABLE "Quests" ADD CONSTRAINT "Quests_tokenRewardId_fkey" FOREIGN KEY ("tokenRewardId") REFERENCES "Token"("id") ON DELETE CASCADE ON UPDATE CASCADE;
