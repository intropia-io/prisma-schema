/*
  Warnings:

  - The values [APPOVED] on the enum `ApplyStatus` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "ApplyStatus_new" AS ENUM ('NEW', 'VERIFIED', 'INVITE', 'SENT_OFFER', 'GET_OFFER', 'DECLINED_OFFER', 'TEST_PERIOD', 'APPROVED', 'DECLINED');
ALTER TABLE "RefApply" ALTER COLUMN "status" DROP DEFAULT;
ALTER TABLE "RefApply" ALTER COLUMN "status" TYPE "ApplyStatus_new" USING ("status"::text::"ApplyStatus_new");
ALTER TYPE "ApplyStatus" RENAME TO "ApplyStatus_old";
ALTER TYPE "ApplyStatus_new" RENAME TO "ApplyStatus";
DROP TYPE "ApplyStatus_old";
ALTER TABLE "RefApply" ALTER COLUMN "status" SET DEFAULT 'NEW';
COMMIT;
