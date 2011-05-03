require 'bundler/setup'
require 'minitest/autorun'
require 'turn'
require 'fakeweb'
require 'artimis'

FakeWeb.allow_net_connect = false

cameras_url = 'http://www.artimis.org/cameraselect.php'
request  = `curl -is #{cameras_url}`
FakeWeb.register_uri(:get, cameras_url, :response => request)

camera_url = 'http://www.artimis.org/camera/camera23.php'
request = `curl -is #{camera_url}`
FakeWeb.register_uri(:get, camera_url, :response => request)
