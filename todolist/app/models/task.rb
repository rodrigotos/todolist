class Task < ApplicationRecord
  has_many :notebooktasks, class_name: "NotebookTask"
  has_many :notebooks, through: :notebooktasks
  has_many :taskusers, class_name: "UserTask"
  has_many :users, through: :taskusers

  accepts_nested_attributes_for :notebooktasks
  accepts_nested_attributes_for :taskusers

end
