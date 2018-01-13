class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 100
      t.string :email, limit: 256
      t.string :password_digest, limit: 256

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
