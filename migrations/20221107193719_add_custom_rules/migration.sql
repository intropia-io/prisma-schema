-- CreateEnum
CREATE TYPE "CategoryType" AS ENUM ('INSTITUTE', 'EVENT', 'QUEST');

-- CreateEnum
CREATE TYPE "CustomRules" AS ENUM ('NO_REWARD');

-- AlterTable
ALTER TABLE "Type" ADD COLUMN     "categoryType" "CategoryType" NOT NULL DEFAULT 'INSTITUTE',
ADD COLUMN     "customRules" "CustomRules"[];
