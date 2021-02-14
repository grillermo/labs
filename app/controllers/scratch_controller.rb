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

    if @scratch.content.strip != scratch_params[:content].strip
      @scratch = Scratch.new(content: scratch_params[:content])
    else
      @scratch.update_attributes(content: scratch_params[:content])
    end

    if @scratch.valid? && @scratch.save
      redirect_to @scratch
    else
      render plain: person.errors.full_messages
    end
  end

  private

  def scratch_params
    params.require(:scratch).permit(:content, :id)
  end
end
