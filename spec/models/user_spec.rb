require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できないとき' do
      it 'ニックネームが空では登録できない' do
      end
      it 'メールアドレスが空では登録できない' do
      end
      it 'メールアドレスが既に登録されているものと同一では登録できない' do
      end
      it 'メールアドレスには@マークが含まれていないと登録できない' do
      end
      it 'パスワードが空では登録できない' do
      end
      it 'パスワードは6文字以上でなければ登録できない' do
      end
      it 'パスワードは半角英数字を含むものでなければ登録できない' do
      end
      it 'パスワードとパスワード（確認）は値が一致しなければ登録できない' do
      end
      it '名字が空では登録できない' do
      end
      it '名前が空では登録できない' do
      end
      it '名字が全角の（漢字、ひらがな、カタカナ）以外では登録できない' do
      end
      it '名前が全角の（漢字、ひらがな、カタカナ）以外では登録できない' do
      end
      it 'カタカナ名字が空では登録できない' do
      end
      it 'カタカナ名前が空では登録できない' do
      end
      it 'カタカナ名字が全角カタカナ以外では登録できない' do
      end
      it 'カタカナ名前が全角カタカナ以外では登録できない' do
      end
      it '生年月日が空では登録できない' do
      end
      





    end
