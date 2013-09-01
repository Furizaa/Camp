require 'mail'

class EmailValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    begin
      mail = Mail::Address.new(value)

      # We must check that value contains a domain and that value is an email address
      r = mail.domain && mail.address == value
      t = mail.__send__(:tree)

      # We need to dig into treetop
      # A valid domain must have dot_atom_text elements size > 1
      # user@localhost is excluded
      # treetop must respond to domain
      # We exclude valid email values like <user@localhost.com>
      # Hence we use m.__send__(tree).domain
      r &&= (t.domain.dot_atom_text.elements.size > 1)
    rescue Exception => e
      r = false
    end
    record.errors[attribute] << I18n.t(:'email.invalid') unless r
  end

end
