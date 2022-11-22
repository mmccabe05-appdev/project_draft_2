Rails.application.routes.draw do
  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Reason resource:

  # CREATE
  post("/insert_reason", { :controller => "reasons", :action => "create" })
          
  # READ
  get("/reasons", { :controller => "reasons", :action => "index" })
  
  get("/reasons/:path_id", { :controller => "reasons", :action => "show" })
  
  # UPDATE
  
  post("/modify_reason/:path_id", { :controller => "reasons", :action => "update" })
  
  # DELETE
  get("/delete_reason/:path_id", { :controller => "reasons", :action => "destroy" })
  
  # UPVOTE
  get("/modify_reason/upvote/:path_id", { :controller => "reasons", :action => "upvote" })
    # DOWNVOTE
    get("/modify_reason/downvote/:path_id", { :controller => "reasons", :action => "downvote" })
  #------------------------------

  # Routes for the City resource:

  # CREATE
  post("/insert_city", { :controller => "cities", :action => "create" })
          
  # READ
  get("/cities", { :controller => "cities", :action => "index" })
  
  get("/cities/:path_id", { :controller => "cities", :action => "show" })
  
  # UPDATE
  
  post("/modify_city/:path_id", { :controller => "cities", :action => "update" })
  
  # DELETE
  # get("/delete_city/:path_id", { :controller => "cities", :action => "destroy" })

  #------------------------------

  # Routes for the Neighborhood resource:

  # CREATE
  post("/insert_neighborhood", { :controller => "neighborhoods", :action => "create" })
          
  # READ
  get("/neighborhoods", { :controller => "neighborhoods", :action => "index" })
  
  get("/neighborhoods/:path_id", { :controller => "neighborhoods", :action => "show" })
  
  # UPDATE
  
  post("/modify_neighborhood/:path_id", { :controller => "neighborhoods", :action => "update" })
  
  # DELETE
  get("/delete_neighborhood/:path_id", { :controller => "neighborhoods", :action => "destroy" })

  #------------------------------

  get("/", { :controller => "application", :action => "index" })
  get("/metaphor", { :controller => "metaphor", :action => "find_metaphor" })

  get("/twitter", { :controller => "application", :action => "tweet_list"})


end
