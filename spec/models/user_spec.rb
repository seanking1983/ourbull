require 'spec_helper'

describe User do
  
  
  before(:each) do
    @attr = { :name => "Example User", 
              :email => "user@abc.edu",
              :password => "abcd1234",
              :password_confirmation => "abcd1234" }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  
  # name general
  
  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end
  
  
  # email general
  
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
  
  
  # email format
  
  it "should accept valid email address" do
    addresses = %w[abc@hawaii.edu THE_USER@harvard.edu random.person@XXX.edu sdbfn-ebrtme@hij.abc.edu user+name@bar.edu sadf@ha.edu sdhj@3com.edu fsdhfj@ffo-df.edu]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
  
  it "should reject invalid email address" do
    addresses = %w[abc@edu THE_USER@harvard. random.person@ abc-def@hij.com random@random.org]
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should_not be_valid
    end
  end
  
  
  
  # password
  
  describe "password" do
    before(:each) do
      @user = User.new(@attr)
    end
    
    # password and confirmation presence, matching
    it "should respond to password attribute" do
      @user.should respond_to(:password)
    end
    
    it "should respond to password_confirmation attribute" do
      @user.should respond_to(:password_confirmation)
    end
    
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end
    
    it "should require a matching password" do
      User.new(@attr.merge(:password_confirmation => "invalid")).should_not be_valid
    end
    
    # password and confirmation length
    
    it "should reject short password" do
      short = "a"*5
      User.new(@attr.merge(:password => short, :password_confirmation => short)).should_not be_valid
    end
    
    it "should reject long password" do
      long = "a"* 41
      User.new(@attr.merge(:password => long, :password_confirmation => long)).should_not be_valid
    end
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

