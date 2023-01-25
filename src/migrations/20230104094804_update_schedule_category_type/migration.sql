/*
  Warnings:

  - Changed the type of `entityType` on the `ScheduleTask` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- CreateEnum
CREATE TYPE "ScheduleCategoryType" AS ENUM ('INSTITUTE', 'EVENT', 'QUEST', 'USER');

-- AlterTable
ALTER TABLE "ScheduleTask" DROP COLUMN "entityType",
ADD COLUMN     "entityType" "ScheduleCategoryType" NOT NULL;
