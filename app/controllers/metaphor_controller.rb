class MetaphorController < ApplicationController
  require "open-uri"
  require "json"

  def find_metaphor
    if City.where(:id => params.fetch("query_city").to_i).at(0) == nil 
      redirect_to("/", { :alert => "Gotta choose a city!" })
    else

      # grab the neighborhood id from the URL
      @metaphor_neighborhood = Neighborhood.where(:id => params.fetch("query_neighborhood").to_i).at(0)

      # grab the target city from the URL
      @target_city = City.where(:id => params.fetch("query_city").to_i).at(0)

      # find all reasons where the first or second neighborhood ID matches the @metaphor_neighborhood
      @all_reasons = @metaphor_neighborhood.all_reasons # Reason.where(:neighborhood_id_1 => @metaphor_neighborhood.id).or(Reason.where(:neighborhood_id_2 => @metaphor_neighborhood.id)).all

      #build a dummy variable just to limit the target neighborhoods to ones that have a city id from the target city
      @acceptable_neighborhoods = Neighborhood.where(:city_id => @target_city.id)
      @acceptable_neighborhood_ids = @acceptable_neighborhoods.pluck(:id)

      @target_city_reasons = @metaphor_neighborhood.all_reasons.where(:neighborhood_id_1 => @acceptable_neighborhood_ids).or(@metaphor_neighborhood.all_reasons.where(:neighborhood_id_2 => @acceptable_neighborhood_ids))


      # .or(:neighborhood_id_2=>@acceptable_neighborhood_ids)

      # create an array to receive acceptable neighborhood ids
      @acceptable_neighborhood_ids = Array.new

      # go through the @acceptable_neighborhoods active record relation and push each neighborhood id into an array
      @acceptable_neighborhoods.each do |each_neighborhood|
        @acceptable_neighborhood_ids.push(each_neighborhood.id)
      end

      # make a new variable that *just* receives reasons from the target city by taking
      # the @all_reasons variable and limiting with where() and or()
      # this part of the debug is breaking
      @target_city_reasons = @all_reasons.where(:neighborhood_id_1 => @acceptable_neighborhood_ids).or(Reason.where(:neighborhood_id_2 => @acceptable_neighborhood_ids)).all

      # upvote tally work...
      # total_city_upvotes = [0, 0, 0, 0, 0, 0, 0, 0]
      # total_city_downvotes = [0, 0, 0, 0, 0, 0, 0, 0]
      # total_city_netvotes = [0, 0, 0, 0, 0, 0, 0, 0]

      # @all_reasons.each do |a_reason|
      #   total_city_upvotes[a_reason.city.id.to_i] = total_city_upvotes[a_reason.city.id.to_i] + a_reason.upvotes
      #   total_city_downvotes[a_reason.city.id.to_i] = total_city_upvotes[a_reason.city.id.to_i] + a_reason.downvotes
      # end

      #calculate total netvotes
      # count = 0
      # if count < total_city_upvotes.length
      #   total_city_netvotes[count] = total_city_upvotes[count] - total_city_downvotes[count]
      #   count = count + 1
      # end

      # @target_neighborhood_reasons
      # create a hash for each neighborhood that fills :orig_neighborhood :compared_neighborhood :upvotes :downvotes :net_votes
      # find any reason that includes a @metaphor_neighborhood.id in either column, and make into one big array or hash
      #
      # remove any reasons that aren't in @target_city
      # take the remaining reasons and tally up total upvotes and downvotes
      # similar_neighborhood_upvotes = { "1" => 0, "2" => 0, "3" => 0, "4" => 0 }

      # @all_reasons.each do |a_reason|
      #   if Neighborhood.where(:id=>a_reason.neighborhood_id_2).at(0) == 3
      #     @target_neighborhood = @target_neighborhood + 1
      #   end
      # end

      list_of_neighborhoods_and_vote_totals = Hash.new

      @result_neighborhood = "TBD"

      @target_neighborhood = 0

      render({ :template => "show_metaphor.html.erb" })
    end
  end
end
