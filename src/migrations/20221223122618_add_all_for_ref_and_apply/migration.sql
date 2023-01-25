-- CreateEnum
CREATE TYPE "ApplyStatus" AS ENUM ('NEW', 'VERIFIED', 'INVITE', 'SENT_OFFER', 'GET_OFFER', 'DECLINED_OFFER', 'TEST_PERIOD', 'APPOVED', 'DECLINED');

-- CreateTable
CREATE TABLE "RefUserLink" (
    "id" TEXT NOT NULL,
    "questId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefUserLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefUserLinkView" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "refUserLinkId" TEXT NOT NULL,

    CONSTRAINT "RefUserLinkView_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefUserApply" (
    "id" TEXT NOT NULL,
    "linkId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "status" "ApplyStatus" NOT NULL DEFAULT 'NEW',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefUserApply_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefCommunityLink" (
    "id" TEXT NOT NULL,
    "questId" TEXT NOT NULL,
    "communityId" TEXT NOT NULL,
    "link" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefCommunityLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefCommunityLinkView" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "refCommunityLinkId" TEXT NOT NULL,

    CONSTRAINT "RefCommunityLinkView_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RefCommunityApply" (
    "id" TEXT NOT NULL,
    "linkId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "status" "ApplyStatus" NOT NULL DEFAULT 'NEW',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RefCommunityApply_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "RefUserLink_userId_key" ON "RefUserLink"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "RefCommunityLink_communityId_key" ON "RefCommunityLink"("communityId");

-- AddForeignKey
ALTER TABLE "RefUserLink" ADD CONSTRAINT "RefUserLink_questId_fkey" FOREIGN KEY ("questId") REFERENCES "Quests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefUserLink" ADD CONSTRAINT "RefUserLink_userId_fkey" FOREIGN KEY ("userId") REFERENCES "RefUserAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefUserLinkView" ADD CONSTRAINT "RefUserLinkView_refUserLinkId_fkey" FOREIGN KEY ("refUserLinkId") REFERENCES "RefUserLink"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefUserApply" ADD CONSTRAINT "RefUserApply_linkId_fkey" FOREIGN KEY ("linkId") REFERENCES "RefUserLink"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefUserApply" ADD CONSTRAINT "RefUserApply_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefCommunityLink" ADD CONSTRAINT "RefCommunityLink_questId_fkey" FOREIGN KEY ("questId") REFERENCES "Quests"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefCommunityLink" ADD CONSTRAINT "RefCommunityLink_communityId_fkey" FOREIGN KEY ("communityId") REFERENCES "RefCommunityAccount"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefCommunityLinkView" ADD CONSTRAINT "RefCommunityLinkView_refCommunityLinkId_fkey" FOREIGN KEY ("refCommunityLinkId") REFERENCES "RefCommunityLink"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefCommunityApply" ADD CONSTRAINT "RefCommunityApply_linkId_fkey" FOREIGN KEY ("linkId") REFERENCES "RefCommunityLink"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RefCommunityApply" ADD CONSTRAINT "RefCommunityApply_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
