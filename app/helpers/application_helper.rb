module ApplicationHelper
  def get_coords(location)
    formatted_address = location.join(" ")

    geocoder_result = Geocoder.search(formatted_address).first
    geocoder_result.data["geometry"]["location"] if (geocoder_result && geocoder_result.data && geocoder_result.data["geometry"])
  end

  def result_coords(results)
    addresses = results.businesses.map do |result|
      puts result.location.display_address
      get_coords(result.location.display_address)
    end

    names = results.businesses.map do |result|
      result.name
    end

    {
      "addresses" => addresses,
      "names" => names
    }
  end

end
