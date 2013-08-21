@item.photos.each do |photo|
  pdf.image "#{Rails.root}/public"+photo.image_url, :width => 450
end