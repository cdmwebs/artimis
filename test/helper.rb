require 'bundler/setup'
require 'minitest/spec'
require 'turn'
require 'artimis'
require 'webmock'
include WebMock::API

# Fetch a page with:
# `curl -is www.example.com > /tmp/example_curl_-is_output.txt`

class MiniTest::Unit::TestCase
  def setup
    stub_camera_list
    stub_camera
  end

  def stub_camera_list
    all_cameras = File.new('test/fixtures/cameraselect.txt')
    stub_request(:get, "http://www.artimis.org/cameraselect.php").to_return(all_cameras)
  end

  def stub_camera(id = 99)
    single_camera = File.new("test/fixtures/camera#{id}.txt")
    stub_request(:get, %r|http://www.artimis.org/camera/camera\d{1,3}.php|).to_return(single_camera)
  end
end
