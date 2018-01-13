class CreateMessages < ActiveRecord::Migration[5.0]
  def change

    create_table :messages do |t|
      t.text :message
      t.references :from_user, foreign_key: true
      t.references :to_user, foreign_key: true

      t.timestamps
    end

    add_index :messages, [:from_user_id, :created_at]

  end
end
