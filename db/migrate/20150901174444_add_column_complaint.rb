class AddColumnComplaint < ActiveRecord::Migration
  def change
    add_column :complaints, :employee_address_details ,:text
    add_column :complaints, :update_on_email ,:boolean
    add_column :complaints, :name_of_employee ,:string

  end
end
