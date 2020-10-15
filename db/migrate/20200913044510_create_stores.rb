class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|

      t.string      :store_name,            null: false
      t.string      :postal_code,           null: false, limit: 7
      t.string      :prefectures,           null: false
      t.string      :ctiy,                  null: false
      t.string      :block_number,          null: false
      t.string      :apartment_name
      t.integer     :phone_number,          null: false, limit: 7
      t.integer     :open_time,             null: false
      t.integer     :close_time,            null: false
      t.integer     :holiday,               null: false
      t.integer     :smoking_environment,   null: false
      t.string      :website_url,           null: false
      t.references  :user,                  null: false, foreign_key: true
      t.timestamps
    end
  end
end
