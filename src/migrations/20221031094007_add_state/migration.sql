-- CreateEnum
CREATE TYPE "EntityStates" AS ENUM ('DRAFT', 'PUBLISHED', 'ARCHIVED');

-- AlterTable
ALTER TABLE "Events" ADD COLUMN     "state" "EntityStates" NOT NULL DEFAULT 'DRAFT';

-- AlterTable
ALTER TABLE "Organizations" ADD COLUMN     "state" "EntityStates" NOT NULL DEFAULT 'DRAFT';

-- AlterTable
ALTER TABLE "Quests" ADD COLUMN     "state" "EntityStates" NOT NULL DEFAULT 'DRAFT';
