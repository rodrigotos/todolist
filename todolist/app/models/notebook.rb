class Notebook < ApplicationRecord
  has_many :notebooktasks, class_name: "NotebookTask"
  has_many :tasks, through: :notebooktasks
  belongs_to :user, class_name: "User", foreign_key: "user_id"

    validates :name , presence: true
end
