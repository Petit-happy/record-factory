class CreateEndUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :end_users do |t|
      t.string :family_name_kanji
      t.string :given_name_kanji
      t.string :family_name_kana
      t.string :given_name_kana
      t.text :address
      t.string :post_code
      t.string :email
      t.string :password
      t.string :phone_number
      t.boolean :is_deleted

      t.timestamps
    end
  end
end
