class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :member, foreign_key: true
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
      t.timestamps
    end
  end
end
