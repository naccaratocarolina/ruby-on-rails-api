class CreateFacts < ActiveRecord::Migration[6.0]
  def change
    create_table :facts do |t|
      t.string :fact
      t.references :cat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
