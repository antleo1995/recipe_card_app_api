# frozen_string_literal: true

class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]

# GET /pictures
# GET /pictures.json
def index
  @pictures = Picture.all

  render json: @pictures
end

# GET /pictures/1
# GET /pictures/1.json
def show
  render json: @picture
end

# POST /pictures
# POST /pictures.json
def create
  @picture = Picture.new(picture_params)

  if @picture.save
    render json: @picture, status: :created, location: @picture
  else
    render json: @picture.errors, status: :unprocessable_entity
  end
end

# PATCH/PUT /pictures/1
# PATCH/PUT /pictures/1.json
def update
  @picture = Picture.find(params[:id])

  if @picture.update(picture_params)
    head :no_content
  else
    render json: @picture.errors, status: :unprocessable_entity
  end
end

# DELETE /pictures/1
# DELETE /pictures/1.json
def destroy
  @picture.destroy

  head :no_content
end

  private

def set_picture
  @picture = Picture.find(params[:id])
end

def picture_params
  params.require(:picture).permit(:url, :recipe_id)
end
end
