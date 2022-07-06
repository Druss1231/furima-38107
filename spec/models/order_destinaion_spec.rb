require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '購入情報の保存' do
    before do
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: item.user_id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = ""
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと保存できないこと' do
        @order_destination.token = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと保存できないこと' do
        @order_destination.post_code = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.post_code = "1234567"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'from_idを選択していないと保存できないこと' do
        @order_destination.from_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("From can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @order_destination.city = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'address_lineが空白だと保存できないこと' do
        @order_destination.address_line = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address line can't be blank")
      end
      it 'phoneが空白だと保存できないこと' do
        @order_destination.phone = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが12桁以上では保存できないこと' do
        @order_destination.phone = "123456789012"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが9桁以上では保存できないこと' do
        @order_destination.phone = "123456789"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できないこと' do
        @order_destination.phone = "12345678９"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end