require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let(:question) { create(:question) }

  describe 'GET #new' do
    before { get :new, params: { question_id: question } }

    it 'assigns requested question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'assigns new answer to @answer' do
      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    let (:answer) { create(:answer, question: question) }

    before { get :show, params: { id: answer } }

    it 'assigns requested answer to @answer' do
      expect(assigns(:answer)).to  eq answer
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end
end
