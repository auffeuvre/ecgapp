class CreateEcgs < ActiveRecord::Migration[7.0]
  def change
    create_table :ecgs do |t|
      t.string :name
      t.text :facts

      t.timestamps
    end
  end
end
