class Number
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  def persisted?
    false
  end
  
  def new_record?
    true
  end
  
  attr_accessor :value
  
  validates :value, length: { in: 0..5 }
    
  def initialize value = ""
    @value = value
  end
  
  # encode: method to secretly encode integer value
  def encode integer
    # Add 8192 to the raw value, so its range is translated to [0..16383]
    integer = integer.to_i + 8192

    # create binary number and pad the integer 
    # so we will always work with 2 bytes
    binary = integer.to_s(2).rjust(16 - integer - 1, "0")

    # clear most significant bit (MSB)
    binary.insert(-8, "0")

    # convert binary number to hex value
    # pad hex so we always have 4 digits and uppercase for consisency
    hex = binary.to_i(2).to_s(16).rjust(4, "0").upcase
    
    @value = hex
  end
  
  # decode: method to decode secret hex value
  def decode hi_byte, lo_byte
    # combine the hi and lo bytes to form single buyte
    byte = hi_byte + lo_byte

    # convert hex to binary and
    binary = byte.to_i(16).to_s(2)

    # remove cleared most significant bit (MSB)
    binary.slice!(-8)
    
    # convert binary to integer and apply range offset
    integer = binary.to_i(2) - 8192
    
    @value = integer
  end
end
