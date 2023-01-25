-- AlterTable
ALTER TABLE "Admin" RENAME CONSTRAINT "User_pkey" TO "Admin_pkey";

-- AlterTable
ALTER TABLE "AdminRoles" RENAME CONSTRAINT "UserRoles_pkey" TO "AdminRoles_pkey";

-- RenameForeignKey
ALTER TABLE "Admin" RENAME CONSTRAINT "User_roleId_fkey" TO "Admin_roleId_fkey";

-- RenameIndex
ALTER INDEX "User_email_key" RENAME TO "Admin_email_key";
