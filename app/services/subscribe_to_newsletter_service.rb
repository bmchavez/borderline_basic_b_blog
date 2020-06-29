class SubscribeToNewsletterService
  def initialize(user)
    @user = user
    if @user.subscribed == true
      @status = "subscribed"
    else
      @status = "unsubscribed"
    end
    @gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'])
    @audience_id = ENV['MAILCHIMP_AUDIENCE_ID']
  end

  def call
    @gibbon.lists(@audience_id).members.create(
      body: {
        email_address: @user.email,
        status: @status,
        merge_fields: {
          FNAME: @user.first_name,
          LNAME: @user.last_name
        }
      }
    )
  end
end

