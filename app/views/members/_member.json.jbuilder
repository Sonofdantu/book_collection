json.extract! member, :id, :totalPoints, :full_name, :email, :position,
              :created_at, :updated_at
json.url member_url(member, format: :json)
