class CreateNotebookTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :notebook_tasks do |t|
      t.integer :notebook_id
      t.integer :task_id

      t.timestamps
    end
  end
end
