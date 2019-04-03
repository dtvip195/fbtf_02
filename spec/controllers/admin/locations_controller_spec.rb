require "rails_helper"

RSpec.describe Admin::LocationsController, type: :controller do

  context "when current user is not admin" do
    before {get :index}

    it "flash success message" do
      expect(flash[:danger]).to match(I18n.t "permission_denide")
    end

    it "redirect to home page" do
      expect(response).to redirect_to root_path
    end
  end

  context "when current user is admin" do
    login_admin
    before {get :index}

    it "should have a current_user" do
      expect(subject.current_user).to_not eq nil
    end

    describe "POST locations#create" do
      let(:location){FactoryBot.attributes_for :location}
      let(:invalid_location){FactoryBot.attributes_for :invalid_location}

      context "valid attributes" do
        it "create new location" do
          expect{post :create, params: {location: location}}
          .to change(Location, :count).by 1
        end

        it "flash success message" do
          post :create, params: {location: location}
          expect(flash[:success]).to match(I18n.t "add_location_success")
        end

        it "redirect to admin_locations_path" do
          post :create, params: {location: location}
          expect(response).to redirect_to admin_locations_path
        end
      end

      context "invalid attributes" do
        before {Location.create!(name: "Đà Nẵng")}

        it "does not create new location" do
          expect{post :create, params: {location: invalid_location}}
          .to_not change(Location, :count)
        end

        it "flash danger message" do
          post :create, params: {location: invalid_location}
          expect(flash[:danger]).to match(I18n.t "err_location")
        end

        it "redirect to admin_locations_path" do
          post :create, params: {location: invalid_location}
          expect(response).to redirect_to admin_locations_path
        end
      end
    end

    describe "PUT locations#update" do
      let(:location){FactoryBot.attributes_for :location}
      let(:invalid_locations){FactoryBot.attributes_for :invalid_locations}
      before {@location = FactoryBot.create :location, name: "Da Nang"}

      context "valid attributes" do
        it "located the requested @location" do
          put :update, params: {id: @location, location: location}
          expect(assigns(:location)).to eq(@location)
        end

        it "changes @location attributes" do
          put :update, params: {id: @location,
            location: FactoryBot.attributes_for(:location, name: "Da Lat")}
          @location.reload
          @location.name.should eq("Da Lat")
        end

        it "flash success message" do
          put :update, params: {id: @location,
            location: FactoryBot.attributes_for(:location, name: "Da Lat")}
            expect(flash[:success]).to match(I18n.t "update_location_success")
        end

        it "redirects to admin_locations_path" do
          put :update, params: {id: @location,
            location: FactoryBot.attributes_for(:location, name: "Da Lat")}
          expect(response).to redirect_to admin_locations_path
        end
      end

      context "invalid attributes" do
        it "located the requested @location" do
          put :update, params: {id: @location, location: invalid_locations}
          expect(assigns(:location)).to eq(@location)
        end

        it "does not change @location attributes" do
          put :update, params: {id: @location, location: invalid_locations}
          @location.reload
          @location.name.should eq("Da Nang")
        end

        it "re-renders the edit method" do
          put :update, params: {id: @location, location: invalid_locations}
          expect(response).to render_template :edit
        end
      end
    end

    describe "DELETE locations#destroy" do
      let!(:location){FactoryBot.create :location}

      context "valid attributes" do
        it "deletes the location" do
          expect{delete :destroy, params: {id: location}}
          .to change(Location, :count).by -1
        end

        it "flash success message" do
          delete :destroy, params: {id: location}
          expect(flash[:success]).to match(I18n.t "del_location_success")
        end

        it "redirect to admin_locations_path" do
          delete :destroy, params: {id: location}
          expect(response).to redirect_to admin_locations_path
        end
      end

      context "invalid attributes" do
        it "deletes the location" do
          expect{delete :destroy, params: {id: 321}}
          .to_not change(Location, :count)
        end

        it "flash danger message" do
          delete :destroy, params: {id: 321}
          expect(flash[:danger]).to match(I18n.t "del_location_failed")
        end

        it "redirect to admin_locations_path" do
          delete :destroy, params: {id: 321}
          expect(response).to redirect_to admin_locations_path
        end
      end
    end
  end
end
