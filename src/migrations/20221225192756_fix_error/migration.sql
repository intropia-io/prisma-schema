/*
  Warnings:

  - You are about to drop the column `refAccountId` on the `Dynasty` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Dynasty" DROP CONSTRAINT "Dynasty_refAccountId_fkey";

-- AlterTable
ALTER TABLE "Dynasty" DROP COLUMN "refAccountId";

-- CreateTable
CREATE TABLE "_DynastyToRefAccount" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_DynastyToRefAccount_AB_unique" ON "_DynastyToRefAccount"("A", "B");

-- CreateIndex
CREATE INDEX "_DynastyToRefAccount_B_index" ON "_DynastyToRefAccount"("B");

-- AddForeignKey
ALTER TABLE "_DynastyToRefAccount" ADD CONSTRAINT "_DynastyToRefAccount_A_fkey" FOREIGN KEY ("A") REFERENCES "Dynasty"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_DynastyToRefAccount" ADD CONSTRAINT "_DynastyToRefAccount_B_fkey" FOREIGN KEY ("B") REFERENCES "RefAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;
