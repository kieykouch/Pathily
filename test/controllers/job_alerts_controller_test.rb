require 'test_helper'

class JobAlertsControllerTest < ActionController::TestCase
  setup do
    @job_alert = job_alerts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_alerts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_alert" do
    assert_difference('JobAlert.count') do
      post :create, job_alert: { email: @job_alert.email, freqency: @job_alert.freqency }
    end

    assert_redirected_to job_alert_path(assigns(:job_alert))
  end

  test "should show job_alert" do
    get :show, id: @job_alert
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_alert
    assert_response :success
  end

  test "should update job_alert" do
    patch :update, id: @job_alert, job_alert: { email: @job_alert.email, freqency: @job_alert.freqency }
    assert_redirected_to job_alert_path(assigns(:job_alert))
  end

  test "should destroy job_alert" do
    assert_difference('JobAlert.count', -1) do
      delete :destroy, id: @job_alert
    end

    assert_redirected_to job_alerts_path
  end
end
