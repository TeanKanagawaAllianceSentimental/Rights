# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

Member.create(email: 'a@a', password: 'aaaaaa', encrypted_password: 'aaaaaa', member_name: '二階堂')
Address.create(member_id: 3, corporate_name: 'にんにん株式会社', corporate_phonetic: 'にんにんかぶしきがいしゃ', department: '営業部', contact_person_name: '二階堂', contact_person_phonetic: 'にかいどう', postal_code: '000-0000', prefecture_id: 1, address1: '千代田区千代田1-1', address2: '', phone: '03-0000-0000')
Genre.create(genre: 'J-pop', sequence: 1)
Disk.create(disk: 'disk1', item_id: 1)
Item.create(cd_title: 'aaa', genre_id: 1, package: 1, artist: 'artist', jacket_image_id: 1, label: 'xxx', unit_price: '1000', caption: 'test test', about: 'test', stock_quantity: 10, status: '販売中')
Music.create(disk_id: 1, music_title: 'bbb', songwriter: 'abcde', composer: 'wxyg')
Cart.create(member_id: 3, item_id: 1, quantity: 1)
Sale.create(member_id: 3, total_price: 10000,)
SaleInvoice.create(member_id: 3, bill_to: 'にんにん株式会社', billing_postal_code: '000-0000', billing_address1: '東京都千代田区千代田1-1', sale_id: 1)
SaleShipping.create(member_id: 3, shipping_postal_code: '000-0000', user_telephone: '03-0000-0000', shipping_address1: '東京都千代田区千代田', shipping_address2: '', organisation_name: 'にんにん株式会社', department: '営業部', contact_person: '二階堂', sale_id: 1)
CreditCard.create(credit_card_number: 0000-0000-0000-0000, credit_card_holder: "MITAKA", exp_month: 05, exp_year: 2020, member_id: 3, sale_id: 1)
CreditCard.create(credit_card_number: 2222222222222222, credit_card_holder: "MITAKA", exp_month: 12, exp_year: 2020, member_id: 3, sale_id: 1)
CreditCard.create(credit_card_number: 3333333333333333, credit_card_holder: "MITAKA", exp_month: 11, exp_year: 2020, member_id: 3, sale_id: 3)
