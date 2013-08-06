class BootstrapBreadcrumbsBuilder < BreadcrumbsOnRails::Breadcrumbs::Builder
  def render
    @context.content_tag(:ul, class: 'breadcrumb') do
      @elements.collect do |element|
        render_element(element)
      end.join.html_safe
    end
  end

  def render_element(element)
    active = element.path.nil? || @context.current_page?(compute_path(element))
    divider = @context.content_tag(:span, '/'.html_safe, class: 'divider') unless active

    @context.content_tag(:li, :class => ('active' if active)) do
      content = if element.path.nil?
        compute_name(element)
      else
        @context.link_to_unless_current(compute_name(element), compute_path(element), element.options)
      end

      content + (divider || '')
    end
  end
end
