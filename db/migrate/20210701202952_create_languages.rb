class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :lang_name

      t.timestamps
    end
  end
end
