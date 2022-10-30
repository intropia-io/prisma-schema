/*
  Warnings:

  - A unique constraint covering the columns `[metamask]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "User" ADD COLUMN     "metamask" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "User_metamask_key" ON "User"("metamask");
