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

FactoryGirl.define do
  factory :user do
    first_name "Charlie"
    last_name "Customer"
    sequence :email do |n|
      "charlie#{n}@example.com"
    end
    admin false
    password "changeme"
    password_confirmation "changeme"
    factory :admin do
      first_name "Alice"
      last_name "Admin"
      sequence :email do |n|
        "admin#{n}@example.com"
      end
      admin true
    end
  end
end
