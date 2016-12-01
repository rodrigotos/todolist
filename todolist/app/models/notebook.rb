class Notebook < ApplicationRecord
  has_many :tasks, class_name: "NotebookTask"
end
