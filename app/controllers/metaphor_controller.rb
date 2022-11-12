class MetaphorController < ApplicationController
  require "open-uri"
  require "json"
  # requirement below to use the Twitter API when I figure out some pieces to make it work
  # require "typhoeus"

  def find_metaphor
    render({ :template => "show_metaphor.html.erb" })
  end

end
