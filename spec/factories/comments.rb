FactoryBot.define do
  factory :comment, class: 'Comment' do
    body { generate(:string) }
    parent_id { nil }

    association :user
  end
end
