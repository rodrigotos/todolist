class Task < ApplicationRecord
  has_many :notebooks, class_name: "NotebookTask"
end
