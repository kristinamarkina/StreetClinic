class AddPatientToVisits < ActiveRecord::Migration[6.1]
  def change
    add_column :visits, :patient_id, :integer
    add_index :visits, :patient_id
  end
end
