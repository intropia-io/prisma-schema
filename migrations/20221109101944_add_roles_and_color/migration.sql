/*
  Warnings:

  - You are about to drop the column `roleId` on the `Admin` table. All the data in the column will be lost.
  - You are about to drop the `AdminRoles` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "AdminRole" AS ENUM ('ADMIN', 'MANAGER', 'USER');

-- DropForeignKey
ALTER TABLE "Admin" DROP CONSTRAINT "Admin_roleId_fkey";

-- AlterTable
ALTER TABLE "Admin" DROP COLUMN "roleId",
ADD COLUMN     "color" TEXT NOT NULL DEFAULT '#060a1b',
ADD COLUMN     "role" "AdminRole" NOT NULL DEFAULT 'USER';

-- DropTable
DROP TABLE "AdminRoles";
