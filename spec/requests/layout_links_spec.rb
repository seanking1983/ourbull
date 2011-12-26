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

# footer links

  it "should have working links on footer" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About Us")
    click_link "Contact"
    response.should have_selector('title', :content => "Contact Us")
  end


# header links

  it "should have working links on header" do
    visit root_path
    click_link "Home"
    response.should have_selector('title', :content => "Home")
    click_link "Help"
    response.should have_selector('title', :content => "Help")
    click_link "Sign Up"
    response.should have_selector('title', :content => "Sign Up")    
  end





end
