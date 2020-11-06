class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.string :motto
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end