module Api
  module V1
    class PicturesController < ApplicationController

      def index
        render json: base_scope.merge(ideas_filter).merge(limit_filter)
      end

      private

      def base_scope
        Picture.all
      end

      def limit_filter
        return base_scope.limit(4) unless params[:limit].present?
        Picture.limit(params[:limit])
      end

      def ideas_filter
        return base_scope unless params[:ideas].present?
        Picture.with_ideas(JSON.parse(params[:ideas]))
      end
    end
  end
end
