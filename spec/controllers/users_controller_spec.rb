require 'spec_helper'

describe UsersController do
  render_views
  
  # new
  
  it "should be successful" do
    get :new
    response.should be_success
  end
  
  it "should have the right title" do
    get :new
    response.should have_selector('title', :content => "Sign Up")
  end

end
