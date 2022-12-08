-- CreateEnum
CREATE TYPE "ScheduleTaskStatus" AS ENUM ('NEW', 'COMPLETE');

-- AlterTable
ALTER TABLE "ScheduleTask" ADD COLUMN     "status" "ScheduleTaskStatus" NOT NULL DEFAULT 'NEW';
