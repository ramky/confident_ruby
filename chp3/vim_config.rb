class VimConfigFile
  def initialize
    @filename = "#{ENV['HOME']}/.vimrc"
  end

  def to_path
    @filename
  end
end

vim_config = VimConfigFile.new
File.open(vim_config).lines.count # => 198 # !> IO#lines is deprecated; use #each_line instead
