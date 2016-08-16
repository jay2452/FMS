class FeedFormController < ApplicationController
  before_action :authenticate_user!

  def index
    @criterias = Criterium.all

    @criteria_count = @criterias.count
  end

  def thankyou
    
  end
end
