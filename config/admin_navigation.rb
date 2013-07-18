# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav pull-right'

    primary.item :collections, 'Collections Management', admin_collections_path
    primary.item :frontend, 'Frontend', root_path
  end
end
