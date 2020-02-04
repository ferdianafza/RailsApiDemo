class ArticleSerializer < ActiveModel::Serializer
   include Rails.application.routes.url_helpers
  attributes :id, :title, :content, :image

  def image
        rails_blob_path(object.image, only_path: true) if object.image.attached?
    end
end
