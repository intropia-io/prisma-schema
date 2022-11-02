/*
  Warnings:

  - You are about to drop the column `metamask` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[publicAddress]` on the table `User` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "User_metamask_key";

-- AlterTable
ALTER TABLE "User" DROP COLUMN "metamask",
ADD COLUMN     "nonce" INTEGER DEFAULT (floor(random()*(999999999-100000000+1))+100000000)::int,
ADD COLUMN     "publicAddress" TEXT;

-- CreateIndex
CREATE UNIQUE INDEX "User_publicAddress_key" ON "User"("publicAddress");
