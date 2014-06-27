class Segment < ActiveRecord::Base
  has_many :child_segments, class_name: "Segment", foreign_key: "parent_id"
  belongs_to :story
  belongs_to :parent, class_name: "Segment"
end
