ActiveRecord::Schema.define(version: 2021_10_17_042222) do

  create_table "messages", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
