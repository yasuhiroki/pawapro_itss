# frozen_string_literal: true

module EngineersHelper
  def print_status_rank(status)
    if status >= 0 && status < 20
      'E'
    elsif  status >= 20 && status < 40
      'D'
    elsif  status >= 40 && status < 60
      'C'
    elsif  status >= 60 && status < 80
      'B'
    elsif  status >= 80 && status < 100
      'A'
    end
  end

  def get_status_rank_class(status)
    "status-#{print_status_rank(status).downcase}"
  end
end
