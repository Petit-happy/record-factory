# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

Arrival.create(:product_id => '99999', :arrival_sam => '99999', :arrived_at =>'9999/99/99' )
Arrival.create(:product_id => '00000', :arrival_sam => '00000', :arrived_at =>'9999/99/99' )
Arrival.create(:product_id => '11111', :arrival_sam => '11111', :arrived_at =>'9999/99/99' )


AdminUser.create(:family_name_kanji => '長野', :given_name_kanji => '太郎', :family_name_kana =>'ナガノ', :given_name_kana =>'タロウ', :email =>'web@camp.com', :password =>'infratop')


