FactoryGirl.define do
  factory :photo do
    image { fixture_file_upload(Rails.root.join('assets', 'images', 'rails.png'), 'image/png') }
    active true
    collection_item
  end
end
