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

ActiveRecord::Schema.define(version: 2021_07_05_193443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "detail_types", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pokemon_id", null: false
    t.index ["pokemon_id"], name: "index_detail_types_on_pokemon_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movements", force: :cascade do |t|
    t.string "attack"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "wight"
    t.string "hability"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "movement_id", null: false
    t.bigint "favorite_id", null: false
    t.bigint "detail_type_id", null: false
    t.index ["detail_type_id"], name: "index_pokemons_on_detail_type_id"
    t.index ["favorite_id"], name: "index_pokemons_on_favorite_id"
    t.index ["movement_id"], name: "index_pokemons_on_movement_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "detail_type_id", null: false
    t.index ["detail_type_id"], name: "index_types_on_detail_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pokemon_id", null: false
    t.bigint "favorite_id", null: false
    t.index ["favorite_id"], name: "index_users_on_favorite_id"
    t.index ["pokemon_id"], name: "index_users_on_pokemon_id"
  end

  add_foreign_key "detail_types", "pokemons"
  add_foreign_key "pokemons", "detail_types"
  add_foreign_key "pokemons", "favorites"
  add_foreign_key "pokemons", "movements"
  add_foreign_key "types", "detail_types"
  add_foreign_key "users", "favorites"
  add_foreign_key "users", "pokemons"
end
