require 'rails_helper'

RSpec.describe 'トップページのヘッダーの表示', type: :system do
  context 'ログインの有無による表示の違い' do
    it 'ログアウト状態だとログイン／新規登録のボタンがあること' do
      visit root_path
      expect(page).to have_content('ログイン')
      expect(page).to have_content('新規登録')
    end
    it 'ログイン状態だとニックネーム／ログアウトのボタンがあること' do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on('ログイン')
      expect(current_path).to eq(root_path)
      expect(page).to have_content(@user_name)
      expect(page).to have_content('ログアウト')
    end
  end
end

RSpec.describe '新規登録・ログインについて', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ヘッダーの新規登録ボタンを押し、各項目を入力するとユーザーの新規登録ができること' do
    @user = FactoryBot.build(:user)
    visit new_user_registration_path
    expect(current_path).to eq(new_user_registration_path)
    fill_in 'nickname', with: @user.name
    fill_in 'email', with: @user.email
    fill_in 'password', with: @user.password
    fill_in 'password-confirmation', with: @user.password_confirmation
    fill_in 'last-name', with: @user.last_name
    fill_in 'first-name', with: @user.first_name
    fill_in 'last-name-kana', with: @user.last_name_kana
    fill_in 'first-name-kana', with: @user.first_name_kana
    select '1930', from: 'user[birth_date(1i)]'
    select '10', from: 'user[birth_date(2i)]'
    select '30', from: 'user[birth_date(3i)]'
    expect do
      find('input[name="commit"]').click
    end.to change { User.count }.by(1)
    expect(current_path).to eq(root_path)
  end

  context 'ログインの流れ' do
    it 'ヘッダーのログインボタンを押し、各項目を入力するとログインができること' do
      visit new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on('ログイン')
      expect(current_path).to eq(root_path)
    end
    it 'ログアウトボタンを押すことでユーザーがログアウトできること' do
      visit new_user_session_path
      expect(current_path).to eq(new_user_session_path)
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      click_on('ログイン')
      expect(current_path).to eq(root_path)
      click_on('ログアウト')
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
    end
  end
end
