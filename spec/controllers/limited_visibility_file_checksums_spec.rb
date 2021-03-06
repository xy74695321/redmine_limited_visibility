require File.dirname(__FILE__) + '/../spec_helper'

describe "LimitedVisibilityFileChecksums" do
  def assert_checksum(expected, filename)
    filepath = Rails.root.join(filename)
    checksum = Digest::MD5.hexdigest(File.read(filepath))
    assert checksum.in?(Array(expected)), "Bad checksum for file: #{filename}, local version should be reviewed: checksum=#{checksum}, expected=#{Array(expected).join(" or ")}"
  end

  it "should check core new membership checksums" do
    #the partial is completely overridden so it can be loaded through ajax (deface doesn't work well with ajax)
    assert_checksum %w"201e7358c0ea5597b05857be2c3220d3", "app/views/principal_memberships/_new_form.html.erb"
  end
end
