class MetaphorController < ApplicationController
  require "open-uri"
  require "json"


  def find_metaphor
    @metaphor_neighborhood = Neighborhood.where(:id=>params.fetch("query_neighborhood").to_i).at(0) # grab the neighborhood id from the URL
    
    @target_city = City.where(:id=>params.fetch("query_city").to_i).at(0)

    @all_reasons = Reason.where(:neighborhood_id_1=>@metaphor_neighborhood.id) 
    @all_reasons_2 = Reason.where(:neighborhood_id_2=>@metaphor_neighborhood.id)

    # a neighborhood id can show up in one of two columns in a metaphor
    # create a hash for each neighborhood that fills :orig_neighborhood :compared_neighborhood :upvotes :downvotes :net_votes
    # find any reason that includes a @metaphor_neighborhood.id in either column, and make into one big array or hash
    # 
    # remove any reasons that aren't in @target_city
    # take the remaining reasons and tally up total upvotes and downvotes
    #
    list_of_neighborhoods_and_vote_totals = Hash.new

    @result_neighborhood = @all_reasons 

    @target_neighborhood = 0
    @all_reasons.each do |a_reason|
      if Neighborhood.where(:id=>a_reason.neighborhood_id_2).at(0) == 3
        @target_neighborhood = @target_neighborhood + 1
      end
    end
    render({ :template => "show_metaphor.html.erb" })
  end

end
