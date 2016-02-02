# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160201011316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "weighted_words", force: :cascade do |t|
    t.integer  "word_search_id", null: false
    t.string   "word",           null: false
    t.integer  "frequency",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weighted_words", ["word_search_id"], name: "index_weighted_words_on_word_search_id", using: :btree

  create_table "word_searches", force: :cascade do |t|
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "word_searches", ["url"], name: "index_word_searches_on_url", unique: true, using: :btree

end
