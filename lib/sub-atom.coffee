###
  lib/sub-atom.coffee
###

{CompositeDisposable, Disposable} = require 'atom'
{$} = require 'space-pen'

module.exports = 
class SubAtom
  
  constructor: ->
    @disposables = new CompositeDisposable
  
  add: (target, event, selector, handler) -> args  
    if target instanceof Disposable
      disposables.add target
      return
      
    if not target instanceof jQuery
      target = $ target
      
    if not handler 
      handler = selector
      subscription = target.on event, handler
    else
      subscription = target.on event, selector, handler
      
    @disposables.add new Disposable ->
      subscription.off event, handler
        
  dispose: -> disposables.dispose()
    