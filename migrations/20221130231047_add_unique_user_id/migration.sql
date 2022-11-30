/*
  Warnings:

  - A unique constraint covering the columns `[userId]` on the table `BotSubscription` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "BotSubscription_userId_key" ON "BotSubscription"("userId");
