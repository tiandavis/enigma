require 'spec_helper'

describe NumbersController do
  describe "GET #new" do
    it "assigns a new Number to @number" do
      get :new
      expect(assigns(:number)).to be_a_new(Number)
    end
    
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe "POST #create" do
    context "with valid attributes" do
      it "returns JSON formatted content" do
        post :create, number: attributes_for(:number, value: "int: 8191"), format: :json
        response_body = response.body.sub!(',"errors":{}', '')
        expect(response_body).to have_content build(:number, value: "7F7F").to_json
      end
      
      describe "renders the :create template" do
        it "for valid integer input" do
          post :create, number: attributes_for(:number, value: "int: 8191")
          expect(response).to render_template :create
        end
        
        it "for valid hex input" do
          post :create, number: attributes_for(:number, value: "hex: 5000")
          expect(response).to render_template :create
        end
      end
    end
    
    context "with invalid attributes" do
      it "renders the :new template" do
        post :create, number: attributes_for(:invalid_number)
        expect(response).to render_template :new
      end
    end
  end
end