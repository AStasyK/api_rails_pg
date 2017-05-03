class CreateGeeks < ActiveRecord::Migration[5.0]
  def change
    create_table :geeks do |t|
      t.string :name, null: false
      t.string :stack, null: false
      t.text :resume

      t.timestamps
    end
  end
end
