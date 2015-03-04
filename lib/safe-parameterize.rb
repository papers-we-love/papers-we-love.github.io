require 'active_support/inflector'
require 'active_support/inflector/transliterate'

# Parameterize a string preserving any multibyte characters
def safe_parameterize(str)
  sep = '-'

  # Reimplementation of http://api.rubyonrails.org/classes/ActiveSupport/Inflector.html#method-i-parameterize
  # that preserves un-transliterate-able multibyte chars.
  parameterized_string = ActiveSupport::Inflector.transliterate(str.to_s).downcase
  parameterized_string.gsub!(/[^a-z0-9\-_\?]+/, sep)

  parameterized_string.chars.to_a.each_with_index do |char, i|
    if char == '?' && str[i].bytes.count != 1
      parameterized_string[i] = str[i]
    end
  end

  re_sep = Regexp.escape(sep)
  # No more than one of the separator in a row.
  parameterized_string.gsub!(/#{re_sep}{2,}/, sep)
  # Remove leading/trailing separator.
  parameterized_string.gsub!(/^#{re_sep}|#{re_sep}$/, '')

  parameterized_string
end
