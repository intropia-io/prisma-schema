/*
  Warnings:

  - The `action` column on the `Logs` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- CreateEnum
CREATE TYPE "LogEntityAction" AS ENUM ('UNDEFINED', 'CREATE', 'UPDATE', 'ARCHIVE', 'PUBLISH', 'DELETE');

-- AlterTable
ALTER TABLE "Logs" DROP COLUMN "action",
ADD COLUMN     "action" "LogEntityAction" NOT NULL DEFAULT 'UNDEFINED';
