class NeighborhoodsController < ApplicationController
  def index
    matching_neighborhoods = Neighborhood.all

    @list_of_neighborhoods = matching_neighborhoods.order({ :created_at => :desc })

    render({ :template => "neighborhoods/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_neighborhoods = Neighborhood.where({ :id => the_id })

    @the_neighborhood = matching_neighborhoods.at(0)

    render({ :template => "neighborhoods/show.html.erb" })
  end

  def create
    the_neighborhood = Neighborhood.new
    the_neighborhood.name = params.fetch("query_name")
    the_neighborhood.city_id = params.fetch("query_city_id")
    the_neighborhood.description = params.fetch("query_description")
    the_neighborhood.wiki_link = params.fetch("query_wiki_link")
    # the_neighborhood.lat = params.fetch("query_lat")
    # the_neighborhood.lng = params.fetch("query_lng")

    if the_neighborhood.valid?
      the_neighborhood.save
      redirect_to("/neighborhoods", { :notice => "Neighborhood created successfully." })
    else
      redirect_to("/neighborhoods", { :alert => the_neighborhood.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_neighborhood = Neighborhood.where({ :id => the_id }).at(0)

    the_neighborhood.name = params.fetch("query_name")
    the_neighborhood.city_id = params.fetch("query_city_id")
    the_neighborhood.description = params.fetch("query_description")
    the_neighborhood.wiki_link = params.fetch("query_wiki_link")
    the_neighborhood.lat = params.fetch("query_lat")
    the_neighborhood.lng = params.fetch("query_lng")

    if the_neighborhood.valid?
      the_neighborhood.save
      redirect_to("/neighborhoods/#{the_neighborhood.id}", { :notice => "Neighborhood updated successfully."} )
    else
      redirect_to("/neighborhoods/#{the_neighborhood.id}", { :alert => the_neighborhood.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_neighborhood = Neighborhood.where({ :id => the_id }).at(0)

    the_neighborhood.destroy

    redirect_to("/neighborhoods", { :notice => "Neighborhood deleted successfully."} )
  end
end
