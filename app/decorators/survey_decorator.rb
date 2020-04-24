class SurveyDecorator < ApplicationDecorator
  delegate_all

  decorates_association :user

  def created_at
    object.created_at.strftime('%A, %B %e')
  end
end
