/*
  Warnings:

  - You are about to drop the `RefApply` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefApplyCV` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "RefApply" DROP CONSTRAINT "RefApply_cvId_fkey";

-- DropForeignKey
ALTER TABLE "RefApply" DROP CONSTRAINT "RefApply_linkId_fkey";

-- DropForeignKey
ALTER TABLE "RefApply" DROP CONSTRAINT "RefApply_userId_fkey";

-- DropForeignKey
ALTER TABLE "RefLink" DROP CONSTRAINT "RefLink_questId_fkey";

-- DropTable
DROP TABLE "RefApply";

-- DropTable
DROP TABLE "RefApplyCV";

-- CreateTable
CREATE TABLE "Apply" (
    "id" TEXT NOT NULL,
    "linkId" TEXT,
    "questId" TEXT,
    "userId" TEXT NOT NULL,
    "cvId" TEXT NOT NULL,
    "status" "ApplyStatus" NOT NULL DEFAULT 'NEW',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Apply_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApplyCV" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ApplyCV_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WhitelistSubscribes" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WhitelistSubscribes_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "RefLink" ADD CONSTRAINT "RefLink_questId_fkey" FOREIGN KEY ("questId") REFERENCES "Quests"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Apply" ADD CONSTRAINT "Apply_linkId_fkey" FOREIGN KEY ("linkId") REFERENCES "RefLink"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Apply" ADD CONSTRAINT "Apply_questId_fkey" FOREIGN KEY ("questId") REFERENCES "Quests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Apply" ADD CONSTRAINT "Apply_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Apply" ADD CONSTRAINT "Apply_cvId_fkey" FOREIGN KEY ("cvId") REFERENCES "ApplyCV"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
