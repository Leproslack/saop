module ApplicationHelper
  def rate_to_percent(rate, score)
    if rate != 0
      result = (rate.to_f / score.to_f * 100).round
    end
  end
end
