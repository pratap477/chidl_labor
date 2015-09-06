class AddColumnIsProivateComplaint < ActiveRecord::Migration
  def change
    add_column :complaints ,:is_private ,:boolean
  end
end
