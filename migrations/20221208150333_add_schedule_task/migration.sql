-- CreateEnum
CREATE TYPE "ScheduleTaskType" AS ENUM ('INFORM_BOT_HOURLY', 'INFORM_BOT_WEEKLY');

-- CreateTable
CREATE TABLE "ScheduleTask" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "entityType" "CategoryType" NOT NULL,
    "entityId" TEXT NOT NULL,
    "taskType" "ScheduleTaskType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ScheduleTask_pkey" PRIMARY KEY ("id")
);
