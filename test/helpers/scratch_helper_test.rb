require "test_helper"

class ScratchHelperTest < ActionView::TestCase
  test "scratch_is_link? only matches a full url" do
    assert scratch_is_link?(Scratch.new(content: "https://example.com"))
    assert_not scratch_is_link?(Scratch.new(content: "before https://example.com after"))
    assert_not scratch_is_link?(Scratch.new(content: "plain text"))
  end

  test "render_scratch_content_with_links only linkifies url words" do
    scratch = Scratch.new(content: "before https://example.com after")

    rendered = render_scratch_content_with_links(scratch).to_s

    assert_includes rendered, "before "
    assert_includes rendered, " after"
    assert_includes rendered, "<a target=\"_blank\" href=\"https://example.com\">https://example.com</a>"
  end
end
