-- CreateEnum
CREATE TYPE "ShortUrlType" AS ENUM ('INSTITUTE', 'EVENT', 'QUEST', 'PROFILE');

-- AlterTable
ALTER TABLE "Dynasty" ADD COLUMN     "refCommunityAccountId" TEXT;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "refUserId" TEXT;

-- CreateTable
CREATE TABLE "RefUserAccount" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefUserAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefCommunityAccount" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "avatar" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefCommunityAccount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ShortLink" (
    "id" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "entityType" "ShortUrlType" NOT NULL DEFAULT 'INSTITUTE',
    "shortUrl" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ShortLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_RefCommunityAccountToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "RefUserAccount_userId_key" ON "RefUserAccount"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "_RefCommunityAccountToUser_AB_unique" ON "_RefCommunityAccountToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_RefCommunityAccountToUser_B_index" ON "_RefCommunityAccountToUser"("B");

-- AddForeignKey
ALTER TABLE "Dynasty" ADD CONSTRAINT "Dynasty_refCommunityAccountId_fkey" FOREIGN KEY ("refCommunityAccountId") REFERENCES "RefCommunityAccount"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefUserAccount" ADD CONSTRAINT "RefUserAccount_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RefCommunityAccountToUser" ADD CONSTRAINT "_RefCommunityAccountToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "RefCommunityAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RefCommunityAccountToUser" ADD CONSTRAINT "_RefCommunityAccountToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
