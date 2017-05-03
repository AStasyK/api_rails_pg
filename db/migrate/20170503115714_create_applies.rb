class CreateApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :applies do |t|
      t.integer :job_id, null: false
      t.integer :geek_id, null: false
      t.boolean :read, default: false
      t.boolean :invited, default: false

      t.timestamps
    end
  end
end
