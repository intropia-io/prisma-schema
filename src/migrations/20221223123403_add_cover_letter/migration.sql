/*
  Warnings:

  - Added the required column `cvId` to the `RefCommunityApply` table without a default value. This is not possible if the table is not empty.
  - Added the required column `cvId` to the `RefUserApply` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "RefCommunityApply" ADD COLUMN     "cvId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "RefUserApply" ADD COLUMN     "cvId" TEXT NOT NULL;

-- CreateTable
CREATE TABLE "RefUserApplyCV" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefUserApplyCV_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefCommunityApplyCV" (
    "id" TEXT NOT NULL,
    "text" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefCommunityApplyCV_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "RefUserApply" ADD CONSTRAINT "RefUserApply_cvId_fkey" FOREIGN KEY ("cvId") REFERENCES "RefUserApplyCV"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefCommunityApply" ADD CONSTRAINT "RefCommunityApply_cvId_fkey" FOREIGN KEY ("cvId") REFERENCES "RefCommunityApplyCV"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
