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

FactoryGirl.define do
  factory :sandwich do
    ordered_at "2012-05-09 23:16:05"
    association :ordered_by, :factory => :user
    completed_at nil
    completed_by nil
    bread
    sandwich_size
  end
end
