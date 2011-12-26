require 'spec_helper'

describe "LayoutLinks" do


# home

  it "should have home page at /" do
    get '/'
    response.should be_success
  end
  
# contact

  it "should have contact page at /contact" do
    get '/contact'
    response.should have_selector('title', :content => "Contact Us")
  end

# about

  it "should have about page at /about" do
    get '/about'
    response.should have_selector('title', :content => "About Us")
  end


# help

  it "should have help page at /help" do
    get '/help'
    response.should have_selector('title', :content => "Help")
  end








end
