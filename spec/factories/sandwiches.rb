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
  factory :sandwich, :aliases => [ :sandwich_with_toppings ] do
    ordered_at { 2.minutes.ago }
    association :ordered_by, :factory => :user
    completed_at nil
    completed_by nil
    association :bread
    association :sandwich_size
    topping_ids {
      [:turkey, :cheddar, :lettuce, :mustard].map{|x| FactoryGirl.create(x).id }
    }
    factory :completed_sandwich do
      completed_at { 1.minute.ago }
      association :completed_by, :factory => :admin
    end
  end
end
