###################### SEPT 2016 Readings #######################
sept_2016_dates = [DateTime.parse("September 01 2016"),
                   DateTime.parse("September 02 2016"),
                   DateTime.parse("September 02 2016"),
                   DateTime.parse("September 03 2016")]
glucose_levels = [10, 16, 18, 31]

sept_2016_readings = sept_2016_dates.zip(glucose_levels)

sept_2016_readings.each do |date, level|
  Reading.create(created_at: date, glucose_level: level)
end

#################### OCT 2016 Readings ###########################################

sept_2016_dates = [DateTime.parse("October 10 2016"),
                   DateTime.parse("October 10 2016"),
                   DateTime.parse("October 10 2016"),
                   DateTime.parse("October 11 2016"),
                   DateTime.parse("October 12 2016")]
glucose_levels = [35, 40, 32, 50, 21]

sept_2016_readings = sept_2016_dates.zip(glucose_levels)

sept_2016_readings.each do |date, level|
  Reading.create(created_at: date, glucose_level: level)
end

############### NOV 2015 Readings #############################
nov_2015_dates = [DateTime.parse("November 15 2015"),
                  DateTime.parse("November 16 2015"),
                  DateTime.parse("November 17 2015")]
glucose_levels = [3, 12, 41]

november_2015_readings = nov_2015_dates.zip(glucose_levels)

november_2015_readings.each do |date, level|
  Reading.create(created_at: date, glucose_level: level)
end

############### NOV 2016 Readings #############################
nov_2016_dates = [DateTime.parse("November 01 2016"),
                  DateTime.parse("November 01 2016"),
                  DateTime.parse("November 02 2016"),
                  DateTime.parse("November 02 2016"),
                  DateTime.parse("November 02 2016"),
                  DateTime.parse("November 02 2016"),
                  DateTime.parse("November 03 2016")]
glucose_levels = [12, 16, 14, 18, 21, 15, 20]

november_2016_readings = nov_2016_dates.zip(glucose_levels)

november_2016_readings.each do |date, level|
  Reading.create(created_at: date, glucose_level: level)
end
