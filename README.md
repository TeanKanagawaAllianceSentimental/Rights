# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
              <%= f.text_field :corporate_name, autofocus: true, autocomplete: "corporate_name",class: "form-control",placeholder:"会社名を入力して下さい。" %>


    t.string "corporate_name"
    t.string "corporate_phonetic"
    t.string "department"
    t.string "contact_person_name"
    t.string "contact_person_phonetic"
    t.string "postal_code"
    t.integer "prefecture_id"
    t.string "address1"
    t.string "address2"
    t.string "phone"