require 'spec_helper'

describe HomeController do
  render_views


# contact

    it "should be successful" do
      get :contact
      response.should be_success
    end
    
    it "should have the right title" do
      get :contact
      response.should have_selector('title', :content => "Contact Us")
    end
  
# about

    it "should be successful" do
      get :about
      response.should be_success
    end
    
    it "should have the right title" do
      get :about
      response.should have_selector('title', :content => "About Us")
    end

# index

    it "should be success" do
      get :index
      response.should be_success
    end
    
    it "should have the right title" do
      get :index
      response.should have_selector('title', :content => "Home")
    end
  
# help

    it "should be success" do
      get :help
      response.should be_success
    end
    
    it "should have the right title" do
      get :help
      response.should have_selector('title', :content => "Help")
    end

end

















