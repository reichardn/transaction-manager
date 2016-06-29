class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :username
      t.string :email
      t.integer :deal_id
    end
  end
end
