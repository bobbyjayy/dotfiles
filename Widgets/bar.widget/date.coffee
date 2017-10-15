command: "date +\"%A, %B %-e`\"$HOME/Library/Application Support/Übersicht/widgets/bar.widget/daysuffix\"`  •  `\"$HOME/Library/Application Support/Übersicht/widgets/bar.widget/timebar\"`\""

refreshFrequency: 10000

render: (output) ->
  """
  <link rel="stylesheet" href="./bar.widget/assets/font-awesome/css/font-awesome.min.css">
  <div class="date"
    <span style="height: 30px;"></span>
    <p style="line-height: 14px; margin-top: 8px; margin-bottom: 8px; white-space: pre;"></p>
  </div>
  """

update: (output, el) ->
    $(".date p", el).text("#{output}")

style: """
  overflow: hidden !important;
  -webkit-user-select: none !important;

  text-align: center
  color: #CCCCCC
  font: 13px lemon
  font-smooth: never;
  -webkit-font-smoothing: none;
  height: 30px
  overflow:auto
  right: 0px
  left: 25%
  width: 50%
"""
