class Story < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, presence: true
  validates :summary, presence: true
  has_many :segments
  belongs_to :user

  def starting_segments
    self.segments
  end
end
