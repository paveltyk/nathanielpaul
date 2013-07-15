describe "Root" do
  describe "GET /landing" do
    it "display landing page" do
      get landing_path
      response.status.should eq 200
    end
  end

  describe "GET /about" do
    it "display about page" do
      get about_path
      response.status.should eq 200
    end
  end

  describe "GET /feedback/new" do
    it "display contact page" do
      get new_feedback_path
      response.status.should eq 200
    end
  end
end
