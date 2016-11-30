class NotebookTask < ApplicationRecord
  belongs_to :notebook, class_name: "Notebook", foreign_key: "notebook_id"
  belongs_to :task, class_name: "Task", foreign_key: "task_id"
end
