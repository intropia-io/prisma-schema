/*
  Warnings:

  - You are about to drop the `Session` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Session" DROP CONSTRAINT "Session_userId_fkey";

-- AlterTable
ALTER TABLE "Dynasty" ADD COLUMN     "userId" TEXT;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "contactEmail" TEXT,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT,
ADD COLUMN     "firstName" TEXT,
ADD COLUMN     "githubLink" TEXT,
ADD COLUMN     "lastName" TEXT,
ADD COLUMN     "resumeLink" TEXT,
ADD COLUMN     "telegram" TEXT,
ADD COLUMN     "twitterLink" TEXT,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- DropTable
DROP TABLE "Session";

-- CreateTable
CREATE TABLE "UserAggrigation" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "email" TEXT,
    "image" TEXT,
    "firstName" TEXT,
    "lastName" TEXT,
    "description" TEXT,
    "resumeLink" TEXT,
    "contactEmail" TEXT,
    "twitterLink" TEXT,
    "githubLink" TEXT,
    "telegram" TEXT,
    "publicAddress" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserAggrigation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "UserAggrigation_email_key" ON "UserAggrigation"("email");

-- AddForeignKey
ALTER TABLE "Dynasty" ADD CONSTRAINT "Dynasty_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserAggrigation" ADD CONSTRAINT "UserAggrigation_id_fkey" FOREIGN KEY ("id") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
