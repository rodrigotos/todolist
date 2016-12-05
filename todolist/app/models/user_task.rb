class UserTask < ApplicationRecord
  belongs_to :task, class_name: "Task", foreign_key: "task_id"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
