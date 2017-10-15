command: "echo $(\"$HOME/Library/Application Support/Übersicht/widgets/bar.widget/frontapplicationname\")"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <div class="container" style="display: inline-block;">
    <div class="app">
      <span style="height: 30px;"></span>
      <p></p>
    </div>
      </div>
    </div>
  </div>
  """

update: (output, el) ->
  $(".launcher-container", el).children('div').each ->
    currentName = "#{$(@).attr("id")}\n".replace /_/, " "
    console.log(currentName)
    if output == currentName
      $(@).addClass "launcher-selected"
    else
      $(@).removeClass "launcher-selected"

  $(".app p", el).text("#{output}")


# afterRender: (domEl) ->
#  $(domEl).on 'click', '#Firefox', => @run "open /Applications/Firefox.app"
#  $(domEl).on 'click', '#iTerm2', => @run "open /Applications/iTerm.app"

style: """
  overflow: hidden !important;
  -webkit-user-select: none !important;

  color: #ffffff;
  font: 13px lemon;
  font-smooth: never;
  -webkit-font-smoothing: none;
  height: 30px;
  overflow:auto;
  top: 0px;
  min-height: 30px;

  p {
    line-height: 14px;
    margin-top: 8px;
    margin-bottom: 8px;
  }

  .app {
    background-color: #37BF8D;
    left: 0px;
    float: left;;
    padding-left: 20px;
    padding-right: 20px;
  }

  .launcher {
    background-color: #5394C9 !important;
    float: left;
    padding-left: 30px;
    padding-right: 30px;
  }

  .launcher-selected {
    background-color: #72A7D3 !important;
  }
"""
