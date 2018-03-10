module Api
  module V1
    class ThemesSerializer < ActiveModel::Serializer
      attributes :id, :text

      def id
        object.id
      end

      def text
        object.text
      end
    end
  end
end
