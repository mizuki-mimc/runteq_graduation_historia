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

ActiveRecord::Schema[7.2].define(version: 2025_06_27_022326) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "plot_world_guides", force: :cascade do |t|
    t.bigint "plot_id", null: false
    t.bigint "world_guide_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plot_id"], name: "index_plot_world_guides_on_plot_id"
    t.index ["world_guide_id"], name: "index_plot_world_guides_on_world_guide_id"
  end

  create_table "plots", force: :cascade do |t|
    t.string "chapter"
    t.string "title"
    t.string "summary"
    t.text "content"
    t.integer "order"
    t.bigint "story_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_plots_on_story_id"
  end

  create_table "stories", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.text "thema"
    t.text "synopsis"
    t.integer "status", default: 0
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_stories_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "world_feature_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "world_guide_features", force: :cascade do |t|
    t.text "explanation"
    t.bigint "world_guide_id", null: false
    t.bigint "world_feature_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["world_feature_category_id"], name: "index_world_guide_features_on_world_feature_category_id"
    t.index ["world_guide_id"], name: "index_world_guide_features_on_world_guide_id"
  end

  create_table "world_guides", force: :cascade do |t|
    t.string "category"
    t.string "world_name"
    t.string "country_name"
    t.string "region_name"
    t.bigint "story_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["story_id"], name: "index_world_guides_on_story_id"
  end

  add_foreign_key "plot_world_guides", "plots"
  add_foreign_key "plot_world_guides", "world_guides"
  add_foreign_key "plots", "stories"
  add_foreign_key "stories", "users"
  add_foreign_key "world_guide_features", "world_feature_categories"
  add_foreign_key "world_guide_features", "world_guides"
  add_foreign_key "world_guides", "stories"
end
