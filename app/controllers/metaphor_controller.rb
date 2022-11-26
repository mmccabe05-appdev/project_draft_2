class MetaphorController < ApplicationController
  require "open-uri"
  require "json"


  def find_metaphor
    @metaphor_neighborhood = Neighborhood.where(:id=>params.fetch("query_neighborhood").to_i).at(0) # grab the neighborhood id from the URL
    
    @target_city = City.where(:id=>params.fetch("query_city").to_i).at(0)

    all_reasons = Reason.where(:neighborhood_id_1=>@metaphor_neighborhood.id)


    @result_neighborhood = "TBD"

    render({ :template => "show_metaphor.html.erb" })
  end

end
