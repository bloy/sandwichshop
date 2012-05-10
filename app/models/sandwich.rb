# == Schema Information
# Schema version: 20120510041605
#
# Table name: sandwiches
#
#  id               :integer         not null, primary key
#  ordered_at       :datetime        not null
#  completed_at     :datetime
#  ordered_by_id    :integer         not null
#  completed_by_id  :integer
#  bread_id         :integer         not null
#  sandwich_size_id :integer         not null
#
# Indexes
#
#  index_sandwiches_on_sandwich_size_id  (sandwich_size_id)
#  index_sandwiches_on_bread_id          (bread_id)
#  index_sandwiches_on_completed_by_id   (completed_by_id)
#  index_sandwiches_on_ordered_by_id     (ordered_by_id)
#

class Sandwich < ActiveRecord::Base
  belongs_to :ordered_by, :class_name => "User"
  belongs_to :completed_by, :class_name => "User"
  belongs_to :bread
  belongs_to :sandwich_size
  has_and_belongs_to_many :toppings
  attr_accessible :completed_at, :ordered_at
  validates_presence_of :ordered_at, :ordered_by_id,
    :bread_id, :sandwich_size_id

  def open?
    self.completed_at == nil
  end

  def status
    self.open? ? "OPEN" : "CLOSED"
  end
end
