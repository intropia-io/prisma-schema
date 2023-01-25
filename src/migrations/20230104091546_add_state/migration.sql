-- CreateEnum
CREATE TYPE "SubsStatus" AS ENUM ('NEW', 'SUBSCRIBED', 'UNSUBSCRIBED', 'DELETED');

-- AlterEnum
ALTER TYPE "ScheduleTaskType" ADD VALUE 'INFORM_BOT_REALTIME';

-- AlterTable
ALTER TABLE "BotSubscription" ADD COLUMN     "status" "SubsStatus" NOT NULL DEFAULT 'NEW';
