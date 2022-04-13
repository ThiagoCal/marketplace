class AddNameAndAddressToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :postcode, :integer
    add_column :users, :address, :text
    add_column :users, :address_number, :integer
    add_column :users, :address_complement, :text
  end
end
