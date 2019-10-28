

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
)
10.times do
    gimei = Gimei.name
    address = Gimei.address
    EndUser.create!(
        email: Faker::Internet.email,
        password: rand(111111..999999),
        family_name_kanji: gimei.last.kanji,
        given_name_kanji: gimei.first.kanji,
        family_name_kana: gimei.last.katakana,
        given_name_kana: gimei.first.katakana,
        address: address.kanji,
        post_code: rand(1111111..9999999),
        phone_number: Faker::PhoneNumber.phone_number,
    )
end
Artist.create!(
   [
       {
           artist_name: '宇多田ヒカル'
       },
       {
           artist_name: '桑田佳祐'
       },
       {
            artist_name: 'rolling stones'
        },
        {
            artist_name: 'Led Zeppelin'
        }
   ]
)
10.times do
    Artist.create!(
        artist_name: Faker::Artist.name
    )
end

Genre.create!(
    [
        {
            genre_name: 'pops'
        },
        {
            genre_name: 'rock'
        },
        {
             genre_name: '演歌'
        }
    ]
 )

10.times do
    Genre.create!(
        genre_name: Faker::Music.genre
    )
end

Label.create!(
   [
       {
           label_name: 'レーベル名A'
       },
       {
           label_name: 'レーベル名B'
       },
       {
            label_name: 'レーベル名C'
        },
        {
            label_name: 'レーベル名D'
        }
   ]
)
10.times do
    Label.create!(
        label_name: Faker::Coffee.blend_name
    )
end
Product.create!(
    [
        {
            genre_id: 2,
            label_id: 1,
            artist_id: 2,
            photo_id: '',
            product_price: 1280,
            sales_status: 1,
            product_name: '製品名A',
        },
        {
            genre_id: 3,
            label_id: 1,
            artist_id: 2,
            photo_id: '',
            product_price: 3500,
            sales_status: 1,
            product_name: '製品名B',
        },
        {
            genre_id: 1,
            label_id: 1,
            artist_id: 3,
            photo_id: '',
            product_price: 3200,
            sales_status: 1,
            product_name: '製品名C',
        }
    ]
)

5.times do
    Product.create!(
        genre_id: rand(1..5),
        label_id: rand(1..5),
        artist_id: rand(1..5),
        photo_id: '',
        product_price: rand(500..6000),
        sales_status: 1,
        product_name: Faker::Music.album,
    )
end

Order.create!(
    end_user_id: 1,
    delivery_cost: 500,
    total_price: 2000,
    order_status: 1,
    order_post_code: '200-0001',
    order_address: 'アメリカ'
 )

5.times do
    address = Gimei.address
    Order.create!(
        end_user_id: rand(1..5),
        delivery_cost: 500,
        total_price: 2000,
        order_status: 1,
        order_post_code: Faker::Address.postcode,
        order_address: address.kanji
)
end
OrderDetail.create!(
    [
        {
        order_id: 1,
        product_id: 1,
        price: 100,
        unit: 2
        },
        {
        order_id: 1,
        product_id: 2,
        price: 100,
        unit: 1
        }
    ]
)

5.times do
    OrderDetail.create!(
        order_id: rand(1..5),
        product_id: rand(1..5),
        price: 100,
        unit: rand(1..10)
)
end

CartItem.create!(
   end_user_id: rand(1..5),
   product_id: rand(1..5),
   cart_sum: rand(1..10)
)

Address.create!(
    [
        {
        end_user_id: 1,
        delivery_address: 'ここは=order_addressでコピー作成',
        delivery_name: 'おじいちゃんの家',
        delivery_post_code: '300-0001'
        },
        {
        end_user_id: 2,
        delivery_address: 'aaaa',
        delivery_name: 'おばあちゃんの家',
        delivery_post_code: '300-0002'
        }
    ]
)

5.times do
    address = Gimei.address
    Address.create!(
        end_user_id: rand(1..5),
        delivery_address: address.kanji,
        delivery_name: address.city.kanji,
        delivery_post_code: Faker::Address.postcode
    )
end

5.times do
Arrival.create!(
    product_id: rand(1..5),
    arrival_sum: rand(30..100),
    arrived_at: '2018/10/15 10:48:27'
)
end

Disc.create!(
   [
       {
           product_id: 1,
           disc_no: 1
       },
       {
           product_id: 1,
           disc_no: 2
       },
       {
           product_id: 2,
           disc_no: 1
       },
       {
            product_id: 3,
            disc_no: 1
        }
   ]
)

5.times do
    Disc.create!(
        product_id: rand(1..5),
           disc_no: 1
    )
end
Song.create!(
   [
       {
           disc_id: 1,
           song_no: 1,
           song_name: '曲名A'
       },
       {
           disc_id: 1,
           song_no: 2,
           song_name: '曲名B'
       },
       {
           disc_id: 2,
           song_no: 1,
           song_name: '曲名C'
       },
       {
            disc_id: 3,
            song_no: 1,
            song_name: '曲名D'
        },
        {
            disc_id: 3,
            song_no: 2,
            song_name: '曲名E'
        }
   ]
)
