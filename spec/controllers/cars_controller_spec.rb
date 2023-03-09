RSpec.describe CarsController, type: :controller do
  describe 'GET #index' do
    before { get :index }

    context 'render correct template' do
      it 'returns a success status code' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'return correct status code' do
      it 'renders the :index view' do
        expect(response).to render_template(:index)
      end
    end
  end
end
