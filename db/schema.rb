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

ActiveRecord::Schema.define(version: 20170518031405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "description"
    t.integer  "pontos_planejados"
    t.integer  "status_id"
    t.integer  "label_id"
    t.integer  "sprint_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "project_id"
    t.index ["label_id"], name: "index_activities_on_label_id", using: :btree
    t.index ["project_id"], name: "index_activities_on_project_id", using: :btree
    t.index ["sprint_id"], name: "index_activities_on_sprint_id", using: :btree
    t.index ["status_id"], name: "index_activities_on_status_id", using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string   "description"
    t.integer  "color_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["color_id"], name: "index_labels_on_color_id", using: :btree
  end

  create_table "project_sprints", force: :cascade do |t|
    t.integer  "project_id"
    t.integer  "sprint_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_sprints_on_project_id", using: :btree
    t.index ["sprint_id"], name: "index_project_sprints_on_sprint_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "description"
    t.integer  "team_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["team_id"], name: "index_projects_on_team_id", using: :btree
  end

  create_table "sprints", force: :cascade do |t|
    t.string   "description"
    t.date     "inicio"
    t.date     "fim"
    t.integer  "pontos_cadastrados"
    t.integer  "pontos_atualizados"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string   "description"
    t.integer  "color_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["color_id"], name: "index_statuses_on_color_id", using: :btree
  end

  create_table "team_users", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_users_on_team_id", using: :btree
    t.index ["user_id"], name: "index_team_users_on_user_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "student_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "role"
    t.index ["user_id"], name: "index_user_profiles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "activities", "labels"
  add_foreign_key "activities", "projects"
  add_foreign_key "activities", "sprints"
  add_foreign_key "activities", "statuses"
  add_foreign_key "labels", "colors"
  add_foreign_key "project_sprints", "projects"
  add_foreign_key "project_sprints", "sprints"
  add_foreign_key "projects", "teams"
  add_foreign_key "statuses", "colors"
  add_foreign_key "team_users", "teams"
  add_foreign_key "team_users", "users"
  add_foreign_key "user_profiles", "users"
end
