-- AlterTable
ALTER TABLE "Tags" ADD COLUMN     "published" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Token" ADD COLUMN     "published" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "Type" ADD COLUMN     "published" BOOLEAN NOT NULL DEFAULT false;
