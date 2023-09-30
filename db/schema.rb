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

ActiveRecord::Schema[7.0].define(version: 2023_09_29_185254) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "batches", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "batch_for_type", null: false
    t.uuid "batch_for_id", null: false
    t.integer "quantity"
    t.string "status"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_for_type", "batch_for_id"], name: "index_batches_on_batch_for"
    t.index ["user_id"], name: "index_batches_on_user_id"
  end

  create_table "circuits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "number"
    t.string "position", default: [], array: true
    t.integer "length"
    t.uuid "p1_terminal_id", null: false
    t.uuid "p2_terminal_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "uncut_wire_id", null: false
    t.uuid "wiring_harness_id"
    t.uuid "p1_wiring_harness_connector_id"
    t.uuid "p2_wiring_harness_connector_id"
    t.uuid "secondary_uncut_wire_id"
    t.uuid "twisted_with"
    t.index ["p1_terminal_id"], name: "index_circuits_on_p1_terminal_id"
    t.index ["p1_wiring_harness_connector_id"], name: "index_circuits_on_p1_wiring_harness_connector_id"
    t.index ["p2_terminal_id"], name: "index_circuits_on_p2_terminal_id"
    t.index ["p2_wiring_harness_connector_id"], name: "index_circuits_on_p2_wiring_harness_connector_id"
    t.index ["secondary_uncut_wire_id"], name: "index_circuits_on_secondary_uncut_wire_id"
    t.index ["uncut_wire_id"], name: "index_circuits_on_uncut_wire_id"
    t.index ["wiring_harness_id"], name: "index_circuits_on_wiring_harness_id"
  end

  create_table "connectors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "part_number"
    t.string "company"
    t.integer "positions"
    t.uuid "prepop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prepop_id"], name: "index_connectors_on_prepop_id"
  end

  create_table "errors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "batch_id", null: false
    t.integer "quantity"
    t.text "description"
    t.boolean "salvageable"
    t.string "error_for_type", null: false
    t.uuid "error_for_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_errors_on_batch_id"
    t.index ["error_for_type", "error_for_id"], name: "index_errors_on_error_for"
  end

  create_table "prepop_connectors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "prepop_id", null: false
    t.uuid "connectors_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connectors_id"], name: "index_prepop_connectors_on_connectors_id"
    t.index ["prepop_id"], name: "index_prepop_connectors_on_prepop_id"
  end

  create_table "prepops", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "weekly_need"
    t.integer "weekly_quantity"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "wiring_harness_id", null: false
    t.index ["wiring_harness_id"], name: "index_prepops_on_wiring_harness_id"
  end

  create_table "splices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "length"
    t.uuid "terminal_id", null: false
    t.integer "quantity"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "circuit_id", null: false
    t.uuid "uncut_wire_id", null: false
    t.index ["circuit_id"], name: "index_splices_on_circuit_id"
    t.index ["terminal_id"], name: "index_splices_on_terminal_id"
    t.index ["uncut_wire_id"], name: "index_splices_on_uncut_wire_id"
  end

  create_table "terminals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "connector_id"
    t.index ["connector_id"], name: "index_terminals_on_connector_id"
  end

  create_table "uncut_wires", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "gauge", null: false
    t.string "primary_color", null: false
    t.string "secondary_color", null: false
    t.integer "length_in_cm", null: false
    t.date "date_ordered", default: "2023-08-30", null: false
    t.string "part_number"
    t.string "status", default: "in stock", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "employee", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "current_position", default: "employee", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wiring_harness_connectors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "wiring_harness_id", null: false
    t.uuid "connector_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connector_id"], name: "index_wiring_harness_connectors_on_connector_id"
    t.index ["wiring_harness_id"], name: "index_wiring_harness_connectors_on_wiring_harness_id"
  end

  create_table "wiring_harnesses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.integer "weekly_quota"
    t.integer "harnesses_completed"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wiring_harnesses_on_user_id"
  end

  add_foreign_key "batches", "users"
  add_foreign_key "circuits", "circuits", column: "twisted_with"
  add_foreign_key "circuits", "uncut_wires"
  add_foreign_key "circuits", "wiring_harness_connectors", column: "p1_wiring_harness_connector_id"
  add_foreign_key "circuits", "wiring_harness_connectors", column: "p2_wiring_harness_connector_id"
  add_foreign_key "circuits", "wiring_harnesses"
  add_foreign_key "connectors", "prepops"
  add_foreign_key "errors", "batches"
  add_foreign_key "prepop_connectors", "connectors", column: "connectors_id"
  add_foreign_key "prepop_connectors", "prepops"
  add_foreign_key "prepops", "wiring_harnesses"
  add_foreign_key "splices", "circuits"
  add_foreign_key "splices", "terminals"
  add_foreign_key "splices", "uncut_wires"
  add_foreign_key "terminals", "connectors"
  add_foreign_key "wiring_harness_connectors", "connectors"
  add_foreign_key "wiring_harness_connectors", "wiring_harnesses"
  add_foreign_key "wiring_harnesses", "users"
end
