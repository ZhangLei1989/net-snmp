module Net
  module SNMP
    class Varbind
      attr_accessor :struct
      
      def initialize(ptr)
        @struct = Net::SNMP::Wrapper::VariableList.new(ptr)
      end
      
      def self.from_pointer(ptr)
        new(ptr)
      end
      
      def object_type
        @struct.type
      end

      def value
        case object_type
        when Net::SNMP::ASN_OCTET_STR
          struct.val[:string].read_string(struct.val_len)
        when Net::SNMP::ASN_INTEGER
          struct.val[:integer].read_int
        end
      end
    end
  end
end