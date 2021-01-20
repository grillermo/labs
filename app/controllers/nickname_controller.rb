class NicknameController < ApplicationController
  protect_from_forgery except: :create

  def new

  end

  def create
    nickname = Nickname.new(nickname_params)

    if nickname.valid? && nickname.save
      redirect_to person_path(nickname.person)
    else
      render plain: nickname.errors.full_messages
    end
  end

  private

  def nickname_params
    params.require(:nickname).permit(:name, :description, :people_id)
  end
end
