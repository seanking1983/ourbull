class User < ActiveRecord::Base
  
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  
  email_regex = /\A[\w.+\-]+@[a-z.\d\-]+\.edu\z/i
  password_regex = /^(?=.*\d)(?=.*([a-z]|[A-Z]))([\x20-\x7E])+$/
  
  validates :name,    :presence   => true
  validates :email,   :presence   => true,
                      :uniqueness => { :case_sensitive => false },
                      :format     => { :with => email_regex,
                                       :message => "You must register with a valid .edu email account" }
  validates :password, :presence     => true,
                       :confirmation => true,
                       :length       => { :within => 8..40 },
                       :format       => { :with => password_regex,
                                          :message => "The password must contain at least a number and a letter." }



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

