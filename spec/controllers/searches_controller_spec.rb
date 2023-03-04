RSpec.describe SearchesController, type: :controller do
  let(:user_with_search_history) { create(:user, :with_search_history) }
  let(:search) { build(:search) }
  let(:search_params) do
    {
      search: {
        make: search.make,
        model: search.model,
        year_from: search.year_from,
        year_to: search.year_to,
        price_from: search.price_from,
        price_to: search.price_to,
        user_id: user_with_search_history.id
      }
    }
  end

  describe 'GET #index' do
    context 'when user is authenticated' do
      before do
        sign_in user_with_search_history
        get :index
      end

      it 'renders the :index template' do
        expect(response).to render_template(:index)
      end

      it 'return correct status' do
        expect(response).to have_http_status(:ok)
      end

      it 'assigns @user_search_collection' do
        expect(assigns(:user_search_collection).records).to eq(user_with_search_history.searches.order(:created_at))
      end
    end

    context 'when user is not authenticated' do
      before { get :index }

      it 'return correct status' do
        expect(response).to have_http_status(:found)
      end

      it 'redirects to sign in page' do
        expect(response).to redirect_to(:new_user_session)
      end
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'renders the :new template' do
      expect(response).to render_template(:new)
    end

    it 'assigns @search' do
      expect(assigns(:search)).to be_a_new(Search)
    end
  end

  describe 'POST #create' do
    context 'when search does not exist' do
      before do
        sign_in user_with_search_history
        post :create, params: search_params
      end

      it 'redirects to cars_path with search params' do
        expect(response).to redirect_to(cars_path(search_params[:search]))
      end

      it 'creates a new search' do
        expect(Search.exists?(search_params[:search])).to be_truthy
      end
    end

    context 'when search already exists' do
      before do
        sign_in user_with_search_history
        post :create, params: search_params
      end

      it 'redirects to cars_path with search params' do
        expect(response).to redirect_to(cars_path(search_params[:search]))
      end

      it 'does not create a new search'
      it 'increments requests_quantity for existing search'
    end
  end
end
