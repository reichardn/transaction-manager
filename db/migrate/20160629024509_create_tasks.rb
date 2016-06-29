class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :complete
      t.integer :deal_id

      t.timestamps
    end
  end
end
