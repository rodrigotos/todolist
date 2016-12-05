class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :taskusers, class_name: "UserTask"
  has_many :tasks, through: :taskusers
  has_many :notebooks, class_name: "Notebook"

end
