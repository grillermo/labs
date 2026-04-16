module ScratchHelper
  SCRATCH_LINK_PATTERN = %r{\Ahttps?://\S+\z}.freeze

  def scratch_is_link?(scratch)
    scratch_link_word?(scratch.content.to_s.strip)
  end

  def scratch_has_link_words?(scratch)
    scratch.content.to_s.split(/(\s+)/).any? { |token| scratch_link_word?(token) }
  end

  def render_scratch_content_with_links(scratch)
    tokens = scratch.content.to_s.split(/(\s+)/)

    safe_join(tokens.map { |token| render_scratch_token(token) }, "")
  end

  private

  def render_scratch_token(token)
    return token unless scratch_link_word?(token)

    link_to(token, token, 'target' => '_blank')
  end

  def scratch_link_word?(token)
    SCRATCH_LINK_PATTERN.match?(token.to_s)
  end
end
