FactoryGirl.define do
  factory :photo do
    image { photo_image_params }
    active true
    collection_item
  end
end
