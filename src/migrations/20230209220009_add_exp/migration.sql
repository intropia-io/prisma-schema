-- CreateEnum
CREATE TYPE "RewardExperienceType" AS ENUM ('QUEST_APPLY', 'REF_QUEST_APPLY');

-- DropForeignKey
ALTER TABLE "RefLink" DROP CONSTRAINT "RefLink_createdById_fkey";

-- CreateTable
CREATE TABLE "RewardExperience" (
    "id" TEXT NOT NULL,
    "type" "RewardExperienceType" NOT NULL,
    "forWhatId" TEXT NOT NULL,
    "value" INTEGER NOT NULL,
    "userId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RewardExperience_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "RefLink" ADD CONSTRAINT "RefLink_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RewardExperience" ADD CONSTRAINT "RewardExperience_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
