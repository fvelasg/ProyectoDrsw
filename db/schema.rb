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

ActiveRecord::Schema.define(:version => 20120509010719) do

  create_table "categories", :force => true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "materials", :force => true do |t|
    t.integer  "cantidadfisica"
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "unidadmedida"
    t.integer  "preciounidad"
    t.integer  "category_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "materials", ["category_id"], :name => "index_materials_on_category_id"

  create_table "materials_reserves", :id => false, :force => true do |t|
    t.integer "material_id"
    t.integer "reserve_id"
  end

  create_table "reserves", :force => true do |t|
    t.integer  "estado"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reserves", ["user_id"], :name => "index_reserves_on_user_id"

  create_table "reserves_materials", :id => false, :force => true do |t|
    t.integer "reserve_id",  :null => false
    t.integer "material_id", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "nombre"
    t.string   "clave"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
