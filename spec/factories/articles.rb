# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { generate(:string) }
    post { generate(:string) }

    association :user

    trait :with_comment do
      after(:create) { |article| create(:comment, article: article) }
    end

    trait :with_comments do
      after(:create) { |article| create_list(:comment, 5, article: article) }
    end

    trait :with_nested_comments do
      after(:create) do |article|
        create(:comment, parent_id: 1, article: article)
        create(:comment, parent_id: 1, article: article)
        create(:comment, parent_id: 8, article: article)
      end
    end

    trait :invalid do
      post { nil }
    end
  end
end
