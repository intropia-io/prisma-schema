/*
  Warnings:

  - You are about to drop the column `userId` on the `RefCommunityAccount` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "RefCommunityAccount" DROP COLUMN "userId",
ADD COLUMN     "adminUserId" TEXT;

-- AddForeignKey
ALTER TABLE "RefCommunityAccount" ADD CONSTRAINT "RefCommunityAccount_adminUserId_fkey" FOREIGN KEY ("adminUserId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
