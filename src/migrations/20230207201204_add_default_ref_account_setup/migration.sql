-- DropForeignKey
ALTER TABLE "RefAccount" DROP CONSTRAINT "RefAccount_adminUserId_fkey";

-- DropForeignKey
ALTER TABLE "RefLink" DROP CONSTRAINT "RefLink_refAccountId_fkey";

-- DropForeignKey
ALTER TABLE "RefLinkView" DROP CONSTRAINT "RefLinkView_refLinkId_fkey";

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "refAccountId" TEXT;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_refAccountId_fkey" FOREIGN KEY ("refAccountId") REFERENCES "RefAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefAccount" ADD CONSTRAINT "RefAccount_adminUserId_fkey" FOREIGN KEY ("adminUserId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefLink" ADD CONSTRAINT "RefLink_refAccountId_fkey" FOREIGN KEY ("refAccountId") REFERENCES "RefAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefLinkView" ADD CONSTRAINT "RefLinkView_refLinkId_fkey" FOREIGN KEY ("refLinkId") REFERENCES "RefLink"("id") ON DELETE CASCADE ON UPDATE CASCADE;
