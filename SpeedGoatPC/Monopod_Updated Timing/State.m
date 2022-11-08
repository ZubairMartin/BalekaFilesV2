classdef State < Simulink.IntEnumType
    enumeration
        Rest(0),
        Flight(1),
        Loading(2),
        Compression(3),
        Thrust(4),
        Unloading(5)
   end
end