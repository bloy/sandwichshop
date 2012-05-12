# == Schema Information
# Schema version: 20120512160041
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  first_name         :string(255)     not null
#  last_name          :string(255)     not null
#  email              :string(255)     not null
#  crypted_password   :string(255)     not null
#  password_salt      :string(255)     not null
#  persistence_token  :string(255)     not null
#  login_count        :integer         default(0), not null
#  failed_login_count :integer         default(0), not null
#  last_request_at    :datetime
#  current_login_at   :datetime
#  last_login_at      :datetime
#  current_login_ip   :string(255)
#  last_login_ip      :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  admin              :boolean         default(FALSE), not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) do
    user
  end
  it { should have_db_column(:first_name) }
  it { should have_db_column(:last_name) }
  it { should have_db_column(:email) }
  it { should have_db_column(:crypted_password) }
  it { should have_db_column(:password_salt) }
  it { should have_db_column(:persistence_token) }
  it { should have_db_column(:login_count) }
  it { should have_db_column(:failed_login_count) }
  it { should have_db_column(:last_request_at) }
  it { should have_db_column(:current_login_at) }
  it { should have_db_column(:last_login_at) }
  it { should have_db_column(:current_login_ip) }
  it { should have_db_column(:last_login_ip) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:updated_at) }
  it { should have_db_column(:admin).of_type(:boolean).
       with_options(:null => false) }
  it { should have_db_index(:email).unique(true) }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should allow_mass_assignment_of(:first_name) }
  it { should allow_mass_assignment_of(:last_name) }
  it { should allow_mass_assignment_of(:email) }
  it { should_not allow_mass_assignment_of(:crypted_password) }
  it { should_not allow_mass_assignment_of(:password_salt) }
  it { should_not allow_mass_assignment_of(:persistence_token) }
  it { should_not allow_mass_assignment_of(:login_count) }
  it { should_not allow_mass_assignment_of(:failed_login_count) }
  it { should_not allow_mass_assignment_of(:last_request_at) }
  it { should_not allow_mass_assignment_of(:current_login_at) }
  it { should_not allow_mass_assignment_of(:last_login_at) }
  it { should_not allow_mass_assignment_of(:current_login_ip) }
  it { should_not allow_mass_assignment_of(:last_login_ip) }
  it { should_not allow_mass_assignment_of(:created_at) }
  it { should_not allow_mass_assignment_of(:updated_at) }
  it { should_not allow_mass_assignment_of(:admin) }
  it { should respond_to(:full_name) }
  it "should give the full name when asked" do
    user.full_name.should == "#{user.first_name} #{user.last_name}"
  end
end
