require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "article is valid (all attribues)" do
    article = articles(:ruby_intro)

    assert article.valid?
  end

  test "article is invalid with no title" do
    article = articles(:ruby_intro)

    article.title = nil

    refute article.valid?
  end

  test "article is invalid with no content" do
    article = articles(:ruby_intro)

    article.content = nil

    refute article.valid?
  end

  test "article is invalid with no category" do
    article = articles(:ruby_intro)

    article.category = nil

    refute article.valid?
  end

  test 'has_many reviews' do
    assert_belongs_to Article, :user
  end
end
