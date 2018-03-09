module Api
  module V1
    class PicturesSerializer < ActiveModel::Serializer
      attributes :id, :data, :theme

      def theme
        Theme.new(picture: object).text
      end
    end
  end
end
