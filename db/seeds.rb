

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8
AdminUser.create!(
     family_name_kanji: '長野',
     given_name_kanji: '太郎',
     family_name_kana: 'ナガノ',
     given_name_kana: 'タロウ',
     email: 'web@camp.com',
     password: 'infratop'
)
EndUser.create!(
    email: 'aaabb@aaa',
    password: '111111',
    family_name_kanji: '中村',
    given_name_kanji: '圭介',
    family_name_kana: 'ナカムラ',
    given_name_kana: 'ケイスケ',
    address: '東京',
    post_code: '1000001',
    phone_number: '08012345678',
    is_deleted: 'true'
 )
 Artist.create!(
    [
        {
            artist_name: '宇多田ヒカル'
        },
        {
            artist_name: '桑田佳祐'
        }
    ]
)

Genre.create!(
    [
        {
            genre_name: 'poops'
        },
        {
            genre_name: 'rock'
        }
    ]
)

Label.create!(
    [
        {
            label_name: 'レーベル名A'
        },
        {
            label_name: 'レーベル名B'
        }
    ]
)
 Product.create!(
    genre_id: '1',
    label_id: '1',
    artist_id: '2',
    photo_id: '1',
    product_price: '1280',
    sales_status: '1',
    product_name: '製品名A',
    is_deleted: 'true'
 )
 Order.create!(
    end_user_id: '1',
    delivery_cost: '500',
    total_price: '2000',
    order_status: '1',
    order_post_code: '200-0001',
    order_address: 'アメリカ'
 )
 OrderDetail.create!(
    order_id: '1',
    product_id: '1',
    price: '1285',
    unit: '2'
 )

 CartItem.create!(
    end_user_id: '1',
    product_id: '1',
    cart_sum: '3'
 )

Address.create!(
    end_user_id: '1',
    delivery_address: 'ここは=order_addressでコピー作成',
    delivery_name: 'おじいちゃんの家',
    delivery_post_code: '300-0001'
 )

 Arrival.create!(
    product_id: '1',
    arrival_sam: '2',
    arrived_at: '2019/08/18'
)

 Disc.create!(
    [
        {
            product_id: '1',
            desc_no: '1'
        },
        {
            product_id: '1',
            desc_no: '2'
        }
    ]
)
Song.create!(
    [
        {
            disc_id: '1',
            song_no: '1',
            song_name: '曲名A'
        },
        {
            disc_id: '1',
            song_no: '2',
            song_name: '曲名B'
        },
        {
            disc_id: '1',
            song_no: '3',
            song_name: '曲名C'
        },
    ]
)