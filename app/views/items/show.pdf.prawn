@item.photos.each do |photo|
  pdf.image StringIO.new(photo.image.versions[:medium].read)
end
