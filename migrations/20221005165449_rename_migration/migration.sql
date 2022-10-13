/*
  Warnings:

  - You are about to drop the column `priseFrom` on the `Events` table. All the data in the column will be lost.
  - You are about to drop the column `priseTo` on the `Events` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Events"
RENAME COLUMN "priseFrom" TO "priceFrom";

ALTER TABLE "Events"
RENAME COLUMN "priseTo" TO "priceTo";