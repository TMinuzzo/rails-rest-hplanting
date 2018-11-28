require 'test_helper'

class UmidificadorsControllerTest < ActionController::TestCase
  setup do
    @umidificador = umidificadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:umidificadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create umidificador" do
    assert_difference('Umidificador.count') do
      post :create, umidificador: { umidade: @umidificador.umidade }
    end

    assert_redirected_to umidificador_path(assigns(:umidificador))
  end

  test "should show umidificador" do
    get :show, id: @umidificador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @umidificador
    assert_response :success
  end

  test "should update umidificador" do
    patch :update, id: @umidificador, umidificador: { umidade: @umidificador.umidade }
    assert_redirected_to umidificador_path(assigns(:umidificador))
  end

  test "should destroy umidificador" do
    assert_difference('Umidificador.count', -1) do
      delete :destroy, id: @umidificador
    end

    assert_redirected_to umidificadors_path
  end
end
