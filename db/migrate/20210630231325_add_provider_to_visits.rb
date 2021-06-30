class AddProviderToVisits < ActiveRecord::Migration[6.1]
  def change
    add_column :visits, :provider_id, :integer
    add_index :visits, :provider_id
  end
end
