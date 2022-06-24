FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    firstname             {'山田'}
    lastname              {'太郎'}
    firstname_kana        {'ヤマダ'}
    lastname_kana         {'タロウ'}
    birthday              {'2020/10/01'}
  end
end