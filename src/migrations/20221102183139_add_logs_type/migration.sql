/*
  Warnings:

  - The `type` column on the `Logs` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "LogEntity" AS ENUM ('UNDEFINED', 'INSTITUTE', 'QUEST', 'EVENT', 'DYNASTY', 'TOKEN', 'TAG', 'TYPE', 'CATEGORY', 'SUGGEST', 'IMAGE', 'REPORT', 'REPORT_TYPE', 'ERROR');

-- AlterTable
ALTER TABLE "Logs" DROP COLUMN "type",
ADD COLUMN     "type" "LogEntity" NOT NULL DEFAULT 'UNDEFINED';
