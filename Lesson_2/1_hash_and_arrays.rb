months = {
    january: 31,
    february: 28,
    march: 31,
    april: 30,
    may: 31,
    june: 30,
    jule: 31,
    august: 31,
    september: 30,
    oktober: 31,
    novebmer: 30,
    december: 31
}

months.each { |key, value| puts "#{key} = #{value}" if value <= 30 }
