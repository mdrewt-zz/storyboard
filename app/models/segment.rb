class Segment < ActiveRecord::Base
  has_many :branches, class_name: "Segment", foreign_key: "parent_id"
  belongs_to :story
  belongs_to :parent, class_name: "Segment"

  before_create :set_index

  def set_index
    self.index = Segment.where("parent_id = ? and story_id = ?", self.parent_id, self.story_id).length
  end

  def self.descended_from(parent_id, index = 0)
    seg = Segment.where(parent_id: parent_id)
    seg = seg[index % seg.length]
    children = seg.branches
    children.length > 0 ? [seg] + Segment.descended_from(seg.id) : [seg]
  end

end
