require 'helper'

describe Artimis::Camera do
  describe ".all" do
    before do
      @cameras = Artimis::Camera.all
    end

    it "returns a list of cameras" do
      @cameras.wont_be_nil
    end

    it "must include links to camera only" do
      @cameras.first.href.must_match /\/camera\//
    end
  end

  describe ".find" do
    describe "by description" do
      before do
        @cameras = Artimis::Camera.find(:description => /Hamilton/)
      end

      it "returns an array of cameras" do
        @cameras.must_be_instance_of Array
      end

      it "returns only cameras that match 'Hamilton'" do
        @cameras.first.description.must_match /Hamilton/i
      end
    end

    describe "by number" do
      before do
        @camera = Artimis::Camera.find(:id => 23)
      end

      it "returns a single camera" do
        @camera.description.must_match /brent spence/i
      end
    end
  end

  describe "creating a camera" do
    before do
      @agent = Mechanize.new
      @page = @agent.get("http://www.artimis.org/camera/camera23.php")
      @camera = Artimis::Camera.new(@page)
    end

    it "assigns the image_url" do
      @camera.image_url.wont_be_nil
    end
  end

  describe "an instance" do
    before do
      @camera = Artimis::Camera.find(:id => 23)
    end

    it "has a URL" do
      @camera.url.must_match /\/camera/
    end

    it "has an image_url" do
      @camera.image_url.wont_be_nil
      @camera.image_url.must_match /\.jpg$/
    end
  end
end
