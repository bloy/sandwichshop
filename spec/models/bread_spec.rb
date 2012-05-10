# == Schema Information
# Schema version: 20120510032209
#
# Table name: breads
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)     not null
#

require 'spec_helper'

describe Bread do
  it { should have_db_column(:name) }
  it { should have_db_column(:description) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
