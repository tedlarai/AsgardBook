class  SelfRequestProhibition < ActiveModel::Validator
  def validate(record)
    if record.sender == record.receiver
      record.errors[:receiver] << \
        "User cannot send him/herself a friendship request"
    end
  end
end
