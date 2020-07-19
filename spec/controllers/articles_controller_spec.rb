# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#index' do
    before do
      @user    = create(:user)
      @article = create(:article, user: @user)
    end

    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in @user
        get :index
        expect(response).to have_http_status(:ok)
        expect(response).to render_template('index')
      end
    end

    context 'as a guest' do
      it 'responds successfully' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#new' do
    before do
      @user = create(:user)
    end

    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in @user
        get :new
        expect(response).to have_http_status(:ok)
        expect(response).to render_template('new')
      end
    end

    context 'as a guest' do
      it 'redirects to the dashboard' do
        get :new
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#create' do
    context 'as an authenticated user' do
      before do
        @user = create(:user)
      end

      context 'with valid attributes' do
        it 'adds an article' do
          article_params = attributes_for(:article, user: @user)
          sign_in @user
          expect {
            post :create, params: { article: article_params }
          }.to change(@user.articles, :count).by(1)
          expect(flash).to be
        end
      end

      context 'with invalid attributes' do
        it 'does not add an article' do
          article_params = attributes_for(:article, :invalid, user: @user)
          sign_in @user
          expect {
            post :create, params: { article: article_params }
          }.to_not change(@user.articles, :count)
        end
      end
    end

    context 'as a guest' do
      it 'returns a 302 response' do
        article_params = attributes_for(:article)
        post :create, params: { article: article_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to sing_in page' do
        article_params = attributes_for(:article)
        post :create, params: { article: article_params }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#show' do
    before do
      @user = create(:user)
      @article = create(:article, user: @user)
    end

    context 'as an authenticated user' do
      it 'responds successfully' do
        sign_in @user
        get :show, params: { id: @article.id }
        expect(response.successful?).to eq(true)
      end
    end

    context 'as a guest' do
      it 'responds successfully' do
        get :show, params: { id: @article.id }
        expect(response.successful?).to eq(true)
      end
    end
  end

  describe '#edit' do
    before do
      @user = create(:user)
      @article = create(:article)
    end
    context 'as an authenticated user' do
      it 'responses render template EDIT' do
        sign_in @user
        get :edit, params: { id: @article.id }
        expect(response).to render_template 'edit'
      end
    end

    context 'as an unauthorized user' do
      it 'does not response render template EDIT' do
        get :edit, params: { id: @article.id }
        expect(response).not_to render_template 'edit'
      end
    end
  end

  describe '#update' do
    context 'as an authenticated user' do
      before do
        @user = create(:user)
        @article = create(:article, user: @user)
      end

      it 'updates an article' do
        article_params = attributes_for(:article, post: 'New text')
        sign_in @user
        patch :update, params: { id: @article.id, article: article_params }
        expect(@article.reload.post).to eq 'New text'
      end
    end

    context 'as an authenticated user' do
      before do
        @user = create(:user)
        @article = create(:article, post: 'Old text')
      end

      it 'does not update other user\'s article' do
        article_params = attributes_for(:article, post: 'New text')
        sign_in @user
        expect {
          patch :update, params: { id: @article.id, article: article_params }
        }.to raise_error NoMethodError
      end
    end

    context 'as a guest' do
      before do
        @article = create(:article)
      end

      it 'returns a 302 response' do
        article_params = attributes_for(:article)
        patch :update, params: { id: @article.id, article: article_params }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        article_params = attributes_for(:article)
        patch :update, params: { id: @article.id, article: article_params }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '#destroy' do
    context 'as an authenticated user' do
      before do
        @user = create(:user)
        @article = create(:article, user: @user)
      end

      it 'deletes a project"' do
        sign_in @user
        expect {
          delete :destroy, params: { id: @article.id }
        }.to change(@user.articles, :count).by(-1)
      end
    end

    context 'as an unauthorized user' do
      before do
        @user = create(:user)
        @other_user = create(:user)
        @article = create(:article, user: @other_user)
      end

      it 'does not delete the project' do
        sign_in @user
        delete :destroy, params: { id: @article.id }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the dashboard' do
        sign_in @user
        delete :destroy, params: { id: @article.id }
        expect(response).to redirect_to root_path
      end
    end

    context 'as a guest' do
      before do
        @article = create(:article)
      end

      it 'returns a 302 response' do
        delete :destroy, params: { id: @article.id }
        expect(response).to have_http_status '302'
      end

      it 'redirects to the sign-in page' do
        delete :destroy, params: { id: @article.id }
        expect(response).to redirect_to '/users/sign_in'
      end

      it 'does not delete the project' do
        expect {
          delete :destroy, params: { id: @article.id }
        }.to change(Article, :count).by(0)
      end
    end
  end
end
