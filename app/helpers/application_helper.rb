module ApplicationHelper
  def format_rupiah(amount)
    number_to_currency(amount, unit: "Rp ", separator: ",", delimiter: ".", precision: 0)
  end

end
