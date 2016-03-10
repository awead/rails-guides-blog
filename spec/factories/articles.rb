FactoryGirl.define do

  factory :comment do
    commenter "Joe Schmoe"
    body "Sample content of the comment"
  end

  factory :article do
    title "Sample title"
    text "Sample text of the article"

    factory :article_with_comment do
      after(:create) do |article|
        create(:comment, article: article)
      end
    end
  end

end
