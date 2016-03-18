class Occurrence < ActiveRecord::Base
  belongs_to :habit
  validates :habit, presence: :true

  has_one :user, through: :habit
  validates :user, presence: :true

  # .first == most recently added occurrence
  default_scope { order('created_at DESC') }

  include TimeModule

  def readable_created_at
    readable_datetime(self.created_at)
  end
end
