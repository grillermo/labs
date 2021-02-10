class ScratchController < ApplicationController
  def index
    @scratch = Scratch.last || Scratch.create
    render :show
  end

  def show
    @scratch = Scratch.last || Scratch.create
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
