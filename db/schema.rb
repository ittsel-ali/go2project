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

ActiveRecord::Schema.define(version: 20171124204202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "business_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_business_categories_on_user_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "business_name"
    t.string "person_name"
    t.string "email"
    t.string "cell"
    t.string "office_phone"
    t.string "fax"
    t.string "address"
    t.bigint "user_id"
    t.bigint "business_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_category_id"], name: "index_businesses_on_business_category_id"
    t.index ["user_id"], name: "index_businesses_on_user_id"
  end

  create_table "client_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_client_categories_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "business_name"
    t.string "person_name"
    t.string "email"
    t.string "cell"
    t.string "office_phone"
    t.string "fax"
    t.string "address"
    t.bigint "user_id"
    t.bigint "client_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_category_id"], name: "index_clients_on_client_category_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "payment_type"
    t.string "payment_menthod"
    t.string "amount"
    t.bigint "project_id"
    t.bigint "project_task_id"
    t.bigint "project_sub_task_id"
    t.bigint "user_id"
    t.string "expensable_type"
    t.bigint "expensable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["expensable_type", "expensable_id"], name: "index_expenses_on_expensable_type_and_expensable_id"
    t.index ["project_id"], name: "index_expenses_on_project_id"
    t.index ["project_sub_task_id"], name: "index_expenses_on_project_sub_task_id"
    t.index ["project_task_id"], name: "index_expenses_on_project_task_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "material_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_material_categories_on_user_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "business_name"
    t.string "person_name"
    t.string "email"
    t.string "cell"
    t.string "office_phone"
    t.string "fax"
    t.string "address"
    t.bigint "user_id"
    t.bigint "material_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["material_category_id"], name: "index_materials_on_material_category_id"
    t.index ["user_id"], name: "index_materials_on_user_id"
  end

  create_table "professional_service_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_professional_service_categories_on_user_id"
  end

  create_table "professional_services", force: :cascade do |t|
    t.string "business_name"
    t.string "person_name"
    t.string "email"
    t.string "cell"
    t.string "office_phone"
    t.string "fax"
    t.string "address"
    t.bigint "user_id"
    t.bigint "professional_service_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professional_service_category_id"], name: "index_professional_services_on_professional_service_category_id"
    t.index ["user_id"], name: "index_professional_services_on_user_id"
  end

  create_table "project_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_project_categories_on_user_id"
  end

  create_table "project_sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "project_category_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_category_id"], name: "index_project_sub_categories_on_project_category_id"
    t.index ["user_id"], name: "index_project_sub_categories_on_user_id"
  end

  create_table "project_sub_tasks", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "project_task_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_sub_tasks_on_project_id"
    t.index ["project_task_id"], name: "index_project_sub_tasks_on_project_task_id"
  end

  create_table "project_tasks", force: :cascade do |t|
    t.bigint "project_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tasks_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "project_name"
    t.string "project_number"
    t.string "project_address"
    t.string "description_of_project"
    t.string "project_manager_name"
    t.string "project_manager_cell_number"
    t.string "project_manager_email_address"
    t.bigint "user_id"
    t.bigint "client_id"
    t.bigint "staff_id"
    t.bigint "project_category_id"
    t.bigint "project_sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_projects_on_client_id"
    t.index ["project_category_id"], name: "index_projects_on_project_category_id"
    t.index ["project_sub_category_id"], name: "index_projects_on_project_sub_category_id"
    t.index ["staff_id"], name: "index_projects_on_staff_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "staff_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_staff_categories_on_user_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "business_name"
    t.string "person_name"
    t.string "email"
    t.string "cell"
    t.string "office_phone"
    t.string "fax"
    t.string "address"
    t.bigint "user_id"
    t.bigint "staff_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["staff_category_id"], name: "index_staffs_on_staff_category_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "trade_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trade_categories_on_user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.string "business_name"
    t.string "person_name"
    t.string "email"
    t.string "cell"
    t.string "office_phone"
    t.string "fax"
    t.string "address"
    t.bigint "user_id"
    t.bigint "trade_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trade_category_id"], name: "index_trades_on_trade_category_id"
    t.index ["user_id"], name: "index_trades_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "company_logo"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
