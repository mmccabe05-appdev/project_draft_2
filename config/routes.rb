Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "main_page" })



end
