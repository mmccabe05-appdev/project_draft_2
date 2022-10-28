class ApplicationController < ActionController::Base
  require "open-uri"
  require "json"

  def main_page
    render({ :template => "main_page.html.erb" })
  end

  def tweet_list
    gmaps_key = ENV.fetch("GMAPS_KEY")

    twitter_api_key = ENV.fetch("TWITTER_API_KEY")
    # twitter_secret_key = ENV.fetch("TWITTER_SECRET_KEY")
    # twitter_bearer_token = ENV.fetch("TWITTER_BEARER_TOKEN")
    render({ :template => "twitter.html.erb" })
  end
end
