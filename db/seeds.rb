

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
100.times do
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
        },
        {
            artist_name: 'Cindy Lauper'
        }
   ]
)
50.times do
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

50.times do
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
50.times do
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
            photo_id: 'e4c18b3fd8bb1e1bb4ca538075a3222620a71c4022bc9c45215cf0b4fcdf',
            product_price: 1280,
            sales_status: 1,
            product_name: 'がらくた',
        },
        {
            genre_id: 3,
            label_id: 1,
            artist_id: 2,
            photo_id: '45eb07518f6349c34cfd5ca287f7b36fa5e543a9c56a5952883c653f9c07',
            product_price: 3500,
            sales_status: 1,
            product_name: '明日晴れるかな',
        },
        {
            genre_id: 1,
            label_id: 1,
            artist_id: 3,
            photo_id: 'b5ef2793a9ba2fcae2343b1a7ea8569d7218f0158514152088e955f72114',
            product_price: 3200,
            sales_status: 1,
            product_name: 'Sticky Fingers',
        },
        {
            genre_id: 1,
            label_id: 1,
            artist_id: 4,
            photo_id: 'ac813d62395498191f956fff12bec8a1ba92d25f38e53e8e58ab42d01be9',
            product_price: 3700,
            sales_status: 1,
            product_name: 'In Through the Out Door',
        },
        {
            genre_id: 1,
            label_id: 1,
            artist_id: 5,
            photo_id: '28e1410740403f43860dc2040c099e2f667c50471a48a01a50b57ea5d02a',
            product_price: 3200,
            sales_status: 1,
            product_name: 'Sticky Fingers',
        },{
            genre_id: 1,
            label_id: 1,
            artist_id: 3,
            photo_id: '6a75bbe3dabadb402ff5600ac11f1771531cdc39003696f0b70d00313c7b',
            product_price: 3200,
            sales_status: 1,
            product_name: 'Shes So Unusual',
        }
    ]
)

50.times do
    Product.create!(
        genre_id: rand(1..50),
        label_id: rand(1..50),
        artist_id: rand(1..50),
        photo_id: '694b7d1add8381fe9cc68f3b4b04e500b4366f6b677547be951367a233c8',
        product_price: rand(5000000..600000000),
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

30.times do
    address = Gimei.address
    Order.create!(
        end_user_id: rand(1..50),
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

30.times do
    OrderDetail.create!(
        order_id: rand(1..20),
        product_id: rand(1..20),
        price: 100,
        unit: rand(1..10)
)
end

40.times do
CartItem.create!(
   end_user_id: rand(1..40),
   product_id: rand(1..30),
   cart_sum: rand(1..10)
)
end

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

20.times do
    address = Gimei.address
    Address.create!(
        end_user_id: rand(1..30),
        delivery_address: address.kanji,
        delivery_name: address.city.kanji,
        delivery_post_code: Faker::Address.postcode
    )
end

20.times do
Arrival.create!(
    product_id: rand(1..30),
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

20.times do |x|
    Disc.create!(
        product_id: x+4,
           disc_no: 1
    )
end

20.times do |x|
    10.times do |y|
    Song.create!(
        disc_id: x + 1,
        song_no: y + 1,
        song_name: Faker::Games::Pokemon.name
    )
    end
end
