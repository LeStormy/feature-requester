class DashboardController < ApplicationController
  #before_action :authenticate_user!

  def index
    @toto = []
    for counter in 1..48
      @toto.push(counter.to_s)
    end
  end

end
