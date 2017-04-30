require 'test_helper'

class ChangeAgentsControllerTest < ActionController::TestCase
  setup do
    @change_agent = change_agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:change_agents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create change_agent" do
    assert_difference('ChangeAgent.count') do
      post :create, change_agent: { location: @change_agent.location, name: @change_agent.name, quote: @change_agent.quote, title: @change_agent.title }
    end

    assert_redirected_to change_agent_path(assigns(:change_agent))
  end

  test "should show change_agent" do
    get :show, id: @change_agent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @change_agent
    assert_response :success
  end

  test "should update change_agent" do
    patch :update, id: @change_agent, change_agent: { location: @change_agent.location, name: @change_agent.name, quote: @change_agent.quote, title: @change_agent.title }
    assert_redirected_to change_agent_path(assigns(:change_agent))
  end

  test "should destroy change_agent" do
    assert_difference('ChangeAgent.count', -1) do
      delete :destroy, id: @change_agent
    end

    assert_redirected_to change_agents_path
  end
end
