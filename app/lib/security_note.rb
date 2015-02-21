module SecurityNote
  module_function


  def parse(text)
    cve_and_description, url, mitigation = text.split("\n")
    cve, description = cve_and_description.split(' - ')
    {
      cve: cve,
      url: url,
      description: description,
      mitigation: mitigation
    }
  end

end
