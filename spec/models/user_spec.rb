require 'spec_helper'

describe User do
  
  
  before(:each) do
    @attr = { :name => "Example User", 
              :email => "user@abc.edu" }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  
  # name
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  
  # email
  
  it "should require a email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
  
  it "should reject duplicate email" do
    User.create!(@attr)
    duplicate_email_user = User.new(@attr)
    duplicate_email_user.should_not be_valid
  end
  
  it "should reject email identical up to case" do
    User.create!(@attr)
    upcased_email = @attr[:email].upcase
    case_duplicate_email_user = User.new(@attr.merge(:email => upcased_email))
    case_duplicate_email_user.should_not be_valid
  end
  
  
  
  
  
  
  
  
  
  
  
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

