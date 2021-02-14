module ScratchHelper
  def scratch_is_link?(scratch)
    /https?:\/\/[\S]+/.match @scratch.content.strip
  end
end
