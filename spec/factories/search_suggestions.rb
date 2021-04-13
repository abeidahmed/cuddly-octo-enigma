FactoryBot.define do
  factory :search_suggestion do
    term { "Is this a good place?" }
    popularity { 1 }
    project
  end
end
