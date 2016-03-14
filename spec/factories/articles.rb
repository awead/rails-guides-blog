FactoryGirl.define do

  factory :comment do
    commenter "Joe Schmoe"
    body "Sample content of the comment"
  end

  factory :anonymous_comment, class: Comment do
    body "Sample content of the anonymous comment"
  end

  factory :article do
    title "Sample title"
    text "Sample text of the article"

    factory :article_with_comment do
      after(:create) do |article|
        create(:comment, article: article)
      end
    end

    factory :article_with_anonymous_comment do
      after(:create) do |article|
        create(:anonymous_comment, article: article)
      end
    end
  end

end
