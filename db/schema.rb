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

ActiveRecord::Schema.define(version: 20170430183132) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name",                         null: false
    t.text   "description",    limit: 65535, null: false
    t.string "super_category"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "postal_code", null: false
    t.string  "city",        null: false
  end

  create_table "product_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "product_id",  null: false
    t.integer "category_id", null: false
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title",                                                    null: false
    t.text     "description",  limit: 65535,                               null: false
    t.decimal  "price",                      precision: 10,                null: false
    t.boolean  "availability",                              default: true
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "email_seller",                                             null: false
  end

  create_table "purchases", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "amount",                    null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",                   null: false
    t.integer  "product_id",                null: false
    t.integer  "receipt_id",                null: false
    t.decimal  "price",      precision: 10
    t.boolean  "on_the_way",                null: false
  end

  create_table "ratings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "grade",                    null: false
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "user_id",                  null: false
    t.integer  "product_id",               null: false
  end

  create_table "receipts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.decimal  "total",      precision: 10, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                            null: false
    t.string   "email_admin"
    t.string   "name",                             null: false
    t.string   "surname",                          null: false
    t.string   "telephone_number",                 null: false
    t.string   "address",                          null: false
    t.integer  "privilege",        default: 0
    t.boolean  "active",           default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "city_id",                          null: false
    t.string   "password",                         null: false
    t.date     "date_of_birth"
  end

end
