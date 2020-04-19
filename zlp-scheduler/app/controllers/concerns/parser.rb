require 'yaml'

class Parser
    def initialize(yaml)
        @courses = YAML.load_file(yaml)        
    end

    attr_accessor :courses

    def generate_schedule
        schedule = Array.new

        @courses.each do |course|
            # fill in the schedule for each given course
            day = parse_day(course["meeting_days"])
            start_time = parse_time(course["meetingtime_start"])
            end_time = parse_time(course["meetingtime_end"])
            schedule = insert_course(schedule, day, start_time, end_time)
        end
    end

    # private

    # return the index corresponding to the the time in the yaml file
    def parse_time(time)
        puts time.hour
        puts time.min
        return time # change later
    end

    # return the index corresponding to the day
    # this might be more than one day so need to adjust for that most likely
    def parse_day(day)
        if day == 'M'
            return 0
        elsif day == 'T'
            return 1
        elsif day == 'W'
            return 2
        elsif day == 'R'
            return 3
        elsif day == 'F'
            return 4
        else 
            return 0 # not sure what to make the default case
        end
    end

    def insert_course(schedule, day, start_time, end_time)
        # need to check each of the boxes in schedule to one if that slot is filled by a class
        return schedule # change this to new_schedule
    end

end

parser = Parser.new('files/course.yml')
course = parser.courses["one"]

# puts parser.parse_time(course["meetingtime_start"])

parser.courses.each do |course|
    puts course
    # puts course["meeting_days"]
end

'''
puts course["meetingtime_start"]
puts course["meetingtime_end"]
puts course["meeting_days"]
puts course["meetingtime_start"].hour
puts course["meetingtime_end"].hour
'''
