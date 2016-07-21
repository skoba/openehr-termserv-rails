# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160721145742) do

  create_table "codes", force: :cascade do |t|
    t.string   "value",       null: false
    t.string   "description"
    t.integer  "codeset_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["codeset_id"], name: "index_codes_on_codeset_id"
  end

  create_table "codesets", force: :cascade do |t|
    t.string   "openehrid"
    t.string   "externalid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "issuer_id"
    t.index ["issuer_id"], name: "index_codesets_on_issuer_id"
  end

  create_table "concepts", force: :cascade do |t|
    t.string   "conceptid"
    t.string   "rubric"
    t.integer  "language_id"
    t.integer  "group_id"
    t.integer  "terminology_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["group_id"], name: "index_concepts_on_group_id"
    t.index ["language_id"], name: "index_concepts_on_language_id"
    t.index ["terminology_id"], name: "index_concepts_on_terminology_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "terminology_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["terminology_id"], name: "index_groups_on_terminology_id"
  end

  create_table "issuers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "terminologies", force: :cascade do |t|
    t.string   "name"
    t.string   "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
