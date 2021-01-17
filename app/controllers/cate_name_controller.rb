class CateNameController < ApplicationController
  before_action :validate_token, only: :create

  protect_from_forgery except: :create
  def index
    @cate_names = CateName.all
  end

  def create
    cate_name = CateName.new(cate_name_params)

    if cate_name.valid? && cate_name.save
      render :json => cate_name.to_json
    else
      render :json => { :errors => cate_name.errors.full_messages }
    end
  end

  private

  def cate_name_params
    params.permit(:name, :description)
  end

  def validate_token
    raise 'Invalid token' if params[:token] != ENV['CATE_NAME_TOKEN']
  end
end
