-- CreateTable
CREATE TABLE "RewardExperiencePrice" (
    "id" TEXT NOT NULL,
    "type" "RewardExperienceType" NOT NULL,
    "value" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RewardExperiencePrice_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "RewardExperiencePrice_type_key" ON "RewardExperiencePrice"("type");
