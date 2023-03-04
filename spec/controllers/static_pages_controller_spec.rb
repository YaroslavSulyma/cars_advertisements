RSpec.describe StaticPagesController, type: :controller do
  describe 'GET #home' do
    before { get :home }

    it 'renders the :home template' do
      expect(response).to render_template(:home)
    end

    it 'returns a success status code' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #help' do
    before { get :help }

    it 'renders the :help template' do
      expect(response).to render_template(:help)
    end
    it 'returns a success status code' do
      expect(response).to have_http_status(:ok)
    end
  end
end
