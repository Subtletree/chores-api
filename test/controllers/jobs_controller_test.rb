# == Schema Information
#
# Table name: jobs
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  complete   :boolean
#  user_id    :integer
#  active     :boolean          default(FALSE)
#

require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { name: @job.name } }
    end

    assert_response 201
  end

  test "should show job" do
    get job_url(@job)
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { name: @job.name } }
    assert_response 200
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job)
    end

    assert_response 204
  end
end
