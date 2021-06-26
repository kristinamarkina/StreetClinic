class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :sex
      t.string :ethnicity
      t.boolean :prev_etoh_use
      t.boolean :curr_etoh_use
      t.text :etoh_notes
      t.boolean :prev_smoking
      t.boolean :curr_smoking
      t.text :smoking_notes
      t.boolean :prev_drug_use
      t.boolean :curr_drug_use
      t.text :drug_notes
      t.text :illnesses
      t.text :surgeries
      t.text :allergies

      t.timestamps
    end
  end
end
