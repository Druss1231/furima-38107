require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品' do
    context '出品できるとき' do
      it '新規登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'titleが空だと出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleが41文字以上だと出品できない' do
        @item.title = Faker::Lorem.characters(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Title is too long (maximum is 40 characters)")
      end
      it 'descriptionが空だと出品できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
        end
      it "descriptionが1000文字以上だと出品できない" do
        @item.description = Faker::Lorem.characters(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is too long (maximum is 1000 characters)")
        end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
        end
      it 'condition_idが1だと出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
        end
      it 'fee_idが1だと出品できない' do
          @item.fee_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it 'from_idが1だと出品できない' do
        @item.from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("From can't be blank")
        end
        it 'ship_date_idが1だと出品できない' do
          @item.ship_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include("Ship date can't be blank")
          end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end