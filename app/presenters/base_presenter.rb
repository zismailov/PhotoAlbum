class BasePresenter
  attr_reader :object

  # delegate :to_model, :to_key, :to_param, :to_partial_path, :errors, to: :object

  include ActionView::Helpers::TextHelper

  def initialize(object)
    @object = object
  end

  # def method_missing(sym, *args, &block)
  #  @object.public_send sym, *args, &block
  # end

  def created_at
    @object.created_at.strftime("%B %d, %Y %H:%M")
  end
end
