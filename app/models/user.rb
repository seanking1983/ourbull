class User < ActiveRecord::Base
  
  
  attr_accessible :name, :email
  
  email_regex = /\A[\w.+\-]+@[a-z.\d\-]+\.edu\z/i
  
  validates :name,    :presence   => true
  validates :email,   :presence   => true,
                      :uniqueness => { :case_sensitive => false },
                      :format     => { :with => email_regex }




end
# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

