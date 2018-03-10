module Api
  module V1
    class PicturesController < ApplicationController
      def index
        render json: payload, each_serializer: PicturesSerializer
      end

      private

      def payload
        base_scope.merge(ideas_filter).merge(limit_filter)
      end

      def base_scope
        Picture.order('created_at DESC')
      end

      def limit_filter
        return base_scope.limit(4) unless params[:limit].present? && params[:limit].to_i < 4
        Picture.limit(params[:limit])
      end

      def ideas_filter
        return base_scope unless params[:ideas].present?
        Picture.with_ideas(params[:ideas])
      end
    end
  end
end
