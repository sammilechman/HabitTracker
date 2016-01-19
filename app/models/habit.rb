class Habit < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :occurrences, dependent: :destroy

  validates_presence_of :user
  validates_presence_of :title

  # Returns true if occurrence created successfully, false otherwise
  def create_occurrence!
    self.occurrences.create.persisted?
  end

  # Returns true if occurrence deleted successfully, false or nil otherwise
  def delete_most_recent_occurrence!
    self.occurrences.first.try(:destroy).try(:destroyed?)
  end
end
