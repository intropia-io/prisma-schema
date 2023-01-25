/*
  Warnings:

  - You are about to drop the column `refCommunityAccountId` on the `Dynasty` table. All the data in the column will be lost.
  - You are about to drop the `RefCommunityAccount` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefCommunityApply` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefCommunityApplyCV` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefCommunityLink` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefCommunityLinkView` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefUserAccount` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefUserApply` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefUserApplyCV` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefUserLink` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `RefUserLinkView` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_RefCommunityAccountToUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "RefAccountType" AS ENUM ('PERSONAL', 'COMMUNITY');

-- DropForeignKey
ALTER TABLE "Dynasty" DROP CONSTRAINT "Dynasty_refCommunityAccountId_fkey";

-- DropForeignKey
ALTER TABLE "RefCommunityAccount" DROP CONSTRAINT "RefCommunityAccount_adminUserId_fkey";

-- DropForeignKey
ALTER TABLE "RefCommunityApply" DROP CONSTRAINT "RefCommunityApply_cvId_fkey";

-- DropForeignKey
ALTER TABLE "RefCommunityApply" DROP CONSTRAINT "RefCommunityApply_linkId_fkey";

-- DropForeignKey
ALTER TABLE "RefCommunityApply" DROP CONSTRAINT "RefCommunityApply_userId_fkey";

-- DropForeignKey
ALTER TABLE "RefCommunityLink" DROP CONSTRAINT "RefCommunityLink_communityId_fkey";

-- DropForeignKey
ALTER TABLE "RefCommunityLink" DROP CONSTRAINT "RefCommunityLink_questId_fkey";

-- DropForeignKey
ALTER TABLE "RefCommunityLinkView" DROP CONSTRAINT "RefCommunityLinkView_refCommunityLinkId_fkey";

-- DropForeignKey
ALTER TABLE "RefUserAccount" DROP CONSTRAINT "RefUserAccount_userId_fkey";

-- DropForeignKey
ALTER TABLE "RefUserApply" DROP CONSTRAINT "RefUserApply_cvId_fkey";

-- DropForeignKey
ALTER TABLE "RefUserApply" DROP CONSTRAINT "RefUserApply_linkId_fkey";

-- DropForeignKey
ALTER TABLE "RefUserApply" DROP CONSTRAINT "RefUserApply_userId_fkey";

-- DropForeignKey
ALTER TABLE "RefUserLink" DROP CONSTRAINT "RefUserLink_questId_fkey";

-- DropForeignKey
ALTER TABLE "RefUserLink" DROP CONSTRAINT "RefUserLink_userId_fkey";

-- DropForeignKey
ALTER TABLE "RefUserLinkView" DROP CONSTRAINT "RefUserLinkView_refUserLinkId_fkey";

-- DropForeignKey
ALTER TABLE "_RefCommunityAccountToUser" DROP CONSTRAINT "_RefCommunityAccountToUser_A_fkey";

-- DropForeignKey
ALTER TABLE "_RefCommunityAccountToUser" DROP CONSTRAINT "_RefCommunityAccountToUser_B_fkey";

-- AlterTable
ALTER TABLE "Dynasty" DROP COLUMN "refCommunityAccountId",
ADD COLUMN     "refAccountId" TEXT;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "refAccountId" TEXT;

-- DropTable
DROP TABLE "RefCommunityAccount";

-- DropTable
DROP TABLE "RefCommunityApply";

-- DropTable
DROP TABLE "RefCommunityApplyCV";

-- DropTable
DROP TABLE "RefCommunityLink";

-- DropTable
DROP TABLE "RefCommunityLinkView";

-- DropTable
DROP TABLE "RefUserAccount";

-- DropTable
DROP TABLE "RefUserApply";

-- DropTable
DROP TABLE "RefUserApplyCV";

-- DropTable
DROP TABLE "RefUserLink";

-- DropTable
DROP TABLE "RefUserLinkView";

-- DropTable
DROP TABLE "_RefCommunityAccountToUser";

-- CreateTable
CREATE TABLE "RefAccount" (
    "id" TEXT NOT NULL,
    "adminUserId" TEXT NOT NULL,
    "avatar" TEXT,
    "title" TEXT,
    "type" "RefAccountType" NOT NULL DEFAULT 'PERSONAL',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefLink" (
    "id" TEXT NOT NULL,
    "questId" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "createdById" TEXT NOT NULL,
    "refAccountId" TEXT NOT NULL,

    CONSTRAINT "RefLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefLinkView" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "refLinkId" TEXT NOT NULL,

    CONSTRAINT "RefLinkView_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefApply" (
    "id" TEXT NOT NULL,
    "linkId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "cvId" TEXT NOT NULL,
    "status" "ApplyStatus" NOT NULL DEFAULT 'NEW',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefApply_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefApplyCV" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefApplyCV_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Dynasty" ADD CONSTRAINT "Dynasty_refAccountId_fkey" FOREIGN KEY ("refAccountId") REFERENCES "RefAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_refAccountId_fkey" FOREIGN KEY ("refAccountId") REFERENCES "RefAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefAccount" ADD CONSTRAINT "RefAccount_adminUserId_fkey" FOREIGN KEY ("adminUserId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefLink" ADD CONSTRAINT "RefLink_questId_fkey" FOREIGN KEY ("questId") REFERENCES "Quests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefLink" ADD CONSTRAINT "RefLink_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefLink" ADD CONSTRAINT "RefLink_refAccountId_fkey" FOREIGN KEY ("refAccountId") REFERENCES "RefAccount"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefLinkView" ADD CONSTRAINT "RefLinkView_refLinkId_fkey" FOREIGN KEY ("refLinkId") REFERENCES "RefLink"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefApply" ADD CONSTRAINT "RefApply_linkId_fkey" FOREIGN KEY ("linkId") REFERENCES "RefLink"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefApply" ADD CONSTRAINT "RefApply_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefApply" ADD CONSTRAINT "RefApply_cvId_fkey" FOREIGN KEY ("cvId") REFERENCES "RefApplyCV"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
