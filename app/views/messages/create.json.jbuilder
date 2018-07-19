json.body @message.body
json.image @message.image_url
json.user_name @message.user.name
json.created @message.created_at.strftime('%Y/%m/%d/ %H:%M')
