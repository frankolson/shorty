class ShortLink::CreationForm
  include ActiveModel::Model

  attr_accessor :user_id, :long_url

  validate :valid_short_link?

  def submit
    set_short_link_user
    short_link.save if valid?
  end

  def short_link
    @short_link ||= ShortLink.find_or_initialize_by long_url: long_url,
      company: user.company
  end

  private
    def valid_short_link?
      unless short_link.valid?
        short_link.errors.each{ |attribute, message| errors.add(attribute, message) }
      end
    end

    def user
      @user ||= User.find user_id
    end

    def set_short_link_user
      short_link.user = user unless short_link.user&.present?
    end
end
