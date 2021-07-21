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

ActiveRecord::Schema.define(version: 2021_07_21_152243) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "detail_types", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pokemon_id", null: false
    t.bigint "type_id", null: false
    t.index ["pokemon_id"], name: "index_detail_types_on_pokemon_id"
    t.index ["type_id"], name: "index_detail_types_on_type_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pokemon_id", null: false
    t.bigint "user_id", null: false
    t.index ["pokemon_id"], name: "index_favorites_on_pokemon_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "movements", force: :cascade do |t|
    t.string "attack"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "pokemon_id", null: false
    t.index ["pokemon_id"], name: "index_movements_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.integer "pokeapi_id"
    t.index ["user_id"], name: "index_pokemons_on_user_id"
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
  end

  add_foreign_key "detail_types", "pokemons"
  add_foreign_key "detail_types", "types"
  add_foreign_key "favorites", "pokemons"
  add_foreign_key "favorites", "users"
  add_foreign_key "movements", "pokemons"
  add_foreign_key "pokemons", "users"
  add_foreign_key "types", "detail_types"
end
