-- CreateEnum
CREATE TYPE "RestUserType" AS ENUM ('INHOUSE', 'OUTHOUSE');

-- AlterTable
ALTER TABLE "RestUser" ADD COLUMN     "type" "RestUserType" NOT NULL DEFAULT 'OUTHOUSE';
