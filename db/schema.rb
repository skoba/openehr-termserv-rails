# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2016_07_21_145742) do

  create_table "codes", force: :cascade do |t|
    t.string "value", null: false
    t.string "description"
    t.integer "codeset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["codeset_id"], name: "index_codes_on_codeset_id"
  end

  create_table "codesets", force: :cascade do |t|
    t.string "openehrid"
    t.string "externalid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "issuer_id"
    t.index ["issuer_id"], name: "index_codesets_on_issuer_id"
  end

  create_table "concepts", force: :cascade do |t|
    t.string "conceptid"
    t.string "rubric"
    t.integer "language_id"
    t.integer "group_id"
    t.integer "terminology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_concepts_on_group_id"
    t.index ["language_id"], name: "index_concepts_on_language_id"
    t.index ["terminology_id"], name: "index_concepts_on_terminology_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "terminology_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["terminology_id"], name: "index_groups_on_terminology_id"
  end

  create_table "issuers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terminologies", force: :cascade do |t|
    t.string "name"
    t.string "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "codes", "codesets"
  add_foreign_key "codesets", "issuers"
  add_foreign_key "concepts", "groups"
  add_foreign_key "concepts", "languages"
  add_foreign_key "concepts", "terminologies"
  add_foreign_key "groups", "terminologies"
end
