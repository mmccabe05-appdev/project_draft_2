class ReasonsController < ApplicationController
  def index
    matching_reasons = Reason.all

    @list_of_reasons = matching_reasons.order({ :created_at => :desc })

    render({ :template => "reasons/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reasons = Reason.where({ :id => the_id })

    @the_reason = matching_reasons.at(0)

    render({ :template => "reasons/show.html.erb" })
  end

  def create
    the_reason = Reason.new
    the_reason.user_id = @current_user.id
    the_reason.description = params.fetch("query_description")
    the_reason.link = params.fetch("query_link")
    # the_reason.upvotes = params.fetch("query_upvotes")
    # the_reason.downvotes = params.fetch("query_downvotes")
    the_reason.neighborhood_id_1 = params.fetch("query_neighborhood_id_1")
    the_reason.neighborhood_id_2 = params.fetch("query_neighborhood_id_2")

    if the_reason.valid?
      the_reason.save
      redirect_to("/reasons", { :notice => "Reason created successfully." })
    else
      redirect_to("/reasons", { :alert => the_reason.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_reason = Reason.where({ :id => the_id }).at(0)

    the_reason.user_id = params.fetch("query_user_id")
    the_reason.description = params.fetch("query_description")
    the_reason.link = params.fetch("query_link")
    # the_reason.upvotes = params.fetch("query_upvotes")
    # the_reason.downvotes = params.fetch("query_downvotes")
    the_reason.neighborhood_id_1 = params.fetch("query_neighborhood_id_1")
    the_reason.neighborhood_id_2 = params.fetch("query_neighborhood_id_2")

    if the_reason.valid?
      the_reason.save
      redirect_to("/reasons/#{the_reason.id}", { :notice => "Reason updated successfully."} )
    else
      redirect_to("/reasons/#{the_reason.id}", { :alert => the_reason.errors.full_messages.to_sentence })
    end
  end

  def upvote
    the_id = params.fetch("path_id")
    the_reason = Reason.where({ :id => the_id }).at(0)
    the_reason.upvotes = the_reason.upvotes.to_i + 1

    if the_reason.valid?
      the_reason.save
      redirect_to("/reasons", { :notice => "Upvote received."})
    else
      redirect_to("/reasons", { :alert => the_reason.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_reason = Reason.where({ :id => the_id }).at(0)

    the_reason.destroy

    redirect_to("/reasons", { :notice => "Reason deleted successfully."} )
  end
end
