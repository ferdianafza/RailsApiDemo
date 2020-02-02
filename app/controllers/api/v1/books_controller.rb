module Api

  module V1

    class BooksController < ApplicationController

      def index
        @books = Book.all

        render json: @books
      end

      def create
        @book = Book.create(name: params[:name], publisher: params[:publisher])
        if @book.save
           render status: :created
        else
           render json: @book.errors, status: :unprocessable_entity
        end
      end

      def show
        @book = Book.find(params[:id])

        render json: @book
      end

      def update
        @book = Book.find(params[:id])

        @book.name = params[:name]
        @book.publisher = params[:publisher]
        @book.save

        render json: @book
      end

      def destroy
        @book = Book.find(params[:id])
        @book.delete

        render status: :deleted
      end

    end
  end

end