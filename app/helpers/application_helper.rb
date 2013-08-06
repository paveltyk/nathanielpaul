module ApplicationHelper
  def set_landing_style
    @landing_style = true
  end

  def landing_style?
    !!@landing_style
  end

  def breadcrumbs_menu
    yield if block_given?

    render_breadcrumbs(builder: BootstrapBreadcrumbsBuilder)
  end
end
