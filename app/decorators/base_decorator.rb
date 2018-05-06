class BaseDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate :id, :persisted?
end
