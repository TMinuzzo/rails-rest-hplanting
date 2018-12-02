require 'test_helper'

class ClimatizadorsControllerTest < ActionController::TestCase
  setup do
    @climatizador = climatizadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climatizadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climatizador" do
    assert_difference('Climatizador.count') do
      post :create, climatizador: { historico: @climatizador.historico, temperatura: @climatizador.temperatura, usuario_id: @climatizador.usuario_id }
    end

    assert_redirected_to climatizador_path(assigns(:climatizador))
  end

  test "should show climatizador" do
    get :show, id: @climatizador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climatizador
    assert_response :success
  end

  test "should update climatizador" do
    patch :update, id: @climatizador, climatizador: { historico: @climatizador.historico, temperatura: @climatizador.temperatura, usuario_id: @climatizador.usuario_id }
    assert_redirected_to climatizador_path(assigns(:climatizador))
  end

  test "should destroy climatizador" do
    assert_difference('Climatizador.count', -1) do
      delete :destroy, id: @climatizador
    end

    assert_redirected_to climatizadors_path
  end
end
