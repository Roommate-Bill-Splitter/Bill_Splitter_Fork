json.portion do
  json.bill_id @portion.bill_id
  json.roommate_id @portion.roommate_id
  json.amount @portion.amount
  json.due_date @portion.due_date
  json.percentage @portion.percentage
end