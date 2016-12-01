class Task < ApplicationRecord
  has_many :notebooks, class_name: "NotebookTask"
  has_many :users, class_name:  "UserTask”
end
