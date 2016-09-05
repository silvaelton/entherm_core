module StringSupport

  def cnpj_format
    @cnpj  = self
    @cnpj  =~ /(\d{2})\.?(\d{3})\.?(\d{3})\.?(\d{4})-?(\d{2})/
    @cnpj  = "#{$1}.#{$2}.#{$3}/#{$4}-#{$5}"
  end

  def cnpj_unformat
    self.gsub('.','').gsub('-','').gsub('/','')
  end

end

