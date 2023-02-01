/*
  Warnings:

  - You are about to drop the column `link` on the `RefLink` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[shortId]` on the table `RefLink` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `shortId` to the `RefLink` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "RefLink" DROP COLUMN "link",
ADD COLUMN     "shortId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "RefLink_shortId_key" ON "RefLink"("shortId");
