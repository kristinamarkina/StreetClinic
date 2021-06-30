class CreateProviders < ActiveRecord::Migration[6.1]
  def change
    create_table :providers do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :languages
      t.string :specialty

      t.timestamps
    end
  end
end
