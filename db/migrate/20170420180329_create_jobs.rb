class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :name, null: false #cannot be null
      t.string :place, null: false
      t.integer :company_id, null: false

      t.timestamps
    end
  end
end
