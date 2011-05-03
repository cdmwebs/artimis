module Artimis
  class Camera
    class << self
      attr_writer :url

      def url
        @url ||= list_url
      end

      def all
        page.links_with(:href => /\/camera\//)
      end

      def find(params = {})
        if params[:description]
          page.links_with(:text => params[:description])
        elsif params[:id]
          link = page.link_with(:href => /camera#{params[:id]}/)
          camera_page = link.click
          new(camera_page, :url => link.href, :description => link.text)
        end
      end

      private

      def list_url
        url = 'http://www.artimis.org/cameraselect.php'
      end

      def agent
        @agent ||= Mechanize.new
      end

      def page
        @page ||= agent.get(url)
      end
    end

    attr_reader :url, :description, :image_url

    def initialize(page, params = {})
      self.description = params[:description] || page.title
      self.url = params[:url] || page.title

      page.images.each do |i|
        self.image_url = i.url if i.node.attributes["name"]
      end
    end

    private

    def url=(url)
      @url = url
    end

    def description=(description)
      @description = description
    end

    def image_url=(image_url)
      @image_url = image_url
    end
  end
end
