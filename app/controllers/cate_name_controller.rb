class CateNameController < ApplicationController
  before_action :validate_token, only: :create

  protect_from_forgery except: :create
  def index
    @cate_names = CateName.all.order(id: :desc)
  end

  def create
    cate_name = CateName.new(cate_name_params)

    if cate_name.valid? && cate_name.save
      redirect_to cate_name_index_path
    else
      render plain: cate_name.errors.full_messages
    end
  end

  private

  def cate_name_params
    params.require(:cate_name).permit(:name, :description)
  end

  def validate_token
    raise 'Invalid token' if params[:token] != ENV['CATE_NAME_TOKEN']
  end
end
