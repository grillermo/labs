class ScratchController < ApplicationController
  def index
    @scratch = Scratch.last || Scratch.create

    render :show
  end

  def show
    id = params[:id] 
    @scratch = Scratch.find_by(id: id)

    if @scratch
      @scratch
    else
      @scratch = Scratch.create
    end
  end

  def update
    @scratch = Scratch.find(scratch_params[:id])
    @scratch.update(content: scratch_params[:content])

    if @scratch.valid? && @scratch.save
      redirect_to action: :show
    else
      render plain: person.errors.full_messages
    end
  end

  private

  def scratch_params
    params.require(:scratch).permit(:content, :id)
  end
end
