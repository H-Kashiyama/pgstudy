class CreateCtgs < ActiveRecord::Migration[5.2]
  def change
    create_table :ctgs do |t|
      t.string :ctg

      t.timestamps
    end
  end
end
