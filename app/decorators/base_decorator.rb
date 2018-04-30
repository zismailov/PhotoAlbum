class BaseDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate :id
end
