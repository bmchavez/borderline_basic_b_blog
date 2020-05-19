class PagesController < ApplicationController
  def about
    @title = 'About Us'
    @content = 'This is the about page'
  end

  def dashboard
    @title = 'dashboard'
    @content = 'This your Dashboard!'
  end

end
