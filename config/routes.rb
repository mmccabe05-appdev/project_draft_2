Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "main_page" })
  get("/twitter", { :controller => "application", :action => "tweet_list"})


end
