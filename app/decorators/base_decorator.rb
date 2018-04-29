class BaseDecorator < Draper::Decorator
  delegate :to_model, :persisted?
end
