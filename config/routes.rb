Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "index" })
  get("/metaphor", { :controller => "metaphor", :action => "find_metaphor" })

  get("/twitter", { :controller => "application", :action => "tweet_list"})


end
