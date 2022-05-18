require "logger"

module LogHelper
  # Classe criada apenas para evitar ter que instanciar LogHelper.logger sempre que precisar do logger, e usar 
  # apenas o logger.  
  def logger
    LogHelper.logger
  end
end
