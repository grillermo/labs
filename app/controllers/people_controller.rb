class PeopleController < ApplicationController
  def index
    @people = Person.all
  end

  def show
    @person = Person.friendly.find(params[:id])
  end

  def create
    person = Person.new(person_params)

    if person.valid? && person.save
      redirect_to people_path
    else
      render plain: person.errors.full_messages
    end
  end

  private

  def person_params
    params.require(:person).permit(:name)
  end
end
