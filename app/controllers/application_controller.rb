class ApplicationController < ActionController::Base
  before_action(:load_current_user)
  
  # Uncomment line 5 in this file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

  require "open-uri"
  require "json"
  # requirement below to use the Twitter API when I figure out some pieces to make it work
  # require "typhoeus"

  def index
    render({ :template => "main_page.html.erb" })
  end

  def tweet_list
    gmaps_key = ENV.fetch("GMAPS_KEY")

    twitter_api_key = ENV.fetch("TWITTER_API_KEY")
    twitter_secret_key = ENV.fetch("TWITTER_SECRET_KEY")
    bearer_token = ENV.fetch("TWITTER_BEARER_TOKEN")
    
    # commenting out everything for now, but has some of the basic components will eventually need to display some lists
    # list_id = ""

    # id = "208098033"
    # url = "https://api.twitter.com/2/lists/#{id}"

    # params = {
    #   # Tweet fields are adjustable.
    #   # Options include:
    #   # attachments, author_id, context_annotations,
    #   # conversation_id, created_at, entities, geo, id,
    #   # in_reply_to_user_id, lang, non_public_metrics, organic_metrics,
    #   # possibly_sensitive, promoted_metrics, public_metrics, referenced_tweets,
    #   # source, text, and withheld
    #   "tweet.fields": "lang,author_id",
    # }

    # def list_tweets(url, bearer_token, params)
    #   options = {
    #     method: "get",
    #     headers: {
    #       "User-Agent": "v2ListTweetsLookupRuby",
    #       "Authorization": "Bearer #{bearer_token}",
    #     },
    #     params: params,
    #   }

    #   request = Typhoeus::Request.new(url, options)
    #   response = request.run

    #   return response
    # end

    # response = list_tweets(url, bearer_token, params)
    # # puts response.code, JSON.pretty_generate(JSON.parse(response.body))

    render({ :template => "twitter.html.erb" })
  end
end
