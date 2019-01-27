# class PhoneValidator < ActiveModel::EachValidator
#   PHONE_REGEX = /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/

#   def validate_each(record, attribute, value)
#     return value.blank?
#     if value.match(PHONE_REGEX).blank?
#       record.errors.add(attribute, 'は不正な値です')
#     end
#   end
# end