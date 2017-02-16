refreshFrequency: '1s'

# ToDoList Entries:
# Use a '-' for an open item
# Use a '+' for a completed item
todolistfile = '~/ToDo.list'

command: "cat #{todolistfile} | awk 'BEGIN {print \"<ol>\"} /^[-]/ {print \"<li>\"substr($0,2)\"</li>\"} /^[+]/ {print \"<li class=\\\"completed\\\">\"substr($0,2)\"</li>\"} END {print \"</ol>\"}'"

style: """
  top: 60px
  left: 50px
  color: #fff
  font-family: brush script m7

  h
    display: block
    text-align: center
    font-size: 24px
    font-weight: 100

  div
    display: block
    text-shadow: 0 0 1px rgba(#000, 0.5)
    font-size: 14px

  ol
    padding-left: 20px

  .completed
    color: #888
    font-weight: regular
    text-decoration:line-through
"""


render: -> """
  <h>ToDoList</h>
  <div class='todolist'></div>
"""

update: (output, domEl) ->
  $(domEl).find('.todolist').html(output)
