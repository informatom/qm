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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140225121700) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "legacy_id"
  end

  create_table "business_process_department_assignments", :force => true do |t|
    t.integer  "business_process_id"
    t.integer  "department_id"
    t.integer  "company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "legacy_id"
  end

  create_table "business_process_document_assignments", :force => true do |t|
    t.integer  "business_process_id"
    t.integer  "document_id"
    t.integer  "company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "legacy_id"
  end

  create_table "business_process_note_assignments", :force => true do |t|
    t.integer  "business_process_id"
    t.integer  "note_id"
    t.integer  "company_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "legacy_id"
  end

  create_table "business_process_process_indicator_assignments", :force => true do |t|
    t.integer  "business_process_id"
    t.integer  "process_indicator_id"
    t.integer  "company_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "legacy_id"
  end

  create_table "business_processes", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.integer  "parent_id"
    t.string   "ancestry"
    t.string   "purpose"
    t.string   "number"
    t.integer  "owner_id"
    t.string   "aims"
    t.integer  "process_class_id"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "x"
    t.integer  "y"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.string   "area"
    t.integer  "released_by_id"
    t.integer  "controlled_by_id"
    t.integer  "legacy_id"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "legacy_id"
  end

  create_table "department_affiliations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "department_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "company_id"
    t.integer  "legacy_id"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "x"
    t.integer  "y"
    t.integer  "legacy_id"
  end

  create_table "document_process_step_assignments", :force => true do |t|
    t.integer  "document_id"
    t.integer  "process_step_id"
    t.integer  "company_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "legacy_id"
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.text     "description"
    t.boolean  "internal"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "attachment"
    t.integer  "released_by_id"
    t.integer  "controlled_by_id"
    t.integer  "legacy_id"
  end

  create_table "employments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "legacy_id"
  end

  create_table "flow_objects", :force => true do |t|
    t.string   "name"
    t.string   "flow_object_class"
    t.string   "image_file_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "functions", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.text     "description"
    t.text     "tasks"
    t.text     "responsibilities"
    t.text     "skills"
    t.text     "goals"
    t.text     "authorities"
    t.text     "comments"
    t.integer  "x"
    t.integer  "y"
    t.integer  "released_by_id"
    t.integer  "controlled_by_id"
    t.integer  "legacy_id"
  end

  create_table "instruction_document_assignments", :force => true do |t|
    t.integer  "instruction_id"
    t.integer  "document_id"
    t.integer  "company_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "legacy_id"
  end

  create_table "instruction_process_step_assignments", :force => true do |t|
    t.integer  "instruction_id"
    t.integer  "process_step_id"
    t.integer  "company_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "legacy_id"
  end

  create_table "instructions", :force => true do |t|
    t.string   "title"
    t.integer  "company_id"
    t.string   "number"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "in_charge_id"
    t.integer  "controlled_by_id"
    t.integer  "released_by_id"
    t.integer  "scope_id"
    t.date     "revision_date"
    t.text     "tasks"
    t.text     "ressources"
    t.text     "necessary_information"
    t.text     "security"
    t.text     "ecology"
    t.text     "on_deviation"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "legacy_id"
  end

  create_table "news", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "note_process_step_assignments", :force => true do |t|
    t.integer  "note_id"
    t.integer  "process_step_id"
    t.integer  "company_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "legacy_id"
  end

  create_table "notes", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "duration"
    t.string   "location"
    t.string   "medium"
    t.string   "archiving"
    t.integer  "released_by_id"
    t.integer  "controlled_by_id"
    t.integer  "legacy_id"
  end

  create_table "process_classes", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "color"
    t.integer  "legacy_id"
  end

  create_table "process_indicators", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "metering_point"
    t.string   "value"
    t.string   "unit"
    t.string   "nominal_value"
    t.string   "operator"
    t.text     "description"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "legacy_id"
  end

  create_table "process_steps", :force => true do |t|
    t.string   "title"
    t.integer  "company_id"
    t.text     "description"
    t.integer  "flow_object_id"
    t.integer  "business_process_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "legacy_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_in_company", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.text     "description"
    t.integer  "legacy_id"
  end

  create_table "sequence_flows", :force => true do |t|
    t.string   "name"
    t.integer  "source_id"
    t.integer  "target_id"
    t.integer  "flow_object_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "company_id"
    t.integer  "legacy_id"
  end

  create_table "substitutions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deputy_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "company_id"
    t.integer  "legacy_id"
  end

  create_table "user_function_assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "function_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "company_id"
    t.integer  "legacy_id"
  end

  create_table "user_role_in_company_assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_in_company_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "company_id"
    t.integer  "legacy_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "password_salt"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "parent_id"
    t.string   "ancestry"
  end

  add_index "users", ["ancestry"], :name => "index_users_on_ancestry"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",      :null => false
    t.integer  "item_id",        :null => false
    t.string   "event",          :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.text     "object_changes"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
