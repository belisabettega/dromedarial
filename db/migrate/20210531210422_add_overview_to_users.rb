class AddOverviewToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :overview, :text
  end
end
