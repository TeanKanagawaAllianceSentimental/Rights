# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8


Sale.create(member_id: 1, total_price: 1000, delivered: "準備中", Application: "楽曲申請を行います", credit_card_id: 2)
Sale.create(member_id: 1, total_price: 1000, delivered: "準備中", Application: "楽曲申請を行います", sale_invoice_id: 2)
Sale.create(member_id: 2, total_price: 1000, delivered: "準備中", Application: "楽曲申請を行います", credit_card_id: 1)
Sale.create(member_id: 2, total_price: 1000, delivered: "準備中", Application: "楽曲申請を行います", sale_invoice_id: 1)
SaleItem.create(quantity: 2, sale_id: 7, unit_price: 4000, item_id: 1)
SaleItem.create(quantity: 2, sale_id: 7, unit_price: 3000, item_id: 2)
SaleItem.create(quantity: 2, sale_id: 8, unit_price: 1000, item_id: 3)
SaleItem.create(quantity: 2, sale_id: 8, unit_price: 2400, item_id: 4)
SaleItem.create(quantity: 2, sale_id: 9, unit_price: 2000, item_id: 5)
SaleItem.create(quantity: 2, sale_id: 9, unit_price: 2400, item_id: 6)
SaleItem.create(quantity: 2, sale_id: 10, unit_price: 2600, item_id: 7)
SaleItem.create(quantity: 2, sale_id: 10, unit_price: 2000, item_id: 8)
SaleItem.create(quantity: 2, sale_id: 10, unit_price: 4000, item_id: 9)



