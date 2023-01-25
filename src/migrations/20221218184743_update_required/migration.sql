/*
  Warnings:

  - Made the column `adminUserId` on table `RefCommunityAccount` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "RefCommunityAccount" DROP CONSTRAINT "RefCommunityAccount_adminUserId_fkey";

-- AlterTable
ALTER TABLE "RefCommunityAccount" ALTER COLUMN "adminUserId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "RefCommunityAccount" ADD CONSTRAINT "RefCommunityAccount_adminUserId_fkey" FOREIGN KEY ("adminUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
