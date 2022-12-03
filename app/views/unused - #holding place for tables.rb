#holding place for tables

  <% @all_reasons.all.order(:upvotes=>:desc).each do |a_reason| %>
    <tr>

    <!-- working on pulling the city name through the reason... --> 
    <!-- <#%= City.where(:id=>Neighborhood.where(:city_id=>a_reason.neighborhood_id_2)).at(0) %> -->
  <!-- <#%= a_reason.neighborhood_id_2.neighborhood.city %> -->

      <td>test<%= Neighborhood.where(:id=>a_reason.neighborhood_id_2).at(0).name %> in <%= a_reason.city.name %></td>
      <td><%= a_reason.description %></td>
      <td><%= a_reason.upvotes %> (+1)</td>
        <td> (-1)</td>
        <td><a href="/reasons/<%= a_reason.id %>">
            Show details
          </a></td>
        </tr>
  <% end %>


  <% @all_reasons.all do |a_reason| %>
    <tr>

    <!-- working on pulling the city name through the reason... --> 
    <!-- <#%= City.where(:id=>Neighborhood.where(:city_id=>a_reason.neighborhood_id_2)).at(0) %> -->
  <!-- <#%= a_reason.neighborhood_id_2.neighborhood.city %> -->

      <td><%= Neighborhood.where(:id=>a_reason.neighborhood_id_2).at(0).name %> in <%= a_reason.city.name %></td>
      <td><%= a_reason.description %></td>
      <td><%= a_reason.upvotes %> (+1)</td>
        <td> (-1)</td>
        <td><a href="/reasons/<%= a_reason.id %>">
            Show details
          </a></td>
        </tr>
  <% end %>
