-- CreateTable
CREATE TABLE "QuestLinksStatusErrors" (
    "id" TEXT NOT NULL,
    "questId" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "QuestLinksStatusErrors_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "QuestLinksStatusErrors" ADD CONSTRAINT "QuestLinksStatusErrors_questId_fkey" FOREIGN KEY ("questId") REFERENCES "Quests"("id") ON DELETE CASCADE ON UPDATE CASCADE;
