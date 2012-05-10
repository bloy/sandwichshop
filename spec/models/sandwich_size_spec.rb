# == Schema Information
# Schema version: 20120510033440
#
# Table name: sandwich_sizes
#
#  id   :integer         not null, primary key
#  name :string(255)     not null
#

require 'spec_helper'

describe SandwichSize do
  it { should have_db_column(:name) }
  it { should validate_presence_of(:name) }
end
