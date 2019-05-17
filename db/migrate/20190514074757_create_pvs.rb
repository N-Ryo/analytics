class CreatePvs < ActiveRecord::Migration[5.2]
  def change
    create_table :pvs do |t|
      t.string :url
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
