months = {
            january: 31,
            february: 28,
            march: 31,
            april: 30,
            may: 31,
            june: 30,
            jule: 31,
            august: 30,
            september: 31,
            oktober: 30,
            novebmer: 31,
            december: 30
         }

months.each { |key, value| puts "#{key} = #{value}" if value <= 30 }
