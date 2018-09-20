class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string :credit_card_number
      t.string :credit_card_holder
      t.string :exp_month
      t.string :exp_year
      t.string :security_code
      t.integer :member_id

      t.timestamps
    end
  end
end
