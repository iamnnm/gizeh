# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name  { generate(:string) }
    email { generate(:email) }

    after(:build) do |u|
      u.password_confirmation = u.password = '123456'
    end
  end
end
