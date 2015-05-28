class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.date :birthday
      t.string :unique_token
      t.integer :user_id
      t.datetime :date_last_updated_by_user
      t.string :email_address
      t.integer :zip_code
      t.string :state
      t.string :city
      t.string :address_line_one
      t.string :address_line_two
      t.string :last_name
      t.string :first_name

      t.timestamps

    end
  end
end
