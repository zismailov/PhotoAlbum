class BaseDecorator < Draper::Decorator
  delegate :to_model
end
