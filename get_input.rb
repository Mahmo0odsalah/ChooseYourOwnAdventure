require 'byebug'
module GetInput
  AVAILABLE_VALIDATIONS = {
    any: /.*/,
    non_empty: /.+/,
    inclusion: proc { |input, list| list.include?(input) }
  }.freeze

  def self.get_input(message, validations)
    loop do
      puts message
      input = gets.strip
      if validate_input(input, validations)
        return input
      else
        puts 'Try that again please'
      end
    end
  end

  def self.validate_input(input, validations)
    validations.all? { |v| apply_validation(input, v) }
  end

  def self.apply_validation(input, validation)
    name = validation[:name]
    extra = validation[:extra]
    value = AVAILABLE_VALIDATIONS[name]
    raise('Unknown validation') if value.nil?

    if value.is_a? Regexp
      value.match?(input)
    elsif value.is_a? Proc
      value.call(input, extra)
    else raise("Unknown validation type: #{value.class} for validation: #{name}")
    end
  end
end
