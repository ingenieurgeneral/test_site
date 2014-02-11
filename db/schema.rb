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

ActiveRecord::Schema.define(version: 20140210134711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cardrelationships", force: true do |t|
    t.integer  "card_id"
    t.integer  "user_id"
    t.integer  "score"
    t.datetime "time_spent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cardrelationships", ["card_id", "user_id"], name: "index_cardrelationships_on_card_id_and_user_id", unique: true, using: :btree
  add_index "cardrelationships", ["card_id"], name: "index_cardrelationships_on_card_id", using: :btree
  add_index "cardrelationships", ["user_id"], name: "index_cardrelationships_on_user_id", using: :btree

  create_table "deckrelationships", force: true do |t|
    t.integer  "followed_deck_id"
    t.integer  "follower_id"
    t.integer  "individual_rating"
    t.integer  "personal_score"
    t.datetime "time_spent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deckrelationships", ["followed_deck_id", "follower_id"], name: "index_deckrelationships_on_followed_deck_id_and_follower_id", unique: true, using: :btree
  add_index "deckrelationships", ["followed_deck_id"], name: "index_deckrelationships_on_followed_deck_id", using: :btree
  add_index "deckrelationships", ["follower_id"], name: "index_deckrelationships_on_follower_id", using: :btree

  create_table "decks", force: true do |t|
    t.integer  "author_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "is_published",                default: false
    t.boolean  "is_featured",                 default: false
    t.string   "language"
    t.string   "country"
    t.string   "level"
    t.string   "subject"
    t.string   "chapter"
    t.float    "price"
    t.integer  "rating"
    t.integer  "difficulty"
    t.integer  "questionnaire_answers_count", default: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flashcards", force: true do |t|
    t.integer  "deck_id"
    t.text     "question"
    t.text     "answer"
    t.boolean  "is_featured", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "flashcards", ["deck_id"], name: "index_flashcards_on_deck_id", using: :btree

  create_table "lessons", force: true do |t|
    t.integer  "deck_id"
    t.string   "title"
    t.text     "content"
    t.boolean  "is_featured", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["deck_id"], name: "index_lessons_on_deck_id", using: :btree

  create_table "questionnaire_answers", force: true do |t|
    t.integer  "questionnaire_id"
    t.text     "answer"
    t.boolean  "is_right",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questionnaire_answers", ["questionnaire_id"], name: "index_questionnaire_answers_on_questionnaire_id", using: :btree

  create_table "questionnaires", force: true do |t|
    t.integer  "deck_id"
    t.text     "question"
    t.boolean  "is_featured"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questionnaires", ["deck_id"], name: "index_questionnaires_on_deck_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "language"
    t.string   "short_bio"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "birth_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
