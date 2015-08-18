class Task < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :description, :priority, :due_date

  scope :completed, -> { where(completed: true) }
  scope :incompleted, -> { where(completed: false) }
end