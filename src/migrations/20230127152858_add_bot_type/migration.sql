-- CreateEnum
CREATE TYPE "botType" AS ENUM ('tr3butor', 'intropia');

-- AlterTable
ALTER TABLE "BotSubscription" ADD COLUMN     "bot" "botType" NOT NULL DEFAULT 'tr3butor';
