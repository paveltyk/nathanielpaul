module ApplicationHelper
  def set_landing_style
    @landing_style = true
  end

  def landing_images_list
    ['landing-new.png']
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

  def link_to_share_on_pinterest(collection_item, options={})
    url_options = {
        url: collection_item_url(collection_item),
        media: collection_item.active_photo.image_url(:big),
        description: 'Nathaniel Paul collection'
    }
    url = "//pinterest.com/pin/create/button/?#{url_options.to_query}"

    link_to_popup 'Share on Pinterest', url, {popup_width: 750, popup_height: 344}.merge(options)
  end

  def link_to_share_on_facebook(collection_item, options={})
    url_options = {
        u: collection_item_url(collection_item),
    }
    url = "//facebook.com/sharer/sharer.php?#{url_options.to_query}"

    link_to_popup 'Share on Facebook', url, {popup_width: 600, popup_height: 315}.merge(options)
  end

  def link_to_share_on_twitter(collection_item, options={})
    url_options = {
        source: 'webclient',
        text: "Currently reading #{collection_item_url(collection_item)}"
    }
    url = "//twitter.com/intent/tweet?#{url_options.to_query}"

    link_to_popup 'Share on Twitter', url, {popup_width: 730, popup_height: 458}.merge(options)
  end

  def link_to_popup(text, url, options={})
    dimensions = options.extract!(:popup_width, :popup_height)
    height = dimensions[:popup_height] || 200
    width = dimensions[:popup_width] || 200

    link_to text, url, options.merge(data: {popup: true, 'popup-width' => width, 'popup-height' => height}, target: '_blank')
  end
end
