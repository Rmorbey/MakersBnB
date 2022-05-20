def teste_sign_in
    fill_in :email, with: 'test@example.com'
    fill_in :password, with: 'password123'
    click_button 'Sign in'
end