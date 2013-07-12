module ApplicationHelper
  def set_landing_style
    @landing_style = true
  end

  def landing_style?
    !!@landing_style
  end
end
