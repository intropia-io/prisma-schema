/*
  Warnings:

  - The `textBlocks` column on the `Events` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `textBlocks` column on the `Organizations` table would be dropped and recreated. This will lead to data loss if there is data in the column.
  - The `textBlocks` column on the `Quests` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Events" DROP COLUMN "textBlocks",
ADD COLUMN     "textBlocks" JSONB[];

-- AlterTable
ALTER TABLE "Organizations" DROP COLUMN "textBlocks",
ADD COLUMN     "textBlocks" JSONB[];

-- AlterTable
ALTER TABLE "Quests" DROP COLUMN "textBlocks",
ADD COLUMN     "textBlocks" JSONB[];
