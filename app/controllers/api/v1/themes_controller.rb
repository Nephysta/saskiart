module Api
  module V1
    class ThemesController < ApplicationController
      def show
        render json: Theme.new, serializer: ThemesSerializer
      end
    end
  end
end
