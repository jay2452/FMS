module FeedbacksHelper

  def fetch_criteria_name(criteria_id)
    Criterium.find(criteria_id).title
  end

end
