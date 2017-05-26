require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do 
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference 'User.count' do  # upewnij sie ze nie zmienil sie 'arg'
      post signup_path, user: { name: "", 
                       email: "user@invalid",
                       password: "foo",
                       password_confirmation: "bar" }

    end
    # assert_equal before_count, after_count ==== Weryfikuje czy są sobie równe
    assert_template 'users/new'            # Generuje template spod adresu
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end
  
  
    test "valid signup information" do 
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_difference 'User.count', 1 do  # upewnij sie ze +1 urosla liczba
      post_via_redirect signup_path, user: { name: "Example User", 
                                             email: "user@example.com",
                                             password: "password",
                                             password_confirmation: "password" }

    end
    assert_template 'users/show'            # Generuje template spod adresu
  end
end
