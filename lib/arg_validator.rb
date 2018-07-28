class ArgValidator
  VALID_EXTENSIONS = %w[.log .txt .rb]
  private_constant :VALID_EXTENSIONS
  
  def initialize(args: [])
    @args = args
  end

  def single_file_given?
    single_arg? && file?(arg: @args[0])
  end

  private

  def single_arg?
		@args.count == 1
  end

  def file?(arg: nil)
    return false unless arg
    VALID_EXTENSIONS.any? { |ext| arg&.include?(ext) }
  end
end
