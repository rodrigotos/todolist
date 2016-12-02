class Notebook < ApplicationRecord
  has_many :tasks, class_name: "NotebookTask"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
