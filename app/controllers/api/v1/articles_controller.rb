module Api

  module V1

    class ArticlesController < ApplicationController
      def index
        articles = Article.page(params[:page]).per(5)

        render json: articles
      end

      def image

         article = Article.find(params[:id])
         if article&.image&.attached?
          redirect_to rails_blob_url(article.image)
         else
          head :not_found
         end

      end

      def show
        @article = Article.find(params[:id])

        render json: @article
      end

      def create
        @article = Article.create(title: params[:title], content: params[:content], image: params[:image])

        if @article.save
          render status: :created
        else
           render json: @article.errors, status: :unprocessable_entity
        end
      end

      def update
        @article = Article.find(params[:id])
        @article.title = params[:title]
        @article.content = params[:content]
        @article.image = params[:image]

        @article.save

        render json: @article
      end

      def destroy
        @article = Article.find(params[:id])
        @article.delete

        render status: :deleted
      end

    end
  end
end