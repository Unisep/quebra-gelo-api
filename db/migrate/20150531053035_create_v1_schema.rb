class CreateV1Schema < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :latitude, precision: 10, scale: 6

      t.timestamps null: false
    end

    create_table :statuses do |t|
      t.date :last_logged_at

      t.timestamps null: false
    end

    create_table :people do |t|
      t.string :bio
      t.date :birthday_at
      t.string :email
      t.string :name
      t.string :fb_access_token
      t.text :tags, array: true, default: []
      t.references :location, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
