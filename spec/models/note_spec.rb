require 'spec_helper'

describe Note do
  let(:note) { FactoryGirl.create :note }

  it do
    expect(note).to respond_to :title
    expect(note).to respond_to :raw_body
    expect(note).to respond_to :body
  end

  describe :render_markdown do
    it do
      expect(note.render_markdown).to match(/<h1>/)
      expect(note.render_markdown).to match(/<li>/)
    end
  end
end

