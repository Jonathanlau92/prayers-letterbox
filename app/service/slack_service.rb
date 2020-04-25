class SlackService
  NAME_AND_ICON = {
      username: 'Prayer Letterbox',
  }

  GOOD = 'good'
  WARNING = 'warning'
  DANGER = 'danger'

  def initialize(channel = ENV['SLACK_WEBHOOK_CHANNEL'])
    @uri = URI(ENV['SLACK_WEBHOOK_URL'])
    @channel = channel
  end

  def report_spam_notification(prayer)
    params = {
      attachments: [
        {
          title: 'Prayer reported as spam',
          fallback: 'Prayer ID: ' + prayer.id.to_s,
          color: WARNING,
          fields: [
            {
              title: 'Prayer item',
              value: prayer.request
            },
            {
              title: 'Prayer particular (if any)',
              value: prayer.user_particulars['name'].present? ? prayer.user_particulars['name'] : "Anonymous"
            },
            {
              title: 'Created Time',
              value: prayer.created_at.strftime("Printed on %m/%d/%Y, at %I:%M%p")
            }
          ]
        }
      ]
    }
    @params = generate_payload(params)
    self
  end

  def deliver
    begin
      Net::HTTP.post_form(@uri, @params)
    rescue => e
      Rails.logger.error("BespokeSlackbotService: Error when sending: #{e.message}")
    end
  end

  private

  def generate_payload(params)
    {
      payload: NAME_AND_ICON
        .merge(channel: @channel)
        .merge(params).to_json
    }
  end
end