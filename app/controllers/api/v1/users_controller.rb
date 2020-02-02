module Api

    module V1

        class UsersController < ApplicationController

          def index
            @users = User.all

            render json: @users
          end

           def show
             @user = User.find(params[:id])

             render json: @user
           end
          def create
              @user = User.create(name: params[:name])
              if @user.save
                render status: :created
              else
                render json: @user.errors, status: :unprocessable_entity
              end
          end

           def update
             @user = User.find(params[:id])
             @user.name = params[:name]
             @user.save

             render json: @user
           end

          def destroy
             @user = User.find(params[:id])
             @user.delete

             render status: :deleted
           end

          private

          def user_params
              params.require(:user).permit(:name)
          end

        end

    end

end