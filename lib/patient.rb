class Patient

    attr_accessor   :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select do |visit|
            visit.patient == self
            
        end
    end

    def doctors
        appointments.map do |visit|
            visit.doctor
        end
    end

    def new_appointment(date, doctor)
        Appointment.new(date, self, doctor)
    end


end

