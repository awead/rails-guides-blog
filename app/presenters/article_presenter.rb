class ArticlePresenter
  attr_reader :model
  delegate :title, :text, :comments, to: :model

  def initialize(model)
    @model = model
  end

  # Displays commens as a single string
  def formatted_comments
    model.comments.map { |c| "#{c.body} (#{commenter(c)})" }
  end

  def has_comments?
    !comments.empty?
  end

  private

    def commenter(comment)
      comment.commenter || "anonymous"
    end
end
