class AddOrganisationNameToSaleShippings < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_shippings, :organisation_name, :string
  end
end
