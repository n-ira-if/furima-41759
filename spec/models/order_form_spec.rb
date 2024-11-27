require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  describe '配送先情報の保存' do
    context '問題がない場合' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end

      it '建物名は空でも保存できること' do
        @order_form.building_name = ''
        expect(@order_form).to be_valid
      end
    end

    context '問題がある場合' do
      it 'post_codeが空では保存できないこと' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが「3桁ハイフン4桁」の形式でないと保存できないこと' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Post code is invalid')
      end

      it 'region_idが1では保存できないこと' do
        @order_form.region_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Region must be other than 1')
      end

      it '市区町村が空では保存できないこと' do
        @order_form.minicipalities = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Minicipalities can't be blank")
      end

      it '番地が空では保存できないこと' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end

      it '電話番号が空では保存できないこと' do
        @order_form.telephone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end

      it '電話番号が10桁未満では保存できないこと' do
        @order_form.telephone_number = '090123456'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is invalid')
      end

      it '電話番号が12桁以上では保存できないこと' do
        @order_form.telephone_number = '090123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is invalid')
      end

      it '電話番号が半角数値でないと保存できないこと' do
        @order_form.telephone_number = '090-1234-5678'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Telephone number is invalid')
      end

      it 'tokenが空では保存できないこと' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では保存できないこと' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では保存できないこと' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
