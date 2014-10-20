class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.text :photo
      t.string :email
      t.string :password_digest
      t.string :role

      t.timestamps
    end
  end
end
