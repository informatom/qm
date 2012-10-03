module BusinessProcessesHelper

  def btnclass(color)
    case color
      when "rot" then "btn-danger"
      when "blau" then "btn-primary"
      when "weiss" then ""
      when "hellblau" then "btn-info"
      when "gruen" then "btn-success"
      when "gelb" then "btn-warning"
      when "schwarz" then "btn-inverse"
      else "btn-link"
    end
  end
end
