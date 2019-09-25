class CreateTchings < ActiveRecord::Migration[5.2]
  def change
    create_table :tchings do |t|
      t.text :content
      t.string :title
      t.references :ctg, foreign_key: true

      t.timestamps
    end
  end
end
