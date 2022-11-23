-- AlterTable
ALTER TABLE "QuestLinksStatusErrors" ADD COLUMN     "scheduleLogId" TEXT;

-- CreateTable
CREATE TABLE "ScheduleLog" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ScheduleLog_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "QuestLinksStatusErrors" ADD CONSTRAINT "QuestLinksStatusErrors_scheduleLogId_fkey" FOREIGN KEY ("scheduleLogId") REFERENCES "ScheduleLog"("id") ON DELETE CASCADE ON UPDATE CASCADE;
