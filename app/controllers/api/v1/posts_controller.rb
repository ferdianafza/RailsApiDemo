module Api
  module V1
    class PostsController < ApplicationController
      include ActionController::HttpAuthentication::Token::ControllerMethods
      before_action :authenticate, only: [:create]

      def create
          @post = @user.posts.new(post_params)
          if @post.save
              render json: @post, status: :created
          else
              render json: @post.errors, status: :unprocessable_entity
          end
      end

      def show
        @post = Post.find(params[:id])

        render @post
      end

      def update
         @post = Post.find(params[:id])
         @post.title = params[:title]
         @post.body = params[:body]
         @post.save

         render @post
      end

      def destroy
        @post = Post.find(params[:id])
        @post.delete

        render @post
      end


       def index

        posts = Post.page(params[:page]).per(5)

            render json: posts,
                   meta: {
                     pagination: {
                       per_page: 5,
                       total_pages: 10,
                       total_objects: 150
                     }
                   }
      # @posts = Post.order('created_at DESC')

      # render json: @posts
      end

      private

      def authenticate
          authenticate_or_request_with_http_token do |token, options|
            @user = User.find_by(token: token)
          end
      end
    end
  end
end