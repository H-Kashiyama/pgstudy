class CreateTchings < ActiveRecord::Migration[5.2]
  def change
    create_table :tchings do |t|
      t.string :title
      t.string :content
      t.references :ctg, foreign_key: true

      t.timestamps
    end
  end
end
