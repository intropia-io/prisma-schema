/*
  Warnings:

  - You are about to drop the column `refAccountId` on the `User` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "User" DROP CONSTRAINT "User_refAccountId_fkey";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "refAccountId";

-- CreateTable
CREATE TABLE "_RefAccountToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_RefAccountToUser_AB_unique" ON "_RefAccountToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_RefAccountToUser_B_index" ON "_RefAccountToUser"("B");

-- AddForeignKey
ALTER TABLE "_RefAccountToUser" ADD CONSTRAINT "_RefAccountToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "RefAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RefAccountToUser" ADD CONSTRAINT "_RefAccountToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
