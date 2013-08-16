module ApplicationHelper
  def set_landing_style
    @landing_style = true
  end

  def landing_style?
    !!@landing_style
  end

  def set_fixed_layout
    @fixed_layout = true
  end

  def fixed_layout?
    !!@fixed_layout
  end

  def breadcrumbs_menu
    yield if block_given?

    render_breadcrumbs(builder: BootstrapBreadcrumbsBuilder)
  end
end
