class CreateUserComplaints < ActiveRecord::Migration
  def change
    create_table :user_complaints do |t|
      t.string :complainer_name
      t.string :contact_number
      t.string :complainer_email
      t.string :complaint_area
      t.integer :complaint_subject
      t.date :last_seen_date
      t.boolean :update_on_email
      t.string :name_of_employee
      t.text :employee_address_details
      t.text :complaint_description
      t.timestamps null: false
    end
  end
end
