module FactoryGirl::Syntax::Methods
  def photo_image_params
    Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'files', 'rails.png'))
  end
end
