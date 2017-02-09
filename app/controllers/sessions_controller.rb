class SessionsController < ApplicationController

  def create
    @response = Faraday.post('http://eventful.com/oauth/request_token')
    token = @response.body.split(/\W+/)[1]
    user_data = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(user_data.body)


    # redirect_to dashboard_index_path
  end
end