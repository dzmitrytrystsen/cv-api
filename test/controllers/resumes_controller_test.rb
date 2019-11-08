require 'test_helper'

class ResumesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @resume = resumes(:one)
  end

  test "should get index" do
    get resumes_url, as: :json
    assert_response :success
  end

  test "should create resume" do
    assert_difference('Resume.count') do
      post resumes_url, params: { resume: { address: @resume.address, city: @resume.city, country: @resume.country, date_of_birth: @resume.date_of_birth, driving_license: @resume.driving_license, email: @resume.email, first_name: @resume.first_name, job_title: @resume.job_title, last_name: @resume.last_name, nationality: @resume.nationality, phone: @resume.phone, photo: @resume.photo, place_of_birth: @resume.place_of_birth, postal_code: @resume.postal_code, professional_summary: @resume.professional_summary } }, as: :json
    end

    assert_response 201
  end

  test "should show resume" do
    get resume_url(@resume), as: :json
    assert_response :success
  end

  test "should update resume" do
    patch resume_url(@resume), params: { resume: { address: @resume.address, city: @resume.city, country: @resume.country, date_of_birth: @resume.date_of_birth, driving_license: @resume.driving_license, email: @resume.email, first_name: @resume.first_name, job_title: @resume.job_title, last_name: @resume.last_name, nationality: @resume.nationality, phone: @resume.phone, photo: @resume.photo, place_of_birth: @resume.place_of_birth, postal_code: @resume.postal_code, professional_summary: @resume.professional_summary } }, as: :json
    assert_response 200
  end

  test "should destroy resume" do
    assert_difference('Resume.count', -1) do
      delete resume_url(@resume), as: :json
    end

    assert_response 204
  end
end
