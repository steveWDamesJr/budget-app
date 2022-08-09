ActiveRecord::Schema[7.0].define(version: 2022_08_09_091010) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.text "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "purchase_groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "purchase_id", null: false
    t.bigint "group_id", null: false
    t.index ["group_id"], name: "index_purchase_groups_on_group_id"
    t.index ["purchase_id"], name: "index_purchase_groups_on_purchase_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string "name"
    t.money "amount", scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "groups", "users"
  add_foreign_key "purchase_groups", "groups"
  add_foreign_key "purchase_groups", "purchases"
  add_foreign_key "purchases", "users"
end
