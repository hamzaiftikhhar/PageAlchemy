class AddEmailToSuppliers < ActiveRecord::Migration[8.1]

  def change
    add_column :suppliers, :email, :string
    # add emails 
    Supplier.reset_column_information
    Supplier.find_each do |supplier|
      supplier.update(email: "#{supplier.name.downcase.gsub(/\s+/, '_')}@example.com")
    end
  end

end


