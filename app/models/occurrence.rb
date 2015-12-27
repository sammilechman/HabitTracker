class Occurrence < ActiveRecord::Base
  belongs_to :habit

  default_scope { order('created_at DESC') }

  include TimeModule

  def readable_created_at
    readable_datetime(self.created_at)
  end
end
