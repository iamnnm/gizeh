# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations check' do
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_length_of(:body).is_at_most(10_000) }
  end

  context 'created and' do
    let(:article) { create(:article, :with_comments) }

    it 'can have many comments' do
      expect(article.comments.length).to eq(5)
    end
  end

  describe '#comments' do
    subject { create(:article, :with_comments, :with_nested_comments) }
    it 'should return an array nested comments' do
      expect(subject.comments.first.comments.first.parent_id).not_to eq nil
      expect(subject.comments.first.comments.length).to eq 2
    end
  end

  # describe '#destroy' do
  #   let(:user) { create(:user) }
  #   subject { create(:article, :with_comment, user: user) }
  #
  #   # before do
  #   #   sign_in user
  #   # end
  #
  #   it 'should destroy a comment' do
  #     sign_in user
  #     subject = create(:comment, user: user)
  #
  #     expect(subject.comments.length).to eq 1
  #     subject.comments.first.destroy
  #     # expect(subject.comments.length).to eq 0
  #     p subject.comments
  #   end
  # end
end
