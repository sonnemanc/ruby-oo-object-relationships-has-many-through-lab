class Doctor

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
            visit.doctor == self
          end
    end

    def new_appointment(date, patient)
        Appointment.new(date, self, patient)
    end

    def patients
        appointments.map do |visit|
            visit.patient
        end
    end

    def new_appointment(date, patient)
        Appointment.new(date, patient, self)
    end
end
