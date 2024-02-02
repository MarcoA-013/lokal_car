# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
# to include Jquery 
pin "jquery", to: "jquery.min.js", preload: true
pin "@hotwired/jquery", to: "jquery.js"

# to include JMask
pin "jquery-mask-plugin", to: "jquery.mask.min.js", preload: true
# to include Bootstrap
pin "bootstrap", to: "bootstrap.min.js", preload: true


pin_all_from "app/javascript/controllers", under: "controllers"
