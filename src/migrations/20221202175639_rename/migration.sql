/*
  Warnings:

  - You are about to drop the column `fisrtName` on the `BotSubscription` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "BotSubscription" DROP COLUMN "fisrtName",
ADD COLUMN     "firstName" TEXT;
