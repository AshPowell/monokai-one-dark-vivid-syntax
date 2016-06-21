Dom = require('./dom')

module.exports =
  init: (state) ->

    self = @
    body = document.querySelector 'body'

    # ONCE PACKAGE IS LOADED
    if self.isLoaded('monokai-one-dark-vivid-syntax')

      # WHEN TRAILINGSPACE IS ENABLED OR DISABLED
      atom.config.onDidChange 'monokai-one-dark-vivid-syntax.trailingSpaceHighlight', (value) ->
        body.classList.toggle 'trailingSpace', value.newValue

      self.refresh()      

  # CHECKS IF A PACKAGE IS LOADED
  isLoaded: (which) ->
    return atom.packages.isPackageLoaded(which)

  # WHEN PACKAGE ACTIVATES
  onActivate: (which, cb) ->
    atom.packages.onDidActivatePackage (pkg) ->
      if pkg.name == which
        cb pkg

  # WHEN PACKAGE DEACTIVATES
  onDeactivate: (which, cb) ->
    atom.packages.onDidDeactivatePackage (pkg) ->
      if pkg.name == which
        cb pkg

  # GET INFO ABOUT OUR PACKAGE
  package: atom.packages.getLoadedPackage('monokai-one-dark-vivid-syntax')

  # DETERMINE IF A SPECIFIC PACKAGE HAS BEEN LOADED
  packageInfo: (which) ->
    return atom.packages.getLoadedPackage which

  # RELOAD WHEN SETTINGS CHANGE
  refresh: ->
    self = @
    self.package.deactivate()
    setImmediate ->
      return self.package.activate()
