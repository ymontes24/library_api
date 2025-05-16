class Api::V1::AuthorsController < ApplicationController
    before_action :set_author, only: [:show, :update, :destroy]

    # GET /api/v1/authors
    def index
        @authors = Author.all
        render json: @authors
    end

    # GET /api/v1/authors/:id
    def show
        render json: @author
    end

    # POST /api/v1/authors
    def create
        @author = Author.new(author_params)
        if @author.save
            render json: @author, status: :created
        else
            render json: @author.errors, status: :unprocessable_entity
        end
    end

    # PATCH/PUT /api/v1/authors/:id
    def update
        if @author.update(author_params)
            render json: @author
        else
            render json: @author.errors, status: :unprocessable_entity
        end
    end

    # DELETE /api/v1/authors/:id
    def destroy
        @author.destroy
        head :no_content
    end

    private
      def set_author
        @author = Author.find(params[:id])
      end

      def author_params
        params.require(:author).permit(:name, :biography, :birth_date)
      end
end
