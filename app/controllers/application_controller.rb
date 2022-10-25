class ApplicationController < ActionController::Base
  def main_page
      render({ :template => "main_page.html.erb" })
  end

end
