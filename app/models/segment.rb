class Segment < ActiveRecord::Base
  has_many :branches, class_name: "Segment", foreign_key: "parent_id"
  belongs_to :story
  belongs_to :parent, class_name: "Segment"

  before_create :set_index

  def set_index
    self.index = Segment.where("parent_id = ? and story_id = ?", self.parent_id, self.story_id).length
  end

  def ancestors
    parent = self.parent
    parent ? [self] + parent.ancestors : [self]
  end

  def descendants
    child = self.branches.first
    child ? [self] + child.descendants : [self]
  end

end
