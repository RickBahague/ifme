# frozen_string_literal: true

FactoryGirl.define do
  factory :strategy do
    name "Test Strategy"
    description "Test Description"
    comment true
    userid 1

    after(:create) do |strategy|
      create :perform_strategy_reminder, strategy: strategy, active: false
    end

    trait :with_daily_reminder do
      after(:create) do |strategy|
        create :perform_strategy_reminder, strategy: strategy
      end
    end
  end

  factory :perform_strategy_reminder do
    active true
  end
end
