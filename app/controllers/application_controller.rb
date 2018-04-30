class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_user_locale

  expose_decorated(:top_level_albums, decorator: AlbumDecorator) { current_user.top_level_albums }

  AVAILABLE_LOCALES = %w[en ru].freeze

  def perform_authorization!(policy)
    return if policy.authorized?(params[:action])

    redirect_to(root_url, alert: t("app.authorization.#{policy.object_class.downcase}.#{params[:action]}"))
  end

  def set_user_locale
    if user_signed_in?
      I18n.locale = current_user.locale
    else
      # browser_locale = extract_language_from_request
      # I18n.locale = if browser_locale.in? AVAILABLE_LOCALES
      #                 browser_locale
      #               else
      I18n.default_locale
      #                 end
    end
  end

  protected

  def extract_language_from_request
    language_data = request.env["HTTP_ACCEPT_LANGUAGE"]

    language_data.present? ? language_data.scan(/^[a-z]{2}/).first : "en"
  end

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end
end
