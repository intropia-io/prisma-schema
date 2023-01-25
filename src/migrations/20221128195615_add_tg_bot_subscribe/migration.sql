-- CreateEnum
CREATE TYPE "ReffProgram" AS ENUM ('SUBSCRIBED', 'UNSUBSCRIBED');

-- CreateEnum
CREATE TYPE "UpdateFrequency" AS ENUM ('WEEKLY', 'REALTIME');

-- AlterTable
ALTER TABLE "Dynasty" ADD COLUMN     "botSubscriptionId" TEXT;

-- AlterTable
ALTER TABLE "Type" ADD COLUMN     "botSubscriptionEventId" TEXT,
ADD COLUMN     "botSubscriptionQuestId" TEXT;

-- CreateTable
CREATE TABLE "BotSubscription" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "fisrtName" TEXT,
    "lastName" TEXT,
    "username" TEXT,
    "reffProgram" "ReffProgram" NOT NULL,
    "updateFrequency" "UpdateFrequency" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BotSubscription_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Dynasty" ADD CONSTRAINT "Dynasty_botSubscriptionId_fkey" FOREIGN KEY ("botSubscriptionId") REFERENCES "BotSubscription"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Type" ADD CONSTRAINT "Type_botSubscriptionQuestId_fkey" FOREIGN KEY ("botSubscriptionQuestId") REFERENCES "BotSubscription"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Type" ADD CONSTRAINT "Type_botSubscriptionEventId_fkey" FOREIGN KEY ("botSubscriptionEventId") REFERENCES "BotSubscription"("id") ON DELETE SET NULL ON UPDATE CASCADE;
