module.exports =
  activate: (state) ->
    require( atom.packages.getLoadedPackage('monokai-one-dark-vivid-syntax').path + '/lib/settings').init(state)
