class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :session_token, null: false
      t.boolean :activated, default: false
      t.string :activation_token, null: false
      t.timestamps
    end

    add_index :users, ["activation_token"], name: "index_users_on_activation_token", unique: true, using: :btree
    add_index :users, ["email"], name: "index_users_on_email", unique: true, using: :btree
    add_index :users, ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  end
end
