class CreateVisits < ActiveRecord::Migration[6.1]
  def change
    create_table :visits do |t|
      t.datetime :visit_datetime
      t.float :temperature
      t.float :height
      t.float :weight
      t.integer :pulse
      t.integer :bp_sys
      t.integer :bd_dia
      t.text :complaint
      t.text :referrals

      t.timestamps
    end
  end
end
