/*
  Warnings:

  - You are about to drop the column `botSubscriptionId` on the `Dynasty` table. All the data in the column will be lost.
  - You are about to drop the column `botSubscriptionEventId` on the `Type` table. All the data in the column will be lost.
  - You are about to drop the column `botSubscriptionQuestId` on the `Type` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Dynasty" DROP CONSTRAINT "Dynasty_botSubscriptionId_fkey";

-- DropForeignKey
ALTER TABLE "Type" DROP CONSTRAINT "Type_botSubscriptionEventId_fkey";

-- DropForeignKey
ALTER TABLE "Type" DROP CONSTRAINT "Type_botSubscriptionQuestId_fkey";

-- AlterTable
ALTER TABLE "Dynasty" DROP COLUMN "botSubscriptionId";

-- AlterTable
ALTER TABLE "Type" DROP COLUMN "botSubscriptionEventId",
DROP COLUMN "botSubscriptionQuestId";

-- CreateTable
CREATE TABLE "_BotSubscriptionToDynasty" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_questTypes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_eventTypes" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_BotSubscriptionToDynasty_AB_unique" ON "_BotSubscriptionToDynasty"("A", "B");

-- CreateIndex
CREATE INDEX "_BotSubscriptionToDynasty_B_index" ON "_BotSubscriptionToDynasty"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_questTypes_AB_unique" ON "_questTypes"("A", "B");

-- CreateIndex
CREATE INDEX "_questTypes_B_index" ON "_questTypes"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_eventTypes_AB_unique" ON "_eventTypes"("A", "B");

-- CreateIndex
CREATE INDEX "_eventTypes_B_index" ON "_eventTypes"("B");

-- AddForeignKey
ALTER TABLE "_BotSubscriptionToDynasty" ADD CONSTRAINT "_BotSubscriptionToDynasty_A_fkey" FOREIGN KEY ("A") REFERENCES "BotSubscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_BotSubscriptionToDynasty" ADD CONSTRAINT "_BotSubscriptionToDynasty_B_fkey" FOREIGN KEY ("B") REFERENCES "Dynasty"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_questTypes" ADD CONSTRAINT "_questTypes_A_fkey" FOREIGN KEY ("A") REFERENCES "BotSubscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_questTypes" ADD CONSTRAINT "_questTypes_B_fkey" FOREIGN KEY ("B") REFERENCES "Type"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_eventTypes" ADD CONSTRAINT "_eventTypes_A_fkey" FOREIGN KEY ("A") REFERENCES "BotSubscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_eventTypes" ADD CONSTRAINT "_eventTypes_B_fkey" FOREIGN KEY ("B") REFERENCES "Type"("id") ON DELETE CASCADE ON UPDATE CASCADE;
