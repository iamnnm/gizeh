# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, type: :model do

  context 'validations check' do
    it { is_expected.to belong_to :user }
    it { is_expected.to have_many :comments }

    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :post }
    it { is_expected.to validate_length_of(:title).is_at_most(100) }
    it { is_expected.to validate_length_of(:post).is_at_most(10_000) }
  end

  context 'wont created' do
    # let(:article) { create(:article) }
    subject { build(:article, user: nil) }

    it 'without the user' do
      expect(subject).to_not be_valid
    end
  end

  context 'created and' do
    subject { create(:article, :with_comments, :with_nested_comments) }

    it 'can have many comments' do
      expect(subject.comments.length).to eq(8)
    end

    it 'can have many nested comments' do
      expect(subject.comments.first.comments.length).to eq 2
    end
  end
end
