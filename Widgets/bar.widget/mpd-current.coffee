command: "echo $(\"$HOME/Library/Application Support/Übersicht/widgets/bar.widget/mpcbar\")"

refreshFrequency: 1000 # ms

render: (output) ->
  """
  <link rel="stylesheet" href="./assets/font-awesome/css/font-awesome.min.css" />
  <div class="np"
    <span style="height: 30px;"></span>
    <p style="line-height: 14px; margin-top: 8px; margin-bottom: 8px; white-space: pre;">/p>
  </div>
  """

update: (output, el) ->
    $(".np p", el).text("♪  #{output}")

afterRender: (domEl) ->
  $(domEl).on 'click', '.np', => @run "/usr/local/bin/mpc toggle"

style: """
  overflow: hidden !important;
  -webkit-user-select: none !important;

  color: #CCCCCC
  font: 13px lemon
  font-smooth: never;
  -webkit-font-smoothing: none;
  height: 30px
  overflow:auto
  background-color: #3C4F5B
  padding-left: 20px
  padding-right: 20px
  right: 0px
  top: 0px
"""
