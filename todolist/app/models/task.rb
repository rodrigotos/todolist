class Task < ApplicationRecord
  has_many :notebooktasks, class_name: "NotebookTask"
  has_many :notebooks, through: :notebooktasks
  has_many :taskusers, class_name: "UserTask"
  has_many :users, through: :taskusers

end
