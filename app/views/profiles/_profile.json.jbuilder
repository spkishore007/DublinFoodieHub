json.extract! profile, :id, :firstName, :lastName, :building, :street, :city, :pincode, :mobile, :dateOfBirth, :email, :idProof, :member_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
