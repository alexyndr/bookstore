# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  def complete_order(order)
    @order = order
    mail(to: @order.user.email, subject: I18n.t('mailer.complete'))
  end
end
