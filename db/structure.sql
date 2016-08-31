CREATE TABLE "schema_migrations" ("version" varchar NOT NULL PRIMARY KEY);
CREATE TABLE "ar_internal_metadata" ("key" varchar NOT NULL PRIMARY KEY, "value" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "codes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "value" varchar NOT NULL, "description" varchar, "codeset_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_codes_on_codeset_id" ON "codes" ("codeset_id");
CREATE TABLE "languages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar, "description" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "groups" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "terminology_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_groups_on_terminology_id" ON "groups" ("terminology_id");
CREATE TABLE "terminologies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "version" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "concepts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "conceptid" varchar, "rubric" varchar, "language_id" integer, "group_id" integer, "terminology_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE INDEX "index_concepts_on_language_id" ON "concepts" ("language_id");
CREATE INDEX "index_concepts_on_group_id" ON "concepts" ("group_id");
CREATE INDEX "index_concepts_on_terminology_id" ON "concepts" ("terminology_id");
CREATE TABLE "issuers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "codesets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "openehrid" varchar, "externalid" varchar, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "issuer_id" integer);
CREATE INDEX "index_codesets_on_issuer_id" ON "codesets" ("issuer_id");
INSERT INTO schema_migrations (version) VALUES ('20160706124031'), ('20160706131413'), ('20160709110508'), ('20160709111939'), ('20160709112540'), ('20160710110953'), ('20160711083822'), ('20160721141724'), ('20160721145742');


