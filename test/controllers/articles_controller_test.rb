require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_article = articles(:ruby_intro)
    @editor_article = articles(:sls_intro)
  end

  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should get new (as admin)" do
    get '/users/sign_in'
    sign_in users(:admin)

    get new_article_url
    assert_response :success
  end

  test "should get new (as editor)" do
    get '/users/sign_in'
    sign_in users(:editor)

    get new_article_url
    assert_response :success
  end

  test "new article should redirect (as guest)" do
    get new_article_url
    assert_redirected_to new_user_session_url
  end

  test "should create article (as admin)" do
    get '/users/sign_in'
    sign_in users(:admin)

    assert_difference('Article.count') do
      post articles_url, params: { article: { category: @admin_article.category, content: @admin_article.content, title: @admin_article.title, user_id: @admin_article.user_id } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should create article (as editor)" do
    get '/users/sign_in'
    sign_in users(:editor)

    assert_difference('Article.count') do
      post articles_url, params: { article: { category: @editor_article.category, content: @editor_article.content, title: @editor_article.title, user_id: @editor_article.user_id } }
    end

    assert_redirected_to article_url(Article.last)
  end

  test "should redirect when trying to create article (as guest)" do
    post articles_url, params: { article: { category: @admin_article.category, content: @admin_article.content, title: @admin_article.title, user_id: @admin_article.user_id } }

    assert_redirected_to new_user_session_url
  end

  test "should show article (as admin)" do
    get '/users/sign_in'
    sign_in users(:admin)

    get article_url(@admin_article)
    assert_response :success
  end

  test "should show article (as editor)" do
    get '/users/sign_in'
    sign_in users(:editor)

    get article_url(@admin_article)
    assert_response :success
  end

  test "show article should redirect (as guest)" do
    get article_url(@admin_article)
    assert_redirected_to new_user_session_url
  end

  test "should get edit from editor (as admin)" do
    get '/users/sign_in'
    sign_in users(:admin)

    get edit_article_url(@editor_article)
    assert_response :success
  end

  test "should get edit from editor (as editor)" do
    get '/users/sign_in'
    sign_in users(:editor)

    get edit_article_url(@editor_article)
    assert_response :success
  end

  test "should redirect get edit from admin (as editor)" do
    get '/users/sign_in'
    sign_in users(:editor)

    get edit_article_url(@admin_article)
    assert_redirected_to articles_url
  end

  test "get edit should redirect (as guest)" do    
    get edit_article_url(@admin_article)
    assert_redirected_to new_user_session_url
  end

  test "should update article (as admin)" do
    get '/users/sign_in'
    sign_in users(:admin)

    patch article_url(@admin_article), params: { article: { category: @admin_article.category, content: @admin_article.content, title: @admin_article.title, user_id: @admin_article.user_id } }
    assert_redirected_to article_url(@admin_article)
  end

  test "should redirect update article from admin (as editor)" do
    get '/users/sign_in'
    sign_in users(:editor)

    patch article_url(@admin_article), params: { article: { category: @admin_article.category, content: @admin_article.content, title: @admin_article.title, user_id: @admin_article.user_id } }
    assert_redirected_to articles_url
  end

  test "should redirect trying to update article (as guest)" do    
    patch article_url(@admin_article), params: { article: { category: @admin_article.category, content: @admin_article.content, title: @admin_article.title, user_id: @admin_article.user_id } }
    assert_redirected_to new_user_session_url
  end

  test "should destroy article (as admin)" do
    get '/users/sign_in'
    sign_in users(:admin)

    assert_difference('Article.count', -1) do
      delete article_url(@admin_article)
    end

    assert_redirected_to articles_url
  end

  test "should redirect destroy article from admin (as editor)" do
    get '/users/sign_in'
    sign_in users(:editor)

    assert_no_difference('Article.count') do
      delete article_url(@admin_article)
    end

    assert_redirected_to articles_url
  end

  test "should redirect trying to destroy article (as guest)" do
    assert_no_difference('Article.count') do
      delete article_url(@admin_article)
    end

    assert_redirected_to new_user_session_url
  end
end
