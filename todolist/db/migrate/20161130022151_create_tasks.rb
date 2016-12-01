class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :finish_date
      t.text :description
      t.integer :priority

      t.timestamps
    end
  end
end
