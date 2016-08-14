module EngineersHelper
  def print_status_rank(status)
    if 0 <= status && status < 20
      "E"
    elsif  20 <= status && status < 40
      "D"
    elsif  40 <= status && status < 60
      "C"
    elsif  60 <= status && status < 80
      "B"
    elsif  80 <= status && status < 100
      "A"
    end
  end
end
