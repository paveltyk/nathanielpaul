FactoryGirl.define do
  factory :collection_item do
    collection

    photos_attributes { [:image => photo_image_params] }
  end
end
