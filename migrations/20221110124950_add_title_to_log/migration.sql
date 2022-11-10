/*
  Warnings:

  - Added the required column `title` to the `Logs` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Events" ALTER COLUMN "typeId" DROP NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Logs" ADD COLUMN     "title" TEXT NOT NULL DEFAULT '';

-- AlterTable
ALTER TABLE "Organizations" ALTER COLUMN "typeId" DROP NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Quests" ALTER COLUMN "typeId" DROP NOT NULL,
ALTER COLUMN "dynastyId" DROP NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL;
