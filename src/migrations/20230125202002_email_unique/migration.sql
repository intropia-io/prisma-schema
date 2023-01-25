/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `WhitelistSubscribes` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "WhitelistSubscribes_email_key" ON "WhitelistSubscribes"("email");
