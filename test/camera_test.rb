require 'helper'

describe Artimis::Camera do
  describe ".all" do
    before do
      @cameras = Artimis::Camera.all
    end

    it "should return a list of cameras" do
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

      it "should return an array of cameras" do
        @cameras.must_be_instance_of Array
      end

      it "should have cameras that only match 'Hamilton'" do
        @cameras.first.text.must_match /Hamilton/i
      end
    end

    describe "by number" do
      before do
        @camera = Artimis::Camera.find(:id => 23)
      end

      it "should return a single camera" do
        @camera.description.must_match /brent spence/i
      end
    end
  end

  describe "creating a camera" do
    before do
      @agent = Mechanize.new
      @file = "file://#{File.join(File.expand_path(File.dirname(__FILE__)), "fixtures", "camera132.html")}"
      @page = @agent.get(@file)
      @camera = Artimis::Camera.new(@page)
    end

    it "should assign the image_url" do
      @camera.image_url.wont_be_nil
    end
  end

  describe "an instance" do
    before do
      @camera = Artimis::Camera.find(:id => 23)
    end

    it "should have an url" do
      @camera.url.must_match /\/camera/
    end

    it "should have an image_url" do
    end
  end
end
