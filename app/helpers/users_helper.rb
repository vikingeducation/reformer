module UsersHelper

  def validate
    <% unless user.errors[:username].empty? %>
    <div class="error">
     <%= "User #{user.errors[:username].first}" %>
    </div>
  <% end %>
end
