/*
  Warnings:

  - A unique constraint covering the columns `[userId,bot]` on the table `BotSubscription` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "BotSubscription_userId_key";

-- CreateIndex
CREATE UNIQUE INDEX "BotSubscription_userId_bot_key" ON "BotSubscription"("userId", "bot");
