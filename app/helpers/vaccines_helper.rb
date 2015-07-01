module VaccinesHelper

  # alternate label for displaying a route
  def display_route(route)
    routes = {
      "Oral" => "Oral",
      "ID" => "Intradermal",
      "SC" => "Subcutaneous",
      "IM" => "Intramuscular",
    }
    return routes[route]
  end

  # capitalize when displaying a dosage
  def display_dosage(dosage)
    return dosage.capitalize
  end

  # convery age stored in weeks to more meaningful format
  def display_age(age)
    years = months = weeks = 0
    if age <= 24
      return "#{age} weeks"
    else
      months = age / 4
      weeks = age % 4 == 0 ? 0 : age % 4
      if months > 11
        years = months / 12
        months = months % 12 == 0 ? 0 : months % 12
      end
      result = ""
      if (years > 0 )
        result = result + pluralize(years, "year")
      end
      if (months > 0)
        result = result + " " + pluralize(months, "month")
      end
      if (weeks > 0)
        result = result + " " + pluralize(weeks, "week")
      end
      return result
    end
  end

  # get route description text
  def get_route_description(route)
    description = {
      "Oral" => "Oral administration of vaccine makes immunization easier by 
      eliminating the need for a needle and syringe.",

      "ID" => "Intradermal (ID) injection administers the vaccine in the topmost
       layer of the skin. BCG is the only vaccine with this route of administration. 
       Intradermal injection of BCG vaccine reduces the risk of neurovascular injury.
       A short narrow needle (15 mm, 26 gauge) is needed for BCG vaccine.",

       "SC" => "Subcutaneous (SC) injection administers the vaccine into the 
       subcutaneous layer above the muscle and below the skin. A longer, wider 
       needle (commonly 25 mm, 23 gauge) is used.",

       "IM" => "Intramuscular (IM) injection administers the vaccine into the 
       muscle mass. Vaccines containing adjuvants should be injected IM to reduce 
       adverse local effects. A longer, wider needle (commonly 25 mm, 23 gauge) 
       is used.",
    }
    return description[route]
  end
end
