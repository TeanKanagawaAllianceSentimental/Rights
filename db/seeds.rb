# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

# CreditCard.create(credit_card_number: 1111111111111111, credit_card_holder: "HAJIME KINDAICHI", exp_month: 1, exp_year: 2019, member_id: 1)
# SaleInvoice.create(bill_to: "いちいち株式会社", billing_postal_code: 111-1111, billing_address1: "東京都千代田区千代田1-1", billing_address2: "", contact_person: "金田一　一", department: "探偵部")
# Sale.create(member_id: 1)
# Sale.create(member_id: 2)
# Cart.create(member_id: 1, item_id: 1, quantity: 1)
# Cart.create(member_id: 1, item_id: 2, quantity: 1)
# Cart.create(member_id: 1, item_id: 3, quantity: 1)
# Cart.create(member_id: 1, item_id: 4, quantity: 1)
# Cart.create(member_id: 1, item_id: 5, quantity: 1)
# Cart.create(member_id: 1, item_id: 6, quantity: 1)
# Cart.create(member_id: 1, item_id: 7, quantity: 1)
# Cart.create(member_id: 2, item_id: 8, quantity: 1)
# Cart.create(member_id: 2, item_id: 9, quantity: 1)
# Cart.create(member_id: 2, item_id: 10, quantity: 1)
# SaleShipping.create(organisation_name: "いちいち株式会社", shipping_postal_code: "111-1111", shipping_address1: "東京都千代田区千代田1-1", shipping_address2: "", department: "探偵部", contact_person: "金田一　一", sale_id: 1, member_id: 1)

SaleShipping.create(organisation_name: "にんにん株式会社", shipping_postal_code: "222-2222", shipping_address1: "東京都千代田区二重橋2-2", shipping_address2: "", department: "営業部", contact_person: "二階堂　二郎", sale_id: 3, member_id: 2)
CreditCard.create(credit_card_number: 2222-2222-2222-2222, credit_card_holder: "JIRO NIKAIDO", exp_month: 2, exp_year: 2022, member_id: 2)
SaleInvoice.create(bill_to: "にんにん株式会社", billing_postal_code: 3333333, billing_address1: "三重県三重市三重3-3-3", billing_address2: "サンコーポ303", contact_person: "三鷹　三助", department: "自宅警備")

