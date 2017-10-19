module GallaryController
  extend ActiveSupport::Concern
  included do
    def index
      @documents = Document.all
    end
  end
end