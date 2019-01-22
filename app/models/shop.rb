class Shop < ApplicationRecord
  validates :name, presence: {message: 'は必須です。'},
                   length: {maximum: 50, message: '%{value}は50文字以内でご記入下さい。'}
  validates :phone, presence: {message: 'は必須です。'},
                    format: {with: /\A\d{10}$|^\d{11}\z/, message: 'ハイフンなしの10桁または11桁でご記入下さい。'},
                    uniqueness: {message: '%{value}は既に他店で使われています。'}
  validates :address, presence: {message: 'は必須です。'},
                      length: {maximum: 100, message: '%{value}は100文字以内でご記入下さい。'}
  validates :area, :station, presence: {message: 'は必須です。'},
                             length: {maximum: 20, message: '%{value}は20文字以内でご記入下さい。'}
end
