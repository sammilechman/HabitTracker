class Occurrence < ActiveRecord::Base
  belongs_to :habit

  default_scope { order('created_at DESC') }

  include TimeModule

  def formatted_created_at
    formatted_datetime(self.created_at)
  end
end
