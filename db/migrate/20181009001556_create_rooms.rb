class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.references:user, foreign_key: true,  index: true,  null: false
      t.string :room_name,        limit: 100,   null: false
      t.string :room_info,          limit: 5000,   null: false
      t.string :province,         limit: 40,    null: false
      t.string :address,          limit: 100,   null: false
      t.integer:cost_per_night,                 null: false
      t.integer:type_of_room,                   null: false,  default: 1
      t.integer:num_of_guests,    limit: 1,     null: false
      t.integer:num_of_bedrooms,  limit: 1,     null: false
      t.integer:num_of_beds,      limit: 1,     null: false
      t.integer:num_of_baths,     limit: 1,     null: false
      t.string:amentities,        limit: 500,   null: false
      t.string:contact_host,      limit: 500,   null: false
      t.text:pictures,          limit: 500,   null: false
      t.boolean:is_approved,                                  default: false
    end
  end
end
